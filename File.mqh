//+------------------------------------------------------------------+
//|                                                         File.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include <../Folder.mqh>
//+------------------------------------------------------------------+
//| Class CFile                                                      |
//| Usage: Control general methods for working with files            |
//+------------------------------------------------------------------+
class CFile : public CFolder
   {
protected:
    int              m_handle;   // handler for opened file
public:
                     CFile(void);
                     CFile(const string path,const bool is_common_folder);
                    ~CFile(void);
    //--- Functions for controlling variables
    int              Handle(void) {return(m_handle);}
    //--- General functions for controlling work with files
    void             Close(void);
    ulong            Size(void);
    ulong            Tell(void);
    void             Seek(const long offset,const ENUM_FILE_POSITION origin);
    void             Flush(void);
    bool             IsEnding(void);
    bool             IsLineEnding(void);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFile::CFile(void) : m_handle(INVALID_HANDLE)
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFile::CFile(const string path,const bool is_common_folder) : CFolder(path,is_common_folder),
    m_handle(INVALID_HANDLE)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFile::~CFile(void)
   {
   }
//+------------------------------------------------------------------+
//| Close the file                                                   |
//+------------------------------------------------------------------+
void CFile::Close(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- closing the file and resetting handle
        ::FileClose(m_handle);
        m_handle = INVALID_HANDLE;
       }
   }
//+------------------------------------------------------------------+
//| Get size of opened file                                          |
//+------------------------------------------------------------------+
ulong CFile::Size(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileSize(m_handle));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Get current position of pointer in file                          |
//+------------------------------------------------------------------+
ulong CFile::Tell(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileTell(m_handle));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Set position of pointer in file                                  |
//+------------------------------------------------------------------+
void CFile::Seek(const long offset,const ENUM_FILE_POSITION origin)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        ::FileSeek(m_handle,offset,origin);
   }
//+------------------------------------------------------------------+
//| Flush data from the file buffer of input-output to disk          |
//+------------------------------------------------------------------+
void CFile::Flush(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        ::FileFlush(m_handle);
   }
//+------------------------------------------------------------------+
//| Detect the end of file                                           |
//+------------------------------------------------------------------+
bool CFile::IsEnding(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileIsEnding(m_handle));
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Detect the end of string                                         |
//+------------------------------------------------------------------+
bool CFile::IsLineEnding(void)
   {
//--- checking
    if(m_handle != INVALID_HANDLE)
        return(::FileIsLineEnding(m_handle));
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
