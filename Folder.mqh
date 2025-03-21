//+------------------------------------------------------------------+
//|                                                       Folder.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include <Base/CBase.mqh>
#include <Base/SBase.mqh>
//+------------------------------------------------------------------+
//| Class CFolder                                                    |
//| Usage: Control working with folders and files                    |
//+------------------------------------------------------------------+
class CFolder : public CBase
   {
private:
    string           m_path;                // path
    string           m_folder_name;         // folder name
    bool             m_is_common_folder;    // is common folder
protected:
    int              m_handle;              // handler for opened file
public:
                     CFolder(void);
                     CFolder(const string path,const bool is_common_folder)         {Path(path,is_common_folder);}                           // set path
                    ~CFolder(void);
    //--- Functions for controlling variables
    void             Path(const string path,const bool is_common_folder = true);
    string           Path(void)                                                     {return(m_path);                                      }  // get path
    string           FolderName(void)                                               {return(m_folder_name);                               }  // get folder name
    bool             IsCommonFolder(void)                                           {return(m_is_common_folder);                          }  // get is common folder
    int              Handle(void)                                                   {return(m_handle);                                    }
    void             Handle(const int handle)                                       {m_handle = handle;                                   }
    //--- Functions for controlling work with folders
    bool             FolderExists(const string folder_name);
    bool             FolderOpen(const string folder_name);
    void             FolderClose(void);
    bool             FolderCreate(const string folder_name)                         {return(::FolderCreate(m_path + "\\" + folder_name,m_is_common_folder ? FILE_COMMON : 0));}     // create folder in path
    bool             FolderDelete(const string folder_name)                         {return(::FolderDelete(m_path + "\\" + folder_name,m_is_common_folder ? FILE_COMMON : 0));}     // delete folder in path
    bool             FolderClean(void)                                              {return(::FolderClean(m_path,m_is_common_folder ? FILE_COMMON : 0));                      }     // clean folder in path
    //--- Functions for controlling work with files
    virtual int      Open(const string file_name,const uint flags) {return(INVALID_HANDLE);}                                                                                        // open file
    virtual void     Close(void) {;}                                                                                                                                                // close file
    bool             FileExists(const string file_name)                             {return(::FileIsExist(file_name,m_is_common_folder ? FILE_COMMON : 0));                   }     // exists file in path
    bool             FileDelete(const string file_name)                             {return(::FileDelete(file_name,m_is_common_folder ? FILE_COMMON : 0));                    }     // delete file in path
    bool             FileCopy(const string source_file_name,const string target_path,const string target_file_name,const bool target_is_common_folder);
    bool             FileCut(const string source_file_name,const string target_path,const string target_file_name,const bool target_is_common_folder,const bool update_path = false);
    bool             FileRename(const string file_name,const string new_file_name);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFolder::CFolder(void) : m_path(".\\"),
    m_folder_name(""),
    m_is_common_folder(false),
    m_handle(INVALID_HANDLE)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFolder::~CFolder(void)
   {
   }
//+------------------------------------------------------------------+
//| Setting path                                                     |
//+------------------------------------------------------------------+
void CFolder::Path(const string path,const bool is_common_folder = true)
   {
//--- Check for empty path
    if(path == "")
        m_path = ".\\";
//-- seting path
    else
        m_path = path;
//--- setting is common folder
    m_is_common_folder = is_common_folder;
//--- setting folder name
    string results[];
    if(::StringSplit(m_path,'\\',results) > 0)
        m_folder_name = results[results.Size() - 1];
   }
//+------------------------------------------------------------------+
//| Checking for folder existence                                    |
//+------------------------------------------------------------------+
bool CFolder::FolderExists(const string folder_name)
   {
    string name = m_path + "\\" + folder_name;
    int flag = m_is_common_folder ? FILE_COMMON : 0;
//--- folder deleted if is empty folder
    if(::FolderDelete(name,flag))
       {
        ::FolderCreate(name,flag);
        return(true);
       }
//--- create file test in folder
    string file_test = name + "\\" + "test_exist_folder.txt";
    int handle = ::FileOpen(file_test,FILE_WRITE | FILE_TXT | flag);
    if(handle == INVALID_HANDLE)
        return(false);
    ::FileClose(handle);
    if(!::FileDelete(file_test,flag))
        return(true);
//--- folder deleted if not exists
    if(::FolderDelete(name,flag))
        return(false);
//--- folder not deleted because full folder
    return(true);
   }
//+------------------------------------------------------------------+
//| Open the folder in path                                          |
//+------------------------------------------------------------------+
bool CFolder::FolderOpen(const string folder_name)
   {
//--- checking folder name is exists
    if(FolderExists(folder_name))
       {
        //--- change path go to folder
        m_path = m_path + "\\" + folder_name;
        m_folder_name = folder_name;
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Close folder in path                                             |
//+------------------------------------------------------------------+
void CFolder::FolderClose(void)
   {
//--- changing path go to befor folder
    string folder_name = "\\" + m_folder_name;
    m_path = ::StringSubstr(m_path,0,::StringLen(m_path) - ::StringLen(folder_name));
//--- setting folder name
    string results[];
    if(::StringSplit(m_path,'\\',results) > 0)
        m_folder_name = results[results.Size() - 1];
   }
//+------------------------------------------------------------------+
//| Copy file in path                                                |
//+------------------------------------------------------------------+
bool CFolder::FileCopy(const string source_file_name,const string target_path,const string target_file_name,const bool target_is_common_folder)
   {
//--- set source and target file names
    string source = m_path + "\\" + source_file_name;
    string target = target_path + "\\" + target_file_name;
//--- checking is exists file name
    if(!FileExists(source_file_name))
        return(false);
//--- checking is exists new file in path and copy file
    if(::FileIsExist(target,target_is_common_folder ? FILE_COMMON : 0))
       {
        if(!::FileCopy(source,m_is_common_folder ? FILE_COMMON : 0,target,target_is_common_folder ? FILE_COMMON | FILE_REWRITE : FILE_REWRITE))
            return(false);
       }
    else
        if(!::FileCopy(source,m_is_common_folder ? FILE_COMMON : 0,target,target_is_common_folder ? FILE_COMMON : 0))
            return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Cut or Move file in path                                         |
//+------------------------------------------------------------------+
bool CFolder::FileCut(const string source_file_name,const string target_path,const string target_file_name,const bool target_is_common_folder,const bool update_path = false)
   {
//--- set source and target file names
    string source = m_path + "\\" + source_file_name;
    string target = target_path + "\\" + target_file_name;
//--- checking is exists file name
    if(!FileExists(source_file_name))
        return(false);
//--- checking is exists new file in path and move file
    if(::FileIsExist(target,target_is_common_folder ? FILE_COMMON : 0))
       {
        if(!::FileMove(source,m_is_common_folder ? FILE_COMMON : 0,target,target_is_common_folder ? FILE_COMMON | FILE_REWRITE : FILE_REWRITE))
            return(false);
       }
    else
        if(!::FileMove(source,m_is_common_folder ? FILE_COMMON : 0,target,target_is_common_folder ? FILE_COMMON : 0))
            return(false);
//--- checking is update path
    if(update_path)
       {
        //--- update path
        Path(target,target_is_common_folder);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Rename file in path                                              |
//+------------------------------------------------------------------+
bool CFolder::FileRename(const string file_name,const string new_file_name)
   {
//--- checking is exists new file name
    if(FileExists(new_file_name))
        return(false);
//--- moving file name to new file name
    return(FileCut(file_name,m_path,new_file_name,m_is_common_folder));
   }
//+------------------------------------------------------------------+
