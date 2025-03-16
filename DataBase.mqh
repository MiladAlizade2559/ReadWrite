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
