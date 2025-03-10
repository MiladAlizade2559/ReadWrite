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

public:
                     CFile(void);
                     CFile(const string path,const bool is_common_folder);
                    ~CFile(void);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFile::CFile(void)
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFile::CFile(const string path,const bool is_common_folder) : CFolder(path,is_common_folder)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFile::~CFile(void)
   {
   }
//+------------------------------------------------------------------+
