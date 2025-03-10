//+------------------------------------------------------------------+
//|                                                      FileBIN.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include <../File.mqh>
//+------------------------------------------------------------------+
//| Class CFileBIN                                                   |
//| Usage: Control reading and writing to binary files               |
//+------------------------------------------------------------------+
class CFileBIN : public CFile
   {
private:

public:
                     CFileBIN(void);
                     CFileBIN(const string path,const bool is_common_folder);
                    ~CFileBIN(void);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileBIN::CFileBIN(void)
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileBIN::CFileBIN(const string path,const bool is_common_folder) : CFile(path,is_common_folder)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFileBIN::~CFileBIN(void)
   {
   }
//+------------------------------------------------------------------+
