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
    string           m_write_value; // value line for write
    string           m_read_value;  // value line for read
private:
    //--- Functions to control data writing and reading
    uint             WriteLine(void);
    bool             ReadLine(void);
public:
                     CFileTXT(void);
                     CFileTXT(const string path,const bool is_common_folder);
                    ~CFileTXT(void);
    //--- Functions to control data writing variables
    uint             WriteUChar(const uchar value,const string delimiter = "\n");
    uint             WriteChar(const char value,const string delimiter = "\n");
    uint             WriteUShort(const ushort value,const string delimiter = "\n");
    uint             WriteShort(const short value,const string delimiter = "\n");
    uint             WriteUInt(const uint value,const string delimiter = "\n");
    uint             WriteInt(const int value,const string delimiter = "\n");
    uint             WriteULong(const ulong value,const string delimiter = "\n");
    uint             WriteLong(const long value,const string delimiter = "\n");
    uint             WriteFloat(const float value,const string delimiter = "\n");
    uint             WriteDouble(const double value,const string delimiter = "\n");
    uint             WriteBool(const bool value,const string delimiter = "\n");
    uint             WriteColor(const color value,const string delimiter = "\n");
    uint             WriteDateTime(const datetime value,const string delimiter = "\n");
    uint             WriteString(const string value,const string delimiter = "\n");
    template<typename T>
    uint             WriteEnum(const T value,const string delimiter = "\n");
    template<typename T>
    uint             WriteObject(T &value,const string delimiter_between_var = ",",const string delimiter_end = "\n",const bool write_names = false);
    //--- Functions to control data writing array variables
    uint             WriteUCharArray(const uchar &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteCharArray(const char &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteUShortArray(const ushort &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteShortArray(const short &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteUIntArray(const uint &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteIntArray(const int &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteULongArray(const ulong &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteLongArray(const long &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteFloatArray(const float &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteDoubleArray(const double &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteBoolArray(const bool &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteColorArray(const color &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteDateTimeArray(const datetime &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    uint             WriteStringArray(const string &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    template<typename T>
    uint             WriteEnumArray(const T &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false);
    template<typename T>
    uint             WriteObjectArray(T &array[],const string delimiter_between_var = ",",const string delimiter_between = "\n",const string delimiter_end = "\n",const bool write_names = false,const bool write_size = false);
    //--- Functions to control data reading variables
    bool             ReadUChar(uchar &value,const string delimiter = "\n");
    bool             ReadChar(char &value,const string delimiter = "\n");
    bool             ReadUShort(ushort &value,const string delimiter = "\n");
    bool             ReadShort(short &value,const string delimiter = "\n");
    bool             ReadUInt(uint &value,const string delimiter = "\n");
    bool             ReadInt(int &value,const string delimiter = "\n");
    bool             ReadULong(ulong &value,const string delimiter = "\n");
    bool             ReadLong(long &value,const string delimiter = "\n");
    bool             ReadFloat(float &value,const string delimiter = "\n");
    bool             ReadDouble(double &value,const string delimiter = "\n");
    bool             ReadBool(bool &value,const string delimiter = "\n");
    bool             ReadColor(color &value,const string delimiter = "\n");
    bool             ReadDateTime(datetime &value,const string delimiter = "\n");
    bool             ReadString(string &value,const string delimiter = "\n");
    template<typename T>
    bool             ReadEnum(T &value,const string delimiter = "\n");
    template<typename T>
    bool             ReadObject(T &value,const string delimiter_between_var = ",",const string delimiter_end = "\n",const bool read_names = false);
    //--- Functions to control data reading array variables
    int              ReadUCharArray(uchar &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadCharArray(char &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadUShortArray(ushort &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadShortArray(short &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadUIntArray(uint &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadIntArray(int &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadULongArray(ulong &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadLongArray(long &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadFloatArray(float &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadDoubleArray(double &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadBoolArray(bool &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadColorArray(color &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadDateTimeArray(datetime &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    int              ReadStringArray(string &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    template<typename T>
    int              ReadEnumArray(T &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY);
    template<typename T>
    int              ReadObjectArray(T &array[],const string delimiter_between_var = ",",const string delimiter_between = "\n",const string delimiter_end = "\n",const bool read_names = false,const int read_size = WHOLE_ARRAY);
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileTXT::CFileTXT(void) : m_read_value("")
   {
   }
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CFileTXT::CFileTXT(const string path,const bool is_common_folder) : m_read_value(""),
    CFile(path,is_common_folder)
   {
   }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CFileTXT::~CFileTXT(void)
   {
   }
//+------------------------------------------------------------------+
//| Write a variable m_write_value                                   |
//+------------------------------------------------------------------+
uint CFileTXT::WriteLine(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        uint ret = ::FileWrite(m_handle,m_write_value);
        //--- empty variable
        m_write_value = "";
        return(ret);
       }
    m_write_value = "";
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Read a variable m_read_value                                     |
//+------------------------------------------------------------------+
bool CFileTXT::ReadLine(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        m_read_value = "";
        ::ResetLastError();
        if(!FileIsEnding(m_handle))
           {
            m_read_value = ::FileReadString(m_handle);
            return(::GetLastError() == 0);
           }
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of uchar type                                   |
//+------------------------------------------------------------------+
uint CFileTXT::WriteUChar(const uchar value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of char type                                    |
//+------------------------------------------------------------------+
uint CFileTXT::WriteChar(const char value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of ushort type                                  |
//+------------------------------------------------------------------+
uint CFileTXT::WriteUShort(const ushort value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of short type                                   |
//+------------------------------------------------------------------+
uint CFileTXT::WriteShort(const short value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of uint type                                    |
//+------------------------------------------------------------------+
uint CFileTXT::WriteUInt(const uint value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of int type                                     |
//+------------------------------------------------------------------+
uint CFileTXT::WriteInt(const int value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of ulong type                                   |
//+------------------------------------------------------------------+
uint CFileTXT::WriteULong(const ulong value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of long type                                    |
//+------------------------------------------------------------------+
uint CFileTXT::WriteLong(const long value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of float type                                   |
//+------------------------------------------------------------------+
uint CFileTXT::WriteFloat(const float value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of double type                                  |
//+------------------------------------------------------------------+
uint CFileTXT::WriteDouble(const double value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of bool type                                    |
//+------------------------------------------------------------------+
uint CFileTXT::WriteBool(const bool value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of color type                                   |
//+------------------------------------------------------------------+
uint CFileTXT::WriteColor(const color value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of datetime type                                |
//+------------------------------------------------------------------+
uint CFileTXT::WriteDateTime(const datetime value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of string type                                  |
//+------------------------------------------------------------------+
uint CFileTXT::WriteString(const string value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,(string)value + delimiter));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of an enumeration type                          |
//+------------------------------------------------------------------+
template<typename T>
uint CFileTXT::WriteEnum(const T value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- write
        return(::FileWriteString(m_handle,StringFormat("%s(%d)%s",EnumToString(value),value,delimiter)));
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write a variable of an class or struct object type               |
//+------------------------------------------------------------------+
template<typename T>
uint CFileTXT::WriteObject(T &value,const string delimiter_between_var = ",",const string delimiter_end = "\n",const bool write_names = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- get size variables
        int size = 0;
        //--- write name variables
        if(write_names)
           {
            //--- get names
            string names[];
            size = value.Variables(GET_NAMES,names,true);
            //--- write
            ret += WriteStringArray(names,delimiter_between_var,delimiter_end,false);
           }
        //--- get values
        string values[];
        size = value.Variables(GET_VALUES,values,true);
        //--- write
        ret += WriteStringArray(values,delimiter_between_var,delimiter_end,false);
        return(ret);
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of uchar type                        |
//+------------------------------------------------------------------+
uint CFileTXT::WriteUCharArray(const uchar &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteUChar(array[i],delimiter_between);
               }
            ret += WriteUChar(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of char type                         |
//+------------------------------------------------------------------+
uint CFileTXT::WriteCharArray(const char &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteChar(array[i],delimiter_between);
               }
            ret += WriteChar(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of ushort type                       |
//+------------------------------------------------------------------+
uint CFileTXT::WriteUShortArray(const ushort &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteUShort(array[i],delimiter_between);
               }
            ret += WriteUShort(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of short type                        |
//+------------------------------------------------------------------+
uint CFileTXT::WriteShortArray(const short &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteShort(array[i],delimiter_between);
               }
            ret += WriteShort(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of uint type                         |
//+------------------------------------------------------------------+
uint CFileTXT::WriteUIntArray(const uint &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteUInt(array[i],delimiter_between);
               }
            ret += WriteUInt(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of int type                          |
//+------------------------------------------------------------------+
uint CFileTXT::WriteIntArray(const int &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteInt(array[i],delimiter_between);
               }
            ret += WriteInt(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of ulong type                        |
//+------------------------------------------------------------------+
uint CFileTXT::WriteULongArray(const ulong &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteULong(array[i],delimiter_between);
               }
            ret += WriteULong(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of long type                         |
//+------------------------------------------------------------------+
uint CFileTXT::WriteLongArray(const long &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteLong(array[i],delimiter_between);
               }
            ret += WriteLong(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of float type                        |
//+------------------------------------------------------------------+
uint CFileTXT::WriteFloatArray(const float &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteFloat(array[i],delimiter_between);
               }
            ret += WriteFloat(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of double type                       |
//+------------------------------------------------------------------+
uint CFileTXT::WriteDoubleArray(const double &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteDouble(array[i],delimiter_between);
               }
            ret += WriteDouble(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of bool type                         |
//+------------------------------------------------------------------+
uint CFileTXT::WriteBoolArray(const bool &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteBool(array[i],delimiter_between);
               }
            ret += WriteBool(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of color type                        |
//+------------------------------------------------------------------+
uint CFileTXT::WriteColorArray(const color &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteColor(array[i],delimiter_between);
               }
            ret += WriteColor(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of datetime type                     |
//+------------------------------------------------------------------+
uint CFileTXT::WriteDateTimeArray(const datetime &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteDateTime(array[i],delimiter_between);
               }
            ret += WriteDateTime(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of string type                       |
//+------------------------------------------------------------------+
uint CFileTXT::WriteStringArray(const string &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteString(array[i],delimiter_between);
               }
            ret += WriteString(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of an enumeration type               |
//+------------------------------------------------------------------+
template<typename T>
uint CFileTXT::WriteEnumArray(const T &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            for(int i = 0; i < size - 1;i++)
               {
                ret += WriteEnum(array[i],delimiter_between);
               }
            ret += WriteEnum(array[size - 1],delimiter_end);
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of an class or struct object type    |
//+------------------------------------------------------------------+
template<typename T>
uint CFileTXT::WriteObjectArray(T &array[],const string delimiter_between_var = ",",const string delimiter_between = "\n",const string delimiter_end = "\n",const bool write_names = false,const bool write_size = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        uint ret = 0;
        //--- size of array
        int size = ArraySize(array);
        //--- check size array
        if(size > 0)
           {
            //--- write size array
            if(write_size)
                ret += WriteInt(size,delimiter_between);
            //--- write values array
            if(write_names)
               {
                //--- objects and names objects
                ret += WriteObject(array[0],delimiter_between_var,delimiter_between,true);
                for(int i = 1; i < size - 1;i++)
                   {
                    ret += WriteObject(array[i],delimiter_between_var,delimiter_between,false);
                   }
                if(size > 1)
                    ret += WriteObject(array[size - 1],delimiter_between_var,delimiter_end,false);
               }
            else
               {
                //--- objects
                for(int i = 0; i < size - 1;i++)
                   {
                    ret += WriteObject(array[i],delimiter_between_var,delimiter_between,false);
                   }
                ret += WriteObject(array[size - 1],delimiter_between_var,delimiter_end,false);
               }
            return(ret);
           }
       }
//--- failure
    return(0);
   }
//+------------------------------------------------------------------+
//| Read a variable of uchar type                                    |
//+------------------------------------------------------------------+
bool CFileTXT::ReadUChar(uchar &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (uchar)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of char type                                     |
//+------------------------------------------------------------------+
bool CFileTXT::ReadChar(char &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (char)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of ushort type                                   |
//+------------------------------------------------------------------+
bool CFileTXT::ReadUShort(ushort &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (ushort)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of short type                                    |
//+------------------------------------------------------------------+
bool CFileTXT::ReadShort(short &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (short)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of uint type                                     |
//+------------------------------------------------------------------+
bool CFileTXT::ReadUInt(uint &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (uint)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of int type                                      |
//+------------------------------------------------------------------+
bool CFileTXT::ReadInt(int &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (int)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of ulong type                                    |
//+------------------------------------------------------------------+
bool CFileTXT::ReadULong(ulong &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (ulong)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of long type                                     |
//+------------------------------------------------------------------+
bool CFileTXT::ReadLong(long &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (long)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of float type                                    |
//+------------------------------------------------------------------+
bool CFileTXT::ReadFloat(float &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (float)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of double type                                   |
//+------------------------------------------------------------------+
bool CFileTXT::ReadDouble(double &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (double)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of bool type                                     |
//+------------------------------------------------------------------+
bool CFileTXT::ReadBool(bool &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = StringCompare(StringSubstr(value_str,0,find),"true",false) == 0 ? true : false;;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of color type                                    |
//+------------------------------------------------------------------+
bool CFileTXT::ReadColor(color &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (color)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of datetime type                                 |
//+------------------------------------------------------------------+
bool CFileTXT::ReadDateTime(datetime &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (datetime)value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of string type                                   |
//+------------------------------------------------------------------+
bool CFileTXT::ReadString(string &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = value_str;
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of an enumeration type                           |
//+------------------------------------------------------------------+
template<typename T>
bool CFileTXT::ReadEnum(T &value,const string delimiter = "\n")
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get read value
        while(m_read_value == "")
            if(!ReadLine())
                return(false);
        //--- get value from the m_read_value variable
        int find = StringFind(m_read_value,delimiter,0);
        string value_str = StringSubstr(m_read_value,0,find);
        m_read_value = StringSubstr(m_read_value,StringLen(value_str) + StringLen(delimiter),-1);
        value = (T)StringSubstr(value_str,find + 1,StringLen(value_str));
        return(true);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of an class or struct object type                |
//+------------------------------------------------------------------+
template<typename T>
bool CFileTXT::ReadObject(T &value,const string delimiter_between_var = ",",const string delimiter_end = "\n",const bool read_names = false)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size variables
        int size = 0;
        //--- get types variables
        string types[],values[];
        size = value.Variables(GET_TYPES,types,true);
        //--- read name variables
        if(read_names)
           {
            //--- read
            string names[];
            if(ReadStringArray(names,delimiter_between_var,delimiter_end,size) != size)
                return(false);
           }
        //--- read value variables
        if(ReadStringArray(values,delimiter_between_var,delimiter_end,size) == size)
           {
            //--- set values to object
            value.Variables(SET_VALUES,values,true);
            return(true);
           }
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of uchar type                         |
//+------------------------------------------------------------------+
int CFileTXT::ReadUCharArray(uchar &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadUChar(array[i],delimiter_between);
               }
            ReadUChar(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of char type                          |
//+------------------------------------------------------------------+
int CFileTXT::ReadCharArray(char &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadChar(array[i],delimiter_between);
               }
            ReadChar(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of ushort type                        |
//+------------------------------------------------------------------+
int CFileTXT::ReadUShortArray(ushort &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadUShort(array[i],delimiter_between);
               }
            ReadUShort(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of short type                         |
//+------------------------------------------------------------------+
int CFileTXT::ReadShortArray(short &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadShort(array[i],delimiter_between);
               }
            ReadShort(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of uint type                          |
//+------------------------------------------------------------------+
int CFileTXT::ReadUIntArray(uint &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadUInt(array[i],delimiter_between);
               }
            ReadUInt(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of int type                           |
//+------------------------------------------------------------------+
int CFileTXT::ReadIntArray(int &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadInt(array[i],delimiter_between);
               }
            ReadInt(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of ulong type                         |
//+------------------------------------------------------------------+
int CFileTXT::ReadULongArray(ulong &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadULong(array[i],delimiter_between);
               }
            ReadULong(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of long type                          |
//+------------------------------------------------------------------+
int CFileTXT::ReadLongArray(long &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadLong(array[i],delimiter_between);
               }
            ReadLong(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of float type                         |
//+------------------------------------------------------------------+
int CFileTXT::ReadFloatArray(float &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadFloat(array[i],delimiter_between);
               }
            ReadFloat(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of double type                        |
//+------------------------------------------------------------------+
int CFileTXT::ReadDoubleArray(double &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadDouble(array[i],delimiter_between);
               }
            ReadDouble(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of bool type                          |
//+------------------------------------------------------------------+
int CFileTXT::ReadBoolArray(bool &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadBool(array[i],delimiter_between);
               }
            ReadBool(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of color type                         |
//+------------------------------------------------------------------+
int CFileTXT::ReadColorArray(color &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadColor(array[i],delimiter_between);
               }
            ReadColor(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of datetime type                      |
//+------------------------------------------------------------------+
int CFileTXT::ReadDateTimeArray(datetime &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadDateTime(array[i],delimiter_between);
               }
            ReadDateTime(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of string type                        |
//+------------------------------------------------------------------+
int CFileTXT::ReadStringArray(string &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadString(array[i],delimiter_between);
               }
            ReadString(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an enumeration type                |
//+------------------------------------------------------------------+
template<typename T>
int CFileTXT::ReadEnumArray(T &array[],const string delimiter_between = ",",const string delimiter_end = "\n",const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array
            for(int i = 0; i < size - 1; i++)
               {
                ReadEnum(array[i],delimiter_between);
               }
            ReadEnum(array[size - 1],delimiter_end);
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an class or struct object type     |
//+------------------------------------------------------------------+
template<typename T>
int CFileTXT::ReadObjectArray(T &array[],const string delimiter_between_var = ",",const string delimiter_between = "\n",const string delimiter_end = "\n",const bool read_names = false,const int read_size = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- get size array
        int size = 0;
        if(read_size > 0)
            size = read_size;
        else
           {
            //--- read size array
            ReadInt(size,delimiter_between);
           }
        //--- check size
        if(size > 0)
           {
            //--- resize array
            ArrayResize(array,size);
            //--- read array and names
            if(read_names)
               {
                ReadObject(array[0],delimiter_between_var,delimiter_between,true);
                for(int i = 1; i < size - 1; i++)
                   {
                    ReadObject(array[i],delimiter_between_var,delimiter_between,false);
                   }
                if(size > 1)
                    ReadObject(array[size - 1],delimiter_between_var,delimiter_end,false);
               }
            //--- read array
            else
               {
                for(int i = 1; i < size - 1; i++)
                   {
                    ReadObject(array[i],delimiter_between_var,delimiter_between,false);
                   }
                ReadObject(array[size - 1],delimiter_between_var,delimiter_end,false);
               }
            return(size);
           }
       }
    return(0);
   }
//+------------------------------------------------------------------+
