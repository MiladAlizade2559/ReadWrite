//+------------------------------------------------------------------+
//|                                                     DataBase.mqh |
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
//| Class CDataBase                                                  |
//| Usage: Control reading and writing to database                   |
//+------------------------------------------------------------------+
class CDataBase : public CFolder
   {
private:

public:
                     CDataBase(void);
                     CDataBase(const string path,const bool is_common_folder);
                    ~CDataBase(void);
    //--- General functions for controlling work with database
    virtual int      Open(const string file_name,const uint flags);
    virtual void     Close(void);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CDataBase::CDataBase(void)
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CDataBase::CDataBase(const string path,const bool is_common_folder) : CFolder(path,is_common_folder)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CDataBase::~CDataBase(void)
   {
   }
//+------------------------------------------------------------------+
//| Opening the database                                             |
//+------------------------------------------------------------------+
int CDataBase::Open(const string file_name,const uint flags)
   {
    uint open_flags = IsCommonFolder() ? flags | DATABASE_OPEN_COMMON : flags;
    m_handle = ::DatabaseOpen(file_name,open_flags);
    return(m_handle);
   }
//+------------------------------------------------------------------+
//| Close the database                                               |
//+------------------------------------------------------------------+
void CDataBase::Close(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- closing the database and resetting handle
        ::DatabaseClose(m_handle);
        m_handle = INVALID_HANDLE;
       }
   }
//+------------------------------------------------------------------+
