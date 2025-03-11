//+------------------------------------------------------------------+
//|                                                      FileCSV.mqh |
//|                                   Copyright 2025, Milad Alizade. |
//|                   https://www.mql5.com/en/users/MiladAlizade2559 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Milad Alizade."
#property link      "https://www.mql5.com/en/users/MiladAlizade2559"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include <../FileTXT.mqh>
//+------------------------------------------------------------------+
//| Class CFileCSV                                                   |
//| Usage: Control reading and writing to csv files                  |
//+------------------------------------------------------------------+
class CFileCSV : public CFileTXT
   {
private:

public:
                     CFileCSV(void);
                     CFileCSV(const string path,const bool is_common_folder);
                    ~CFileCSV(void);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileCSV::CFileCSV(void)
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileCSV::CFileCSV(const string path,const bool is_common_folder) : CFileTXT(path,is_common_folder)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFileCSV::~CFileCSV(void)
   {
   }
//+------------------------------------------------------------------+
