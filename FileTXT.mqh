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
public:
                     CFileTXT(void);
                     CFileTXT(const string path,const bool is_common_folder);
                    ~CFileTXT(void);
    //--- Functions for controlling work with files
    int              Open(const string file_name,const int open_flags);
    //--- Functions to control data writing
    uint             WriteLine(void);
    void             WriteChar(const char value,const string delimiter = ",");
    void             WriteShort(const short value,const string delimiter = ",");
    void             WriteInteger(const int value,const string delimiter = ",");
    void             WriteLong(const long value,const string delimiter = ",");
    void             WriteFloat(const float value,const string delimiter = ",");
    void             WriteDouble(const double value,const string delimiter = ",");
    void             WriteBool(const bool value,const string delimiter = ",");
    void             WriteDateTime(const datetime value,const string delimiter = ",");
    void             WriteColor(const color value,const string delimiter = ",");
    void             WriteString(const string value,const string delimiter = ",");
    template<typename T>
    void             WriteEnum(const T array,const string delimiter = ",");
    void             WriteCharArray(const char &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteShortArray(const short &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteIntegerArray(const int &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteLongArray(const long &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteFloatArray(const float &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteDoubleArray(const double &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteBoolArray(const bool &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteDateTimeArray(const datetime &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteColorArray(const color &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             WriteStringArray(const string &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    template<typename T>
    void             WriteEnumArray(const T &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    //--- Functions to control data reading
    bool             ReadLine(void);
    void             ReadChar(char &value,const string delimiter = ",");
    void             ReadShort(short &value,const string delimiter = ",");
    void             ReadInteger(int &value,const string delimiter = ",");
    void             ReadLong(long &value,const string delimiter = ",");
    void             ReadFloat(float &value,const string delimiter = ",");
    void             ReadDouble(double &value,const string delimiter = ",");
    void             ReadBool(bool &value,const string delimiter = ",");
    void             ReadDateTime(datetime &value,const string delimiter = ",");
    void             ReadColor(color &value,const string delimiter = ",");
    void             ReadString(string &value,const string delimiter = ",");
    template<typename T>
    void             ReadEnum(T &value,const string delimiter = ",");
    void             ReadCharArray(char &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadShortArray(short &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadIntegerArray(int &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadLongArray(long &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadFloatArray(float &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadDoubleArray(double &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadBoolArray(bool &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadDateTimeArray(datetime &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadColorArray(color &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    void             ReadStringArray(string &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
    template<typename T>
    void             ReadEnumArray(T &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY);
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
//| Opening a text file                                              |
//+------------------------------------------------------------------+
int CFileTXT::Open(const string file_name,const int open_flags)
   {
    int flags = IsCommonFolder() ? open_flags | FILE_TXT | FILE_COMMON : open_flags | FILE_TXT;
    m_handle = ::FileOpen(file_name,flags);
    return(m_handle);
   }
//+------------------------------------------------------------------+
//| Write a variable m_write_value of string type                    |
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
//| Write a variable of char or uchar type                           |
//+------------------------------------------------------------------+
void CFileTXT::WriteChar(const char value,const string delimiter = ",")
   {
//--- convert the char value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of short or ushort type                         |
//+------------------------------------------------------------------+
void CFileTXT::WriteShort(const short value,const string delimiter = ",")
   {
//--- convert the short value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of int or uint type                             |
//+------------------------------------------------------------------+
void CFileTXT::WriteInteger(const int value,const string delimiter = ",")
   {
//--- convert the int value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of long or ulong type                           |
//+------------------------------------------------------------------+
void CFileTXT::WriteLong(const long value,const string delimiter = ",")
   {
//--- convert the long value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of float type                                   |
//+------------------------------------------------------------------+
void CFileTXT::WriteFloat(const float value,const string delimiter = ",")
   {
//--- convert the float value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of double type                                  |
//+------------------------------------------------------------------+
void CFileTXT::WriteDouble(const double value,const string delimiter = ",")
   {
//--- convert the double value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of bool type                                    |
//+------------------------------------------------------------------+
void CFileTXT::WriteBool(const bool value,const string delimiter = ",")
   {
//--- convert the bool value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of datetime type                                |
//+------------------------------------------------------------------+
void CFileTXT::WriteDateTime(const datetime value,const string delimiter = ",")
   {
//--- convert the datetime value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of color type                                   |
//+------------------------------------------------------------------+
void CFileTXT::WriteColor(const color value,const string delimiter = ",")
   {
//--- convert the color value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of string type                                  |
//+------------------------------------------------------------------+
void CFileTXT::WriteString(const string value,const string delimiter = ",")
   {
//--- convert the string value to a string and add it to the m_write_value variable
    m_write_value += (string)value + delimiter;
   }
//+------------------------------------------------------------------+
//| Write a variable of an enumeration type                          |
//+------------------------------------------------------------------+
template<typename T>
void CFileTXT::WriteEnum(const T value,const string delimiter = ",")
   {
//--- convert the enum value to a string and add it to the m_write_value variable
    m_write_value += StringFormat("%s(%d)%s",EnumToString(value),value,delimiter);
   }
//+------------------------------------------------------------------+
//| Write array variables of type char or uchar                      |
//+------------------------------------------------------------------+
void CFileTXT::WriteCharArray(const char &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteChar(array[i],"");
                WriteLine();
               }
            WriteChar(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteChar(array[i],delimiter);
               }
            WriteChar(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type short or ushort                    |
//+------------------------------------------------------------------+
void CFileTXT::WriteShortArray(const short &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteShort(array[i],"");
                WriteLine();
               }
            WriteShort(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteShort(array[i],delimiter);
               }
            WriteShort(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type int or uint                        |
//+------------------------------------------------------------------+
void CFileTXT::WriteIntegerArray(const int &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteInteger(array[i],"");
                WriteLine();
               }
            WriteInteger(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteInteger(array[i],delimiter);
               }
            WriteInteger(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type long or ulong                      |
//+------------------------------------------------------------------+
void CFileTXT::WriteLongArray(const long &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteLong(array[i],"");
                WriteLine();
               }
            WriteLong(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteLong(array[i],delimiter);
               }
            WriteLong(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type float                              |
//+------------------------------------------------------------------+
void CFileTXT::WriteFloatArray(const float &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteFloat(array[i],"");
                WriteLine();
               }
            WriteFloat(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteFloat(array[i],delimiter);
               }
            WriteFloat(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type double                             |
//+------------------------------------------------------------------+
void CFileTXT::WriteDoubleArray(const double &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteDouble(array[i],"");
                WriteLine();
               }
            WriteDouble(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteDouble(array[i],delimiter);
               }
            WriteDouble(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type bool                               |
//+------------------------------------------------------------------+
void CFileTXT::WriteBoolArray(const bool &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteBool(array[i],"");
                WriteLine();
               }
            WriteBool(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteBool(array[i],delimiter);
               }
            WriteBool(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type datetime                           |
//+------------------------------------------------------------------+
void CFileTXT::WriteDateTimeArray(const datetime &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteDateTime(array[i],"");
                WriteLine();
               }
            WriteDateTime(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteDateTime(array[i],delimiter);
               }
            WriteDateTime(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type color                              |
//+------------------------------------------------------------------+
void CFileTXT::WriteColorArray(const color &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteColor(array[i],"");
                WriteLine();
               }
            WriteColor(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteColor(array[i],delimiter);
               }
            WriteColor(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type string                             |
//+------------------------------------------------------------------+
void CFileTXT::WriteStringArray(const string &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteString(array[i],"");
                WriteLine();
               }
            WriteString(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteString(array[i],delimiter);
               }
            WriteString(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Write array variables of type an enumeration                     |
//+------------------------------------------------------------------+
template<typename T>
void CFileTXT::WriteEnumArray(const T &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- size of array
        int size = ArraySize(array);
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- write size array
            WriteInteger(size,"");
            //--- write line
            WriteLine();
            //--- write value array and line
            for(int i = 0;i < size - 1;i++)
               {
                WriteEnum(array[i],"");
                WriteLine();
               }
            WriteEnum(array[size - 1],delimiter_end);
           }
        else
           {
            //--- write size array
            WriteInteger(size,delimiter);
            //--- write value array
            for(int i = 0;i < size - 1;i++)
               {
                WriteEnum(array[i],delimiter);
               }
            WriteEnum(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read a variable m_read_value of string type                      |
//+------------------------------------------------------------------+
bool CFileTXT::ReadLine(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        ::ResetLastError();
        m_read_value = "";
        m_read_value = ::FileReadString(m_handle);
        return(::GetLastError() == 0);
       }
//--- failure
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of char or uchar type                            |
//+------------------------------------------------------------------+
void CFileTXT::ReadChar(char &value,const string delimiter = ",")
   {
//--- get the char value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (char)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of short or ushort type                          |
//+------------------------------------------------------------------+
void CFileTXT::ReadShort(short &value,const string delimiter = ",")
   {
//--- get the short value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (short)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of int or uint type                              |
//+------------------------------------------------------------------+
void CFileTXT::ReadInteger(int &value,const string delimiter = ",")
   {
//--- get the int value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (int)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of long or ulong type                            |
//+------------------------------------------------------------------+
void CFileTXT::ReadLong(long &value,const string delimiter = ",")
   {
//--- get the long value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (long)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of float type                                    |
//+------------------------------------------------------------------+
void CFileTXT::ReadFloat(float &value,const string delimiter = ",")
   {
//--- get the float value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (float)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of double type                                   |
//+------------------------------------------------------------------+
void CFileTXT::ReadDouble(double &value,const string delimiter = ",")
   {
//--- get the double value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (double)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of bool type                                     |
//+------------------------------------------------------------------+
void CFileTXT::ReadBool(bool &value,const string delimiter = ",")
   {
//--- get the bool value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = StringCompare(StringSubstr(m_read_value,0,find),"true",false) == 0 ? true : false;
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of datetime type                                 |
//+------------------------------------------------------------------+
void CFileTXT::ReadDateTime(datetime &value,const string delimiter = ",")
   {
//--- get the datetime value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (datetime)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of color type                                    |
//+------------------------------------------------------------------+
void CFileTXT::ReadColor(color &value,const string delimiter = ",")
   {
//--- get the color value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = (color)StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of string type                                   |
//+------------------------------------------------------------------+
void CFileTXT::ReadString(string &value,const string delimiter = ",")
   {
//--- get the string value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    value = StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
   }
//+------------------------------------------------------------------+
//| Read a variable of an enumeration type                           |
//+------------------------------------------------------------------+
template<typename T>
void CFileTXT::ReadEnum(T &value,const string delimiter = ",")
   {
//--- get the enum value from the m_read_value variable
    int find = StringFind(m_read_value,delimiter,0);
    string value_str = StringSubstr(m_read_value,0,find);
    m_read_value = StringSubstr(m_read_value,find + StringLen(delimiter));
    find = StringFind(value_str,"(",0);
    value = (T)StringSubstr(value_str,find + 1,StringLen(value_str));
   }
//+------------------------------------------------------------------+
//| Read an array of variables of char or uchar type                 |
//+------------------------------------------------------------------+
void CFileTXT::ReadCharArray(char &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadChar(array[i],"");
                ReadLine();
               }
            ReadChar(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadChar(array[i],delimiter);
               }
            ReadChar(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of short or ushort type               |
//+------------------------------------------------------------------+
void CFileTXT::ReadShortArray(short &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadShort(array[i],"");
                ReadLine();
               }
            ReadShort(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadShort(array[i],delimiter);
               }
            ReadShort(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of int or uint type                   |
//+------------------------------------------------------------------+
void CFileTXT::ReadIntegerArray(int &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadInteger(array[i],"");
                ReadLine();
               }
            ReadInteger(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadInteger(array[i],delimiter);
               }
            ReadInteger(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of long or ulong type                 |
//+------------------------------------------------------------------+
void CFileTXT::ReadLongArray(long &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadLong(array[i],"");
                ReadLine();
               }
            ReadLong(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadLong(array[i],delimiter);
               }
            ReadLong(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of float type                         |
//+------------------------------------------------------------------+
void CFileTXT::ReadFloatArray(float &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadFloat(array[i],"");
                ReadLine();
               }
            ReadFloat(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadFloat(array[i],delimiter);
               }
            ReadFloat(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of double type                        |
//+------------------------------------------------------------------+
void CFileTXT::ReadDoubleArray(double &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadDouble(array[i],"");
                ReadLine();
               }
            ReadDouble(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadDouble(array[i],delimiter);
               }
            ReadDouble(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of bool type                          |
//+------------------------------------------------------------------+
void CFileTXT::ReadBoolArray(bool &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadBool(array[i],"");
                ReadLine();
               }
            ReadBool(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadBool(array[i],delimiter);
               }
            ReadBool(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of datetime type                      |
//+------------------------------------------------------------------+
void CFileTXT::ReadDateTimeArray(datetime &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadDateTime(array[i],"");
                ReadLine();
               }
            ReadDateTime(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadDateTime(array[i],delimiter);
               }
            ReadDateTime(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of color type                         |
//+------------------------------------------------------------------+
void CFileTXT::ReadColorArray(color &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadColor(array[i],"");
                ReadLine();
               }
            ReadColor(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadColor(array[i],delimiter);
               }
            ReadColor(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of string type                        |
//+------------------------------------------------------------------+
void CFileTXT::ReadStringArray(string &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadString(array[i],"");
                ReadLine();
               }
            ReadString(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadString(array[i],delimiter);
               }
            ReadString(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an enumeration type                |
//+------------------------------------------------------------------+
template<typename T>
void CFileTXT::ReadEnumArray(T &array[],const string delimiter = ",",const string delimiter_end = "\n",const int start_item = 0,const int items_count = WHOLE_ARRAY)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        int size = 0;
        if(::StringFind(delimiter,"\n") >= 0)
           {
            //--- read line and size array
            ReadInteger(size,"");
            ReadLine();
            //--- resize array
            ArrayResize(array,size);
            //--- read line and value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadEnum(array[i],"");
                ReadLine();
               }
            ReadEnum(array[size - 1],delimiter_end);
           }
        else
           {
            //--- read line and size array
            ReadInteger(size,delimiter);
            //--- resize array
            ArrayResize(array,size);
            //--- read value array
            for(int i = 0;i < size - 1;i++)
               {
                ReadEnum(array[i],delimiter);
               }
            ReadEnum(array[size - 1],delimiter_end);
           }
       }
   }
//+------------------------------------------------------------------+
