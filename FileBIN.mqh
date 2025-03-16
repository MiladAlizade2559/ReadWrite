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
    virtual int      Open(const string file_name,const uint flags);
    //--- Functions to control data writing variables
    uint             WriteUChar(const uchar value);
    uint             WriteChar(const char value);
    uint             WriteUShort(const ushort value);
    uint             WriteShort(const short value);
    uint             WriteUInt(const uint value);
    uint             WriteInt(const int value);
    uint             WriteULong(const ulong value);
    uint             WriteLong(const long value);
    uint             WriteFloat(const float value);
    uint             WriteDouble(const double value);
    uint             WriteBool(const bool value);
    uint             WriteColor(const color value);
    uint             WriteDateTime(const datetime value);
    uint             WriteString(const string value);
    template<typename T>
    uint             WriteEnum(const T value);
    template<typename T>
    uint             WriteObject(T &value);
    //--- Functions to control data writing array variables
    uint             WriteUCharArray(const uchar &array[]);
    uint             WriteCharArray(const char &array[]);
    uint             WriteUShortArray(const ushort &array[]);
    uint             WriteShortArray(const short &array[]);
    uint             WriteUIntArray(const uint &array[]);
    uint             WriteIntArray(const int &array[]);
    uint             WriteULongArray(const ulong &array[]);
    uint             WriteLongArray(const long &array[]);
    uint             WriteFloatArray(const float &array[]);
    uint             WriteDoubleArray(const double &array[]);
    uint             WriteBoolArray(const bool &array[]);
    uint             WriteColorArray(const color &array[]);
    uint             WriteDateTimeArray(const datetime &array[]);
    uint             WriteStringArray(const string &array[]);
    template<typename T>
    uint             WriteEnumArray(const T &array[]);
    template<typename T>
    uint             WriteObjectArray(T &array[]);
    //--- Functions to control data reading variables
    bool             ReadUChar(uchar &value);
    bool             ReadChar(char &value);
    bool             ReadUShort(ushort &value);
    bool             ReadShort(short &value);
    bool             ReadUInt(uint &value);
    bool             ReadInt(int &value);
    bool             ReadULong(ulong &value);
    bool             ReadLong(long &value);
    bool             ReadFloat(float &value);
    bool             ReadDouble(double &value);
    bool             ReadBool(bool &value);
    bool             ReadColor(color &value);
    bool             ReadDateTime(datetime &value);
    bool             ReadString(string &value);
    template<typename T>
    bool             ReadEnum(T &value);
    template<typename T>
    bool             ReadObject(T &value);
    //--- Functions to control data reading array variables
    uint             ReadUCharArray(uchar &array[]);
    uint             ReadCharArray(char &array[]);
    uint             ReadUShortArray(ushort &array[]);
    uint             ReadShortArray(short &array[]);
    uint             ReadUIntArray(uint &array[]);
    uint             ReadIntArray(int &array[]);
    uint             ReadULongArray(ulong &array[]);
    uint             ReadLongArray(long &array[]);
    uint             ReadFloatArray(float &array[]);
    uint             ReadDoubleArray(double &array[]);
    uint             ReadBoolArray(bool &array[]);
    uint             ReadColorArray(color &array[]);
    uint             ReadDateTimeArray(datetime &array[]);
    uint             ReadStringArray(string &array[]);
    template<typename T>
    uint             ReadEnumArray(T &array[]);
    template<typename T>
    uint             ReadObjectArray(T &array[]);
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
int CFileBIN::Open(const string file_name,const uint flags)
   {
    return(CFile::Open(file_name,flags | FILE_BIN));
   }
//+------------------------------------------------------------------+
//| Write a variable of uchar type                                   |
//+------------------------------------------------------------------+
uint CFileBIN::WriteUChar(const uchar value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(uchar)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of char type                                    |
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
//| Write a variable of ushort type                                  |
//+------------------------------------------------------------------+
uint CFileBIN::WriteUShort(const ushort value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(ushort)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of short type                                   |
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
//| Write a variable of uint type                                    |
//+------------------------------------------------------------------+
uint CFileBIN::WriteUInt(const uint value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(uint)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of int type                                     |
//+------------------------------------------------------------------+
uint CFileBIN::WriteInt(const int value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteInteger(m_handle,value,sizeof(int)));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of ulong type                                   |
//+------------------------------------------------------------------+
uint CFileBIN::WriteULong(const ulong value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
        return(::FileWriteLong(m_handle,value));
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of long type                                    |
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
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteString(m_handle,value,size));
       }
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
//| Write a variable of an class or struct object type               |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::WriteObject(T &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- get types and values from object
        string types[],values[];
        int size = value.Variables(GET_TYPES,types,true);
        value.Variables(GET_VALUES,values,true);
        //--- write values with types
        for(int i = 0; i < size; i++)
           {
            //--- check variable is array
            bool is_array = false;
            if(StringFind(types[i],"[",0) >= 0)
                is_array = true;
            //--- check variable is uchar type
            if(StringFind(types[i],typename(uchar),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteUChar((uchar)values[i]);
                else
                   {
                    //--- convert string to array
                    uchar array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteUCharArray(array);
                   }
                continue;
               }
            //--- check variable is char type
            if(StringFind(types[i],typename(char),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteChar((char)values[i]);
                else
                   {
                    //--- convert string to array
                    char array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteCharArray(array);
                   }
                continue;
               }
            //--- check variable is ushort type
            if(StringFind(types[i],typename(ushort),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteUShort((ushort)values[i]);
                else
                   {
                    //--- convert string to array
                    ushort array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteUShortArray(array);
                   }
                continue;
               }
            //--- check variable is short type
            if(StringFind(types[i],typename(short),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteShort((short)values[i]);
                else
                   {
                    //--- convert string to array
                    short array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteShortArray(array);
                   }
                continue;
               }
            //--- check variable is uint type
            if(StringFind(types[i],typename(uint),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteUInt((uint)values[i]);
                else
                   {
                    //--- convert string to array
                    uint array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteUIntArray(array);
                   }
                continue;
               }
            //--- check variable is int type
            if(StringFind(types[i],typename(int),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteInt((int)values[i]);
                else
                   {
                    //--- convert string to array
                    int array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteIntArray(array);
                   }
                continue;
               }
            //--- check variable is ulong type
            if(StringFind(types[i],typename(ulong),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteULong((ulong)values[i]);
                else
                   {
                    //--- convert string to array
                    ulong array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteULongArray(array);
                   }
                continue;
               }
            //--- check variable is long type
            if(StringFind(types[i],typename(long),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteLong((long)values[i]);
                else
                   {
                    //--- convert string to array
                    long array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteLongArray(array);
                   }
                continue;
               }
            //--- check variable is float type
            if(StringFind(types[i],typename(float),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteFloat((float)values[i]);
                else
                   {
                    //--- convert string to array
                    float array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteFloatArray(array);
                   }
                continue;
               }
            //--- check variable is double type
            if(StringFind(types[i],typename(double),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteDouble((double)values[i]);
                else
                   {
                    //--- convert string to array
                    double array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteDoubleArray(array);
                   }
                continue;
               }
            //--- check variable is bool type
            if(StringFind(types[i],typename(bool),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteBool(StringCompare(values[i],"true",false) == 0 ? true : false);
                else
                   {
                    //--- convert string to array
                    bool array[];
                    StringToBoolArray(values[i],array);
                    //--- write values array
                    ret += WriteBoolArray(array);
                   }
                continue;
               }
            //--- check variable is color type
            if(StringFind(types[i],typename(color),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteColor((color)values[i]);
                else
                   {
                    //--- convert string to array
                    color array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteColorArray(array);
                   }
                continue;
               }
            //--- check variable is datetime type
            if(StringFind(types[i],typename(datetime),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteDateTime((datetime)values[i]);
                else
                   {
                    //--- convert string to array
                    datetime array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteDateTimeArray(array);
                   }
                continue;
               }
            //--- check variable is string type
            if(StringFind(types[i],typename(string),0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteString((string)values[i]);
                else
                   {
                    //--- convert string to array
                    string array[];
                    StringToArray(values[i],array);
                    //--- write values array
                    ret += WriteStringArray(array);
                   }
                continue;
               }
            //--- check variable is enum type
            if(StringFind(types[i],"enum",0) >= 0)
               {
                //--- write value
                if(!is_array)
                    ret += WriteEnum((int)StringSubstr(values[i],StringFind(values[i],"(",0) + 1,StringLen(values[i])));
                else
                   {
                    //--- convert string to array
                    int array[];
                    StringToEnumArray(values[i],array);
                    //--- write values array
                    ret += WriteEnumArray(array);
                   }
                continue;
               }
           }
        return(ret);
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of uchar type                        |
//+------------------------------------------------------------------+
uint CFileBIN::WriteUCharArray(const uchar &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of char type                         |
//+------------------------------------------------------------------+
uint CFileBIN::WriteCharArray(const char &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of ushort type                       |
//+------------------------------------------------------------------+
uint CFileBIN::WriteUShortArray(const ushort &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of short type                        |
//+------------------------------------------------------------------+
uint CFileBIN::WriteShortArray(const short &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of uint type                         |
//+------------------------------------------------------------------+
uint CFileBIN::WriteUIntArray(const uint &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of int type                          |
//+------------------------------------------------------------------+
uint CFileBIN::WriteIntArray(const int &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of ulong type                        |
//+------------------------------------------------------------------+
uint CFileBIN::WriteULongArray(const ulong &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of long type                         |
//+------------------------------------------------------------------+
uint CFileBIN::WriteLongArray(const long &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of float type                        |
//+------------------------------------------------------------------+
uint CFileBIN::WriteFloatArray(const float &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of double type                       |
//+------------------------------------------------------------------+
uint CFileBIN::WriteDoubleArray(const double &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of bool type                         |
//+------------------------------------------------------------------+
uint CFileBIN::WriteBoolArray(const bool &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of color type                        |
//+------------------------------------------------------------------+
uint CFileBIN::WriteColorArray(const color &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of datetime type                     |
//+------------------------------------------------------------------+
uint CFileBIN::WriteDateTimeArray(const datetime &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of string type                       |
//+------------------------------------------------------------------+
uint CFileBIN::WriteStringArray(const string &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        //--- write size array
        uint ret = ::FileWriteInteger(m_handle,size,sizeof(int));
        //--- write
        if(ret == sizeof(int))
           {
            //--- write values array
            for(int i = 0;i < size;i++)
               {
                ret += WriteString(array[i]);
               }
           }
        return(ret);
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of an enumeration type               |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::WriteEnumArray(const T &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ::ArraySize(array);
        //--- write
        if(::FileWriteInteger(m_handle,size,sizeof(int)) == sizeof(int))
            return(::FileWriteArray(m_handle,array));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of an class or struct object type    |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::WriteObjectArray(T &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        //--- write size array
        uint ret = ::FileWriteInteger(m_handle,size,sizeof(int));
        //--- write
        if(ret == sizeof(int))
           {
            //--- write values array
            for(int i = 0;i < size;i++)
               {
                ret += WriteObject(array[i]);
               }
           }
        return(ret);
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Read a variable of uchar type                                    |
//+------------------------------------------------------------------+
bool CFileBIN::ReadUChar(uchar &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (uchar)::FileReadInteger(m_handle,sizeof(uchar));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of char type                                     |
//+------------------------------------------------------------------+
bool CFileBIN::ReadChar(char &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (char)::FileReadInteger(m_handle,sizeof(char));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of ushort type                                   |
//+------------------------------------------------------------------+
bool CFileBIN::ReadUShort(ushort &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (ushort)::FileReadInteger(m_handle,sizeof(ushort));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of short type                                    |
//+------------------------------------------------------------------+
bool CFileBIN::ReadShort(short &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (short)::FileReadInteger(m_handle,sizeof(short));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of uint type                                     |
//+------------------------------------------------------------------+
bool CFileBIN::ReadUInt(uint &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (uint)::FileReadInteger(m_handle,sizeof(uint));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of int type                                      |
//+------------------------------------------------------------------+
bool CFileBIN::ReadInt(int &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (int)::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of ulong type                                    |
//+------------------------------------------------------------------+
bool CFileBIN::ReadULong(ulong &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
        value = (ulong)::FileReadLong(m_handle);
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of long type                                     |
//+------------------------------------------------------------------+
bool CFileBIN::ReadLong(long &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read
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
        //--- read
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
        //--- read
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
        //--- read
        value = (bool)::FileReadInteger(m_handle,sizeof(int));
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
        //--- read
        value = (color)::FileReadInteger(m_handle,sizeof(int));
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
        //--- read
        value = (datetime)::FileReadInteger(m_handle,sizeof(int));
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
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read
            value = ::FileReadString(m_handle,size);
            return(size == ::StringLen(value));
           }
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
        //--- read
        value = (T)::FileReadInteger(m_handle,sizeof(int));
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of an class or struct object type                |
//+------------------------------------------------------------------+
template<typename T>
bool CFileBIN::ReadObject(T &value)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get types from object
        string types[],values[];
        int size = value.Variables(GET_TYPES,types,true);
        //--- resize values array
        ArrayResize(values,size);
        //--- read values with types
        for(int i = 0; i < size; i++)
           {
            //--- check variable is array
            bool is_array = false;
            if(StringFind(types[i],"[",0) >= 0)
                is_array = true;
            //--- check variable is uchar type
            if(StringFind(types[i],typename(uchar),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    uchar read_value;
                    if(!ReadUChar(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    uchar array[];
                    if(!ReadUCharArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is char type
            if(StringFind(types[i],typename(char),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    char read_value;
                    if(!ReadChar(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    char array[];
                    if(!ReadCharArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is ushort type
            if(StringFind(types[i],typename(ushort),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    ushort read_value;
                    if(!ReadUShort(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    ushort array[];
                    if(!ReadUShortArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is short type
            if(StringFind(types[i],typename(short),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    short read_value;
                    if(!ReadShort(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    short array[];
                    if(!ReadShortArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is uint type
            if(StringFind(types[i],typename(uint),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    uint read_value;
                    if(!ReadUInt(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    uint array[];
                    if(!ReadUIntArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is int type
            if(StringFind(types[i],typename(int),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    int read_value;
                    if(!ReadInt(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    int array[];
                    if(!ReadIntArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is ulong type
            if(StringFind(types[i],typename(ulong),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    ulong read_value;
                    if(!ReadULong(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    ulong array[];
                    if(!ReadULongArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is long type
            if(StringFind(types[i],typename(long),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    long read_value;
                    if(!ReadLong(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    long array[];
                    if(!ReadLongArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is float type
            if(StringFind(types[i],typename(float),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    float read_value;
                    if(!ReadFloat(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    float array[];
                    if(!ReadFloatArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is double type
            if(StringFind(types[i],typename(double),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    double read_value;
                    if(!ReadDouble(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    double array[];
                    if(!ReadDoubleArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is bool type
            if(StringFind(types[i],typename(bool),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    bool read_value;
                    if(!ReadBool(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    bool array[];
                    if(!ReadBoolArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = BoolArrayToString(array);
                   }
                continue;
               }
            //--- check variable is color type
            if(StringFind(types[i],typename(color),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    color read_value;
                    if(!ReadColor(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    color array[];
                    if(!ReadColorArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is datetime type
            if(StringFind(types[i],typename(datetime),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    datetime read_value;
                    if(!ReadDateTime(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    datetime array[];
                    if(!ReadDateTimeArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is string type
            if(StringFind(types[i],typename(string),0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    string read_value;
                    if(!ReadString(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = (string)read_value;
                   }
                else
                   {
                    //--- read values array
                    string array[];
                    if(!ReadStringArray(array))
                        return(false);
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array);
                   }
                continue;
               }
            //--- check variable is enum type
            if(StringFind(types[i],"enum",0) >= 0)
               {
                if(!is_array)
                   {
                    //--- read value
                    int read_value;
                    if(!ReadEnum(read_value))
                        return(false);
                    //--- convert value to string and set to values array
                    values[i] = StringFormat("(%d)",read_value);
                   }
                else
                   {
                    //--- read values array
                    int array[];
                    if(!ReadEnumArray(array))
                        return(false);
                    //--- convert enum to string
                    string array_enum[];
                    ArrayResize(array_enum,ArraySize(array));
                    for(int e = 0;e < ArraySize(array_enum);e++)
                       {
                        array_enum[e] = StringFormat("(%d)",array[e]);
                       }
                    //--- convert array to string and set to values array
                    values[i] = ArrayToString(array_enum);
                   }
                continue;
               }
           }
        value.Variables(SET_VALUES,values,true);
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of uchar type                         |
//+------------------------------------------------------------------+
uint CFileBIN::ReadUCharArray(uchar &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of char type                          |
//+------------------------------------------------------------------+
uint CFileBIN::ReadCharArray(char &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of ushort type                        |
//+------------------------------------------------------------------+
uint CFileBIN::ReadUShortArray(ushort &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of short type                         |
//+------------------------------------------------------------------+
uint CFileBIN::ReadShortArray(short &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of uint type                          |
//+------------------------------------------------------------------+
uint CFileBIN::ReadUIntArray(uint &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of int type                           |
//+------------------------------------------------------------------+
uint CFileBIN::ReadIntArray(int &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of ulong type                         |
//+------------------------------------------------------------------+
uint CFileBIN::ReadULongArray(ulong &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of long type                          |
//+------------------------------------------------------------------+
uint CFileBIN::ReadLongArray(long &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of float type                         |
//+------------------------------------------------------------------+
uint CFileBIN::ReadFloatArray(float &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of double type                        |
//+------------------------------------------------------------------+
uint CFileBIN::ReadDoubleArray(double &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of bool type                          |
//+------------------------------------------------------------------+
uint CFileBIN::ReadBoolArray(bool &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of color type                         |
//+------------------------------------------------------------------+
uint CFileBIN::ReadColorArray(color &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of datetime type                      |
//+------------------------------------------------------------------+
uint CFileBIN::ReadDateTimeArray(datetime &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of string type                        |
//+------------------------------------------------------------------+
uint CFileBIN::ReadStringArray(string &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            ArrayResize(array,size);
            for(int i = 0;i < size;i++)
               {
                //--- read
                if(!ReadString(array[i]))
                    return(0);
               }
            return(size);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an enumeration type                |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::ReadEnumArray(T &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            return(::FileReadArray(m_handle,array,0,size));
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an class or struct object type     |
//+------------------------------------------------------------------+
template<typename T>
uint CFileBIN::ReadObjectArray(T &array[])
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        //--- read of size
        int size = ::FileReadInteger(m_handle,sizeof(int));
        if(::GetLastError() == 0)
           {
            //--- read array
            ArrayResize(array,size);
            for(int i = 0;i < size;i++)
               {
                //--- read
                if(!ReadObject(array[i]))
                    return(0);
               }
            return(size);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
