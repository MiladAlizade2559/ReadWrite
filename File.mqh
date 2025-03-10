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
private:
    int              m_handle;   // handler for opened file
public:
                     CFile(void);
                     CFile(const string path,const bool is_common_folder);
                    ~CFile(void);
    //--- Functions for controlling variables
    int              Handle(void) {return(m_handle);}
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
