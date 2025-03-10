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
    //--- Functions for controlling work with files
    int              Open(const string file_name,const int open_flags);
    //--- Functions to control data writing
    uint             WriteChar(const char value);
    uint             WriteShort(const short value);
    uint             WriteInteger(const int value);
    uint             WriteLong(const long value);
    uint             WriteFloat(const float value);
    uint             WriteDouble(const double value);
    uint             WriteBool(const bool value);
    uint             WriteDateTime(const datetime value);
    uint             WriteColor(const color value);
    uint             WriteString(const string value);
    uint             WriteString(const string value,const int size);
    template<typename T>
    uint             WriteEnum(const T value);
    template<typename T>
    uint             WriteStruct(T &data);
    template<typename T>
    uint             WriteArray(T &array[],const int start_item = 0,const int items_count = WHOLE_ARRAY);
    //--- Functions to control data reading
    bool             ReadChar(char &value);
    bool             ReadShort(short &value);
    bool             ReadInteger(int &value);
    bool             ReadLong(long &value);
    bool             ReadFloat(float &value);
    bool             ReadDouble(double &value);
    bool             ReadBool(bool &value);
    bool             ReadDateTime(datetime &value);
    bool             ReadColor(color &value);
    bool             ReadString(string &value);
    bool             ReadString(string &value,const int size);
    template<typename T>
    bool             ReadEnum(T &value);
    template<typename T>
    uint             ReadStruct(T &data);
    template<typename T>
    uint             ReadArray(T &array[],const int start_item = 0,const int items_count = WHOLE_ARRAY);
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
//| Opening a binary file                                            |
//+------------------------------------------------------------------+
int CFileBIN::Open(const string file_name,const int open_flags)
   {
    int flags = IsCommonFolder() ? FILE_BIN | open_flags | FILE_COMMON : FILE_BIN | open_flags;
    m_handle = ::FileOpen(file_name,flags);
    return(m_handle);
   }
//+------------------------------------------------------------------+
//| Write a variable of char or uchar type                           |
//+------------------------------------------------------------------+
uint CFileBIN::WriteChar(const char value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(char)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of short or ushort type                         |
//+------------------------------------------------------------------+
uint CFileBIN::WriteShort(const short value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(short)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of int or uint type                             |
//+------------------------------------------------------------------+
uint CFileBIN::WriteInteger(const int value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(int)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of long or ulong type                           |
//+------------------------------------------------------------------+
uint CFileBIN::WriteLong(const long value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteLong(m_handle,value));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of float type                                   |
//+------------------------------------------------------------------+
uint CFileBIN::WriteFloat(const float value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteFloat(m_handle,value));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of double type                                  |
//+------------------------------------------------------------------+
uint CFileBIN::WriteDouble(const double value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteDouble(m_handle,value));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of bool type                                    |
//+------------------------------------------------------------------+
uint CFileBIN::WriteBool(const bool value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,(bool)value,sizeof(int)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of datetime type                                |
//+------------------------------------------------------------------+
uint CFileBIN::WriteDateTime(const datetime value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,(int)value,sizeof(int)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of color type                                   |
//+------------------------------------------------------------------+
uint CFileBIN::WriteColor(const color value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,(int)value,sizeof(int)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of string type                                  |
//+------------------------------------------------------------------+
uint CFileBIN::WriteString(const string value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of string
        int size = ::StringLen(value);
        //--- write
        if(::FileWriteInteger(m_handle,size) == sizeof(int))
            return(::FileWriteString(m_handle,value,size));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a part of string                                           |
//+------------------------------------------------------------------+
uint CFileBIN::WriteString(const string value,const int size)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteString(m_handle,value,size));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of an enumeration type                          |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::WriteEnum(const T value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,(int)value,sizeof(int)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an structure                                               |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::WriteStruct(T &data)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteStruct(m_handle,data));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of any type                          |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::WriteArray(T &array[],const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteArray(m_handle,array,start_item,items_count));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Read a variable of char or uchar type                            |
//+------------------------------------------------------------------+
bool CFileBIN::ReadChar(char &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = (char)::FileReadInteger(m_handle,sizeof(char));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of short or ushort type                          |
//+------------------------------------------------------------------+
bool CFileBIN::ReadShort(short &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = (short)::FileReadInteger(m_handle,sizeof(short));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of int or uint type                              |
//+------------------------------------------------------------------+
bool CFileBIN::ReadInteger(int &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = ::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of long or ulong type                            |
//+------------------------------------------------------------------+
bool CFileBIN::ReadLong(long &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = ::FileReadLong(m_handle);
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of float type                                    |
//+------------------------------------------------------------------+
bool CFileBIN::ReadFloat(float &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = ::FileReadFloat(m_handle);
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of double type                                   |
//+------------------------------------------------------------------+
bool CFileBIN::ReadDouble(double &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = ::FileReadDouble(m_handle);
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of bool type                                     |
//+------------------------------------------------------------------+
bool CFileBIN::ReadBool(bool &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = (bool)::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of datetime type                                 |
//+------------------------------------------------------------------+
bool CFileBIN::ReadDateTime(datetime &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = (datetime)::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of color type                                    |
//+------------------------------------------------------------------+
bool CFileBIN::ReadColor(color &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = (color)::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of string type                                   |
//+------------------------------------------------------------------+
bool CFileBIN::ReadString(string &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        int size = ::FileReadInteger(m_handle);
        if(::GetLastError() == 0)
           {
            value = ::FileReadString(m_handle,size);
            return(size == ::StringLen(value));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a part of string                                            |
//+------------------------------------------------------------------+
bool CFileBIN::ReadString(string &value,const int size)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        value = ::FileReadString(m_handle,size);
        return(size == ::StringLen(value));
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of an enumeration type                           |
//+------------------------------------------------------------------+
template<typename T>
bool CFileBIN::ReadEnum(T &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        value = (T)::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an structure                                                |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::ReadStruct(T &data)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileReadStruct(m_handle,data));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of any type                           |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::ReadArray(T &array[],const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileReadArray(m_handle,array,start_item,items_count));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
