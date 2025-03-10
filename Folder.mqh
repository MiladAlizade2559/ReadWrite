//+------------------------------------------------------------------+
//|                                                       Folder.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Class CFolder                                                    |
//| Usage: Control working with folders and files                    |
//+------------------------------------------------------------------+
class CFolder
   {
private:
    string           m_path;              // path
    string           m_folder_name;       // folder name
    bool             m_is_common_folder;  // is common folder
public:
                     CFolder(void);
                     CFolder(const string path,const bool is_common_folder)         {Path(path,is_common_folder);}                           // set path
                    ~CFolder(void);
    //--- Functions for controlling variables
    void             Path(const string path,const bool is_common_folder = true);
    string           Path(void)                                                     {return(m_path);                                      }  // get path
    string           FolderName(void)                                               {return(m_folder_name);                               }  // get folder name
    bool             IsCommonFolder(void)                                           {return(m_is_common_folder);                          }  // get is common folder
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFolder::CFolder(void)
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
    if(StringSplit(path,'\\',results) > 0)
        m_folder_name = results[results.Size() - 1];
   }
//+------------------------------------------------------------------+
