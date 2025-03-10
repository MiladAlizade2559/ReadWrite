//+------------------------------------------------------------------+
//|                                                      FileTXT.mqh |
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
//| Class CFileTXT                                                   |
//| Usage: Control reading and writing to text files                 |
//+------------------------------------------------------------------+
class CFileTXT : public CFile
   {
private:

public:
                     CFileTXT(void);
                     CFileTXT(const string path,const bool is_common_folder);
                    ~CFileTXT(void);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileTXT::CFileTXT(void)
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileTXT::CFileTXT(const string path,const bool is_common_folder) : CFile(path,is_common_folder)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFileTXT::~CFileTXT(void)
   {
   }
//+------------------------------------------------------------------+
