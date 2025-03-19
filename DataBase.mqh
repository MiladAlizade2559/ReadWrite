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
    string           m_table_name;     // table name
    string           m_primary_key;    // primary key in table
    uint             m_flags;          // opened flags
    int              m_request;        // request value for writing and reading fasting
public:
                     CDataBase(void);
                     CDataBase(const string path,const bool is_common_folder);
                    ~CDataBase(void);
    //--- General functions for controlling work with database
    virtual int      Open(const string file_name,const uint flags);
    virtual void     Close(void);
    //--- Functions for controlling work with database tables
    int              Tables(string &array[]);
    bool             TableExists(const string table_name);
    bool             TableCreate(const string table_name,const string primary_key = "Id");
    bool             TableOpen(const string table_name);
    void             TableClose(void);
    bool             TableRename(const string table_name, const string new_table_name);
    bool             TableClear(const string table_name);
    bool             TableDelete(const string table_name);
    bool             TableCopy(const string target_path,const string target_db_name);
    bool             TableCopy(const string target_table_name);
    bool             TableMove(const string target_path,const string target_db_name,const bool target_is_common_folder,const bool update_path = false);
    //--- Functions for controlling work with database table columns
    string           TypeToString(const ENUM_DATABASE_FIELD_TYPE type);
    string           TypeToString(const string type);
    string           PrimaryKey(const string table_name);
    string           PrimaryKey(void) {return(m_primary_key);};   // get primary key name in table
    int              Columns(string &array[]);
    bool             ColumnExists(const string column_name);
    bool             ColumnCreate(const ENUM_DATABASE_FIELD_TYPE column_type,const string column_name);
    template<typename T>
    bool             ColumnCreateObject(T obj);
    bool             ColumnRename(const string column_name, const string new_column_name);
    bool             ColumnClear(const string column_name);
    bool             ColumnDelete(const string column_name);
    ENUM_DATABASE_FIELD_TYPE ColumnType(const string column_name);
    //--- Functions for controlling work with database table rows
    int              Rows(void);
    int              Rows(int &array[]);
    bool             RowExists(const int id);
    bool             RowCreate(const int id);
    bool             RowsCreate(const int &array[]);
    bool             RowRechange(const int id, const int new_id);
    bool             RowClear(const int id);
    bool             RowDelete(const int id);
    int              MaxId(void);
    //--- Functions to control data writing
    bool             Write(const string value,const string column_name,const int id);
    bool             WriteFastStart(const string column_name);
    bool             WriteFastStart(const string &column_names[]);
    template<typename T>
    bool             WriteFastValue(const int column_number, T value);
    bool             WriteFastLine(void);
    void             WriteFastEnd(void);
    //--- Functions to control data reading
    bool             Read(string &value,const string column_name,const int id);
    bool             ReadFastStart(const string column_name,const int &ids[]);
    bool             ReadFastStart(const string &column_names[],const int id);
    bool             ReadFastStart(const string &column_names[],const int &ids[]);
    bool             ReadFastLine(void);
    bool             ReadFastValue(const int column_number, string &value);
    //--- Functions to control data writing variables
    bool             WriteUChar(const uchar value,const string column_name,const int id);
    bool             WriteChar(const char value,const string column_name,const int id);
    bool             WriteUShort(const ushort value,const string column_name,const int id);
    bool             WriteShort(const short value,const string column_name,const int id);
    bool             WriteUInt(const uint value,const string column_name,const int id);
    bool             WriteInt(const int value,const string column_name,const int id);
    bool             WriteULong(const ulong value,const string column_name,const int id);
    bool             WriteLong(const long value,const string column_name,const int id);
    bool             WriteFloat(const float value,const string column_name,const int id);
    bool             WriteDouble(const double value,const string column_name,const int id);
    bool             WriteBool(const bool value,const string column_name,const int id);
    bool             WriteColor(const color value,const string column_name,const int id);
    bool             WriteDateTime(const datetime value,const string column_name,const int id);
    bool             WriteString(const string value,const string column_name,const int id);
    template<typename T>
    bool             WriteEnum(const T value,const string column_name,const int id);
    template<typename T>
    bool             WriteObject(T value,const int id);
    //--- Functions to control data writing array variables
    bool             WriteUCharArray(const uchar &array[],const string column_name,const int &ids[]);
    bool             WriteCharArray(const char &array[],const string column_name,const int &ids[]);
    bool             WriteUShortArray(const ushort &array[],const string column_name,const int &ids[]);
    bool             WriteShortArray(const short &array[],const string column_name,const int &ids[]);
    bool             WriteUIntArray(const uint &array[],const string column_name,const int &ids[]);
    bool             WriteIntArray(const int &array[],const string column_name,const int &ids[]);
    bool             WriteULongArray(const ulong &array[],const string column_name,const int &ids[]);
    bool             WriteLongArray(const long &array[],const string column_name,const int &ids[]);
    bool             WriteFloatArray(const float &array[],const string column_name,const int &ids[]);
    bool             WriteDoubleArray(const double &array[],const string column_name,const int &ids[]);
    bool             WriteBoolArray(const bool &array[],const string column_name,const int &ids[]);
    bool             WriteColorArray(const color &array[],const string column_name,const int &ids[]);
    bool             WriteDateTimeArray(const datetime &array[],const string column_name,const int &ids[]);
    bool             WriteStringArray(const string &array[],const string column_name,const int &ids[]);
    bool             WriteStringArray(const string &array[],const string &column_names[],const int id);
    bool             WriteStringArray(const string &array[],const string &column_names[],const int &ids[]);
    template<typename T>
    bool             WriteEnumArray(const T &array[],const string column_name,const int &ids[]);
    template<typename T>
    bool             WriteObjectArray(T &array[],const int &ids[]);
    //--- Functions to control data reading variables
    bool             ReadUChar(uchar &value,const string column_name,const int id);
    bool             ReadChar(char &value,const string column_name,const int id);
    bool             ReadUShort(ushort &value,const string column_name,const int id);
    bool             ReadShort(short &value,const string column_name,const int id);
    bool             ReadUInt(uint &value,const string column_name,const int id);
    bool             ReadInt(int &value,const string column_name,const int id);
    bool             ReadULong(ulong &value,const string column_name,const int id);
    bool             ReadLong(long &value,const string column_name,const int id);
    bool             ReadFloat(float &value,const string column_name,const int id);
    bool             ReadDouble(double &value,const string column_name,const int id);
    bool             ReadBool(bool &value,const string column_name,const int id);
    bool             ReadColor(color &value,const string column_name,const int id);
    bool             ReadDateTime(datetime &value,const string column_name,const int id);
    bool             ReadString(string &value,const string column_name,const int id);
    template<typename T>
    bool             ReadEnum(T &value,const string column_name,const int id);
    template<typename T>
    bool             ReadObject(T &value,const int id);
    //--- Functions to control data reading array variables
    bool             ReadUCharArray(uchar &array[],const string column_name,int &ids[]);
    bool             ReadCharArray(char &array[],const string column_name,int &ids[]);
    bool             ReadUShortArray(ushort &array[],const string column_name,int &ids[]);
    bool             ReadShortArray(short &array[],const string column_name,int &ids[]);
    bool             ReadUIntArray(uint &array[],const string column_name,int &ids[]);
    bool             ReadIntArray(int &array[],const string column_name,int &ids[]);
    bool             ReadULongArray(ulong &array[],const string column_name,int &ids[]);
    bool             ReadLongArray(long &array[],const string column_name,int &ids[]);
    bool             ReadFloatArray(float &array[],const string column_name,int &ids[]);
    bool             ReadDoubleArray(double &array[],const string column_name,int &ids[]);
    bool             ReadBoolArray(bool &array[],const string column_name,int &ids[]);
    bool             ReadColorArray(color &array[],const string column_name,int &ids[]);
    bool             ReadDateTimeArray(datetime &array[],const string column_name,int &ids[]);
    bool             ReadStringArray(string &array[],const string column_name, int &ids[]);
    bool             ReadStringArray(string &array[],const string &column_names[],const int id);
    bool             ReadStringArray(string &array[],const string &column_names[],const int &ids[]);
    template<typename T>
    bool             ReadEnumArray(T &array[],const string column_name,int &ids[]);
    template<typename T>
    bool             ReadObjectArray(T &array[],int &ids[]);
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
//| Opening the database                                             |
//+------------------------------------------------------------------+
int CDataBase::Open(const string file_name,const uint flags)
   {
    m_flags = flags;
    uint open_flags = IsCommonFolder() ? flags | DATABASE_OPEN_COMMON : flags;
    m_handle = ::DatabaseOpen(file_name,open_flags);
    return(m_handle);
   }
//+------------------------------------------------------------------+
//| Close the database                                               |
//+------------------------------------------------------------------+
void CDataBase::Close(void)
   {
//--- check handle
    if(m_handle != INVALID_HANDLE)
       {
        //--- closing the database and resetting handle
        ::DatabaseClose(m_handle);
        m_handle = INVALID_HANDLE;
       }
   }
//+------------------------------------------------------------------+
//| Get table names                                                  |
//+------------------------------------------------------------------+
int CDataBase::Tables(string &array[])
   {
//--- create struct table for get tables
    struct table
       {
        string       name;
       };
    table value;
//--- resize array
    int size = 0;
    ::ArrayResize(array, size);
//--- send a query for get the tables
    int request = ::DatabasePrepare(m_handle, "SELECT name FROM sqlite_schema WHERE type ='table' AND name NOT LIKE 'sqlite_%';");
//--- check request
    if(request == INVALID_HANDLE)
        return(-1);
//--- read row and set row values to value
    while(::DatabaseReadBind(request, value))
       {
        //--- set value name to array
        ::ArrayResize(array, size + 1);
        array[size] = value.name;
        size++;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(size);
   }
//+------------------------------------------------------------------+
//| Exists is table in database                                      |
//+------------------------------------------------------------------+
bool CDataBase::TableExists(const string table_name)
   {
//--- check is table in the database
    if(::DatabaseTableExists(m_handle, table_name))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Creating a table empty                                           |
//+------------------------------------------------------------------+
bool CDataBase::TableCreate(const string table_name,const string primary_key = "Id")
   {
//--- send a query to create an empty tabel
    if(::DatabaseExecute(m_handle, StringFormat("CREATE TABLE IF NOT EXISTS '%s'(%s INTEGER PRIMARY KEY NOT NULL);", table_name,primary_key)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Setting table name variable                                      |
//+------------------------------------------------------------------+
bool CDataBase::TableOpen(const string table_name)
   {
//--- check exists table in database
    if(TableExists(table_name))
       {
        //--- set m_table_name and m_primary_key variable
        m_table_name = table_name;
        m_primary_key = PrimaryKey(m_table_name);
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Deleting table name variable                                     |
//+------------------------------------------------------------------+
void CDataBase::TableClose(void)
   {
//--- empty m_table_name and m_primary_key variable
    m_table_name = "";
    m_primary_key = "";
   }
//+------------------------------------------------------------------+
//| Renaming table name in database                                  |
//+------------------------------------------------------------------+
bool CDataBase::TableRename(const string table_name, const string new_table_name)
   {
//--- send a query to rename table
    if(::DatabaseExecute(m_handle, StringFormat("ALTER TABLE '%s' RENAME TO '%s';", table_name, new_table_name)))
       {
        //--- change m_table_name variable
        m_table_name = new_table_name;
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Clearing table name in database                                  |
//+------------------------------------------------------------------+
bool CDataBase::TableClear(const string table_name)
   {
//--- send a query to clear table
    if(::DatabaseExecute(m_handle, StringFormat("DELETE FROM '%s';", table_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Deleting table in database                                       |
//+------------------------------------------------------------------+
bool CDataBase::TableDelete(const string table_name)
   {
//--- send a query to delete table
    if(::DatabaseExecute(m_handle, StringFormat("DROP TABLE IF EXISTS '%s';", table_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Copy table to other database                                     |
//+------------------------------------------------------------------+
bool CDataBase::TableCopy(const string target_path,const string target_db_name)
   {
//--- send a query to copy table to other database
    if(::DatabaseExecute(m_handle, StringFormat("ATTACH '%s\\%s' AS X;CREATE TABLE X.%s AS SELECT * FROM '%s';",
                         target_path,target_db_name,m_table_name,m_table_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Copy table to this database                                      |
//+------------------------------------------------------------------+
bool CDataBase::TableCopy(const string target_table_name)
   {
//--- send a query to copy table in this database
    if(::DatabaseExecute(m_handle, StringFormat("CREATE TABLE '%s' AS SELECT * FROM '%s';",
                         target_table_name,m_table_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Move table to other database                                     |
//+------------------------------------------------------------------+
bool CDataBase::TableMove(const string target_path,const string target_db_name,const bool target_is_common_folder,const bool update_path = false)
   {
//--- copy table
    if(TableCopy(target_path,target_db_name))
       {
        //--- delete table
        if(TableDelete(m_table_name))
           {
            //--- updata path
            if(update_path)
               {
                //--- set new path
                Path(target_path,target_is_common_folder);
                //--- close this database
                Close();
                //--- open new database
                if(Open(target_db_name,m_flags) == INVALID_HANDLE)
                    return(false);
               }
            return(true);
           }
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Column type to string                                            |
//+------------------------------------------------------------------+
string CDataBase::TypeToString(const ENUM_DATABASE_FIELD_TYPE type)
   {
    if(type == DATABASE_FIELD_TYPE_INTEGER)
        return("INTEGER");
    if(type == DATABASE_FIELD_TYPE_FLOAT)
        return("REAL");
    if(type == DATABASE_FIELD_TYPE_TEXT)
        return("TEXT");
    if(type == DATABASE_FIELD_TYPE_BLOB)
        return("BLOB");
    return("NULL");
   }
//+------------------------------------------------------------------+
//| Column type to string                                            |
//+------------------------------------------------------------------+
string CDataBase::TypeToString(const string type)
   {
    if(StringFind(type,"[",0) >= 0)
        return("BLOB");
    if(StringFind(type,"uchar",0)   >= 0 ||
       StringFind(type,"char",0)    >= 0 ||
       StringFind(type,"ushort",0)  >= 0 ||
       StringFind(type,"short",0)   >= 0 ||
       StringFind(type,"uint",0)    >= 0 ||
       StringFind(type,"int",0)     >= 0 ||
       StringFind(type,"ulong",0)   >= 0 ||
       StringFind(type,"long",0)    >= 0)
        return("INTEGER");
    if(StringFind(type,"float",0)   >= 0 ||
       StringFind(type,"double",0)  >= 0)
        return("REAL");
    if(StringFind(type,"bool",0)    >= 0 ||
       StringFind(type,"color",0)   >= 0 ||
       StringFind(type,"datetime",0) >= 0 ||
       StringFind(type,"string",0)  >= 0 ||
       StringFind(type,"enum",0)    >= 0)
        return("TEXT");
    return("NULL");
   }
//+------------------------------------------------------------------+
//| Get column primary key                                           |
//+------------------------------------------------------------------+
string CDataBase::PrimaryKey(const string table_name)
   {
    string value = "";
//--- send a query to get the columns from the table
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT sql FROM sqlite_master WHERE type = 'table' AND name = '%s';", table_name));
//--- check request
    if(request == INVALID_HANDLE)
        return(value);
//--- read a query
    if(::DatabaseRead(request))
       {
        if(::DatabaseColumnText(request,0,value))
           {
            int start = StringFind(value,"(",0) + 1;
            int end = StringFind(value,"INTEGER",start);
            value = StringSubstr(value,start,end - start);
           }
       }
//--- end query
    ::DatabaseFinalize(request);
    return(value);
   }
//+------------------------------------------------------------------+
//| Get column names                                                 |
//+------------------------------------------------------------------+
int CDataBase::Columns(string &array[])
   {
    int count = 0;
//--- send a query to get the columns from the table
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT * FROM '%s' WHERE %s == 0", m_table_name,m_primary_key));
//--- check request
    if(request == INVALID_HANDLE)
        return(count);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- set count
        count = ::DatabaseColumnsCount(request);
        //--- resize array to count
        ArrayResize(array, count);
        for(int i = 0; i < count; i++)
           {
            //--- get name column and set to array
            ::DatabaseColumnName(request, i,array[i]);
           }
       }
//--- end query
    ::DatabaseFinalize(request);
    return(count);
   }
//+------------------------------------------------------------------+
//| Exists column in table                                           |
//+------------------------------------------------------------------+
bool CDataBase::ColumnExists(const string column_name)
   {
    string columns[];
//--- get the columns from the table
    int size = Columns(columns);
    for(int i = 0; i < size; i++)
       {
        //--- check is column name
        if(columns[i] == column_name)
           {
            return(true);
           }
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Create column in table                                           |
//+------------------------------------------------------------------+
bool CDataBase::ColumnCreate(const ENUM_DATABASE_FIELD_TYPE column_type,const string column_name)
   {
//--- send a query to create column and set column type
    if(::DatabaseExecute(m_handle, StringFormat("ALTER TABLE '%s' ADD COLUMN %s %s;", m_table_name, column_name, TypeToString(column_type))))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Create column of an class or struct object type in table         |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::ColumnCreateObject(T obj)
   {
//--- get types and names
    string types[],names[];
    int size = obj.Variables(GET_TYPES,types,false);
    obj.Variables(GET_NAMES,names,false);
//--- create columns
    for(int i = 0; i < size; i++)
       {
        if(!ColumnCreate(TypeToString(types[i]),names[i]))
            return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Rename column name in table                                      |
//+------------------------------------------------------------------+
bool CDataBase::ColumnRename(const string column_name, const string new_column_name)
   {
//--- send a query to rename column
    if(::DatabaseExecute(m_handle, StringFormat("ALTER TABLE '%s' RENAME %s TO %s;", m_table_name, column_name, new_column_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Clear column in table                                            |
//+------------------------------------------------------------------+
bool CDataBase::ColumnClear(const string column_name)
   {
//--- send a query to clear column
    if(::DatabaseExecute(m_handle, StringFormat("UPDATE '%s' SET %s = NULL;", m_table_name, column_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Delete column in table                                           |
//+------------------------------------------------------------------+
bool CDataBase::ColumnDelete(const string column_name)
   {
//--- send a query to delete column
    if(::DatabaseExecute(m_handle, StringFormat("ALTER TABLE '%s' DROP %s;", m_table_name, column_name)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Get type column in table                                         |
//+------------------------------------------------------------------+
ENUM_DATABASE_FIELD_TYPE CDataBase::ColumnType(const string column_name)
   {
    ENUM_DATABASE_FIELD_TYPE type = 0;
//--- send a query to get the column value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s';", column_name, m_table_name));
//--- check request
    if(request == INVALID_HANDLE)
        return(type);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- set type column
        type = ::DatabaseColumnType(request, 0);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(type);
   }
//+------------------------------------------------------------------+
//| Get count rows in table                                          |
//+------------------------------------------------------------------+
int CDataBase::Rows(void)
   {
    int count = -1;
//--- send a query to get rows total id
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT COUNT(*) FROM '%s';", m_table_name));
//--- check request
    if(request == INVALID_HANDLE)
        return(count);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value to zero(0) column and set to count
        ::DatabaseColumnInteger(request, 0, count);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(count);
   }
//+------------------------------------------------------------------+
//| Get rows in table                                                |
//+------------------------------------------------------------------+
int CDataBase::Rows(int &array[])
   {
//--- create struct table for get ids
    struct table
       {
        int          id;
       };
    table value;
    int size = 0;
//--- resize array to 0
    ArrayResize(array, size);
//--- send a query to get the values
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s';", m_primary_key,m_table_name));
//--- check request
    if(request == INVALID_HANDLE)
        return(size);
//--- read row and set row values to value
    while(::DatabaseReadBind(request, value))
       {
        //--- set value to array
        ArrayResize(array, size + 1);
        array[size] = value.id;
        size++;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(size);
   }
//+------------------------------------------------------------------+
//| Exists id row in primary key table                               |
//+------------------------------------------------------------------+
bool CDataBase::RowExists(const int id)
   {
//--- send a query to get the row
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", m_primary_key,m_table_name,m_primary_key, id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- end query
        ::DatabaseFinalize(request);
        return(true);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(false);
   }
//+------------------------------------------------------------------+
//| Create id row in primary key table                               |
//+------------------------------------------------------------------+
bool CDataBase::RowCreate(const int id)
   {
//--- send a query to create row
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s'(%s) VALUES(%d);", m_table_name,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Create id rows in primary key table                              |
//+------------------------------------------------------------------+
bool CDataBase::RowsCreate(const int &array[])
   {
//--- send a query for create rows
    int request = ::DatabasePrepare(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s) VALUES (?1);",m_table_name,m_primary_key));
    bool request_error = false;
//--- check request
    if(request == INVALID_HANDLE)
       {
        return(false);
       }
//--- start transection and reset error
    ::DatabaseTransactionBegin(m_handle);
    ::ResetLastError();
//--- set values with index
    for(int i = 0; i < ArraySize(array); i++)
       {
        if(!::DatabaseBind(request, 0, array[i]))
           {
            request_error = true;
            break;
           }
        if(!::DatabaseRead(request) && (GetLastError() != ERR_DATABASE_NO_MORE_DATA))
           {
            ::DatabaseFinalize(request);
            request_error = true;
            break;
           }
        if(!::DatabaseReset(request))
           {
            ::DatabaseFinalize(request);
            request_error = true;
            break;
           }
       }
    if(request_error)
       {
        //--- rollback transection
        ::DatabaseTransactionRollback(m_handle);
        return(false);
       }
//--- end transection
    ::DatabaseTransactionCommit(m_handle);
    return(true);
   }
//+------------------------------------------------------------------+
//| Change id row in primary key table                               |
//+------------------------------------------------------------------+
bool CDataBase::RowRechange(const int id, const int new_id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("UPDATE '%s' SET %s = %d WHERE %s == %d;", m_table_name,m_primary_key,new_id,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Clear id row in primary key table                                |
//+------------------------------------------------------------------+
bool CDataBase::RowClear(const int id)
   {
    string columns[];
    int size = Columns(columns);
    if(size <= 0)
        return(false);
    string query = StringFormat("UPDATE '%s' SET",m_table_name);
    for(int i = 0; i < size - 1; i++)
       {
        query += StringFormat(" %s = NULL,",columns[i]);
       }
    query += StringFormat(" %s = NULL WHERE %s = %d",columns[size - 1],m_primary_key,id);
//--- send a query to clear row
    if(::DatabaseExecute(m_handle, query))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Delete id row in primary key table                               |
//+------------------------------------------------------------------+
bool CDataBase::RowDelete(const int id)
   {
//--- send a query to delete row
    if(::DatabaseExecute(m_handle, StringFormat("DELETE FROM '%s' WHERE %s == %d;", m_table_name,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Get max id row in primary key table                              |
//+------------------------------------------------------------------+
int CDataBase::MaxId(void)
   {
    int row = -1;
//--- send a query to get maximum id
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT MAX(%s) FROM '%s';", m_primary_key,m_table_name));
//--- check request
    if(request == INVALID_HANDLE)
        return(row);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value to zero(0) column and set to row
        ::DatabaseColumnInteger(request, 0, row);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(row);
   }
//+------------------------------------------------------------------+
//| Write a variable string type                                     |
//+------------------------------------------------------------------+
bool CDataBase::Write(const string value,const string column_name,const int id)
   {
//--- create row
    if(!RowCreate(id))
        return(false);
//--- send a query to updata value
    if(!::DatabaseExecute(m_handle, StringFormat("UPDATE '%s' SET %s = %s WHERE %s = %d;",m_table_name,column_name,value,m_primary_key,id)))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Starting write values in column and every rows                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteFastStart(const string column_name)
   {
//--- send a query for update column name
    m_request = ::DatabasePrepare(m_handle, StringFormat("UPDATE '%s' SET %s = ?1 WHERE %s = ?2;", m_table_name,column_name,m_primary_key));
//--- check request
    if(m_request == INVALID_HANDLE)
        return(false);
//--- start transaction
    ::DatabaseTransactionBegin(m_handle);
    return(true);
   }
//+------------------------------------------------------------------+
//| Starting write values in every columns and every rows            |
//+------------------------------------------------------------------+
bool CDataBase::WriteFastStart(const string &column_names[])
   {
//--- create a query for update column names
    string sql = StringFormat("UPDATE '%s' SET", m_table_name);
    string val = "VALUES (";
    for(int i = 0; i < ArraySize(column_names); i++)
       {
        sql += StringFormat("%s = ?%d,", column_names[i],i + 1);
       }
    sql = StringSubstr(sql, 0, StringLen(sql) - 1);
    sql += StringFormat(" WHERE %s == ?%d;", m_primary_key,ArraySize(column_names) + 1);
//--- send a query
    m_request = ::DatabasePrepare(m_handle, sql);
//--- check request
    if(m_request == INVALID_HANDLE)
        return(false);
//--- start transaction
    ::DatabaseTransactionBegin(m_handle);
    return(true);
   }
//+------------------------------------------------------------------+
//| Writing value in column                                          |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::WriteFastValue(const int column_number, T value)
   {
//--- set value to table column number
    if(!::DatabaseBind(m_request, column_number, value))
       {
        WriteFastEnd();
        return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Writing values in current row                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteFastLine(void)
   {
//--- reset set values to row next
    if(!::DatabaseRead(m_request) && GetLastError() != ERR_DATABASE_NO_MORE_DATA)
       {
        ::DatabaseFinalize(m_request);
        WriteFastEnd();
        return(false);
       }
    if(!::DatabaseReset(m_request))
       {
        ::DatabaseFinalize(m_request);
        WriteFastEnd();
        return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Ending write values                                              |
//+------------------------------------------------------------------+
void CDataBase::WriteFastEnd(void)
   {
//--- end transaction
    ::DatabaseTransactionCommit(m_handle);
   }
//+------------------------------------------------------------------+
//| Read a variable string type                                      |
//+------------------------------------------------------------------+
bool CDataBase::Read(string &value,const string column_name,const int id)
   {
    bool geting = false;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        if(::DatabaseColumnText(request, 0, value))
            geting = true;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(geting);
   }
//+------------------------------------------------------------------+
//| Starting read values in columns and every rows                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadFastStart(const string column_name,const int &ids[])
   {
//--- create a query for get values
    string sql = StringFormat("SELECT %s FROM '%s' WHERE %s IN (",column_name,m_table_name,m_primary_key);
    for(int i = 0; i < ArraySize(ids); i++)
       {
        sql += (string)ids[i] + ",";
       }
    sql = StringSubstr(sql, 0, StringLen(sql) - 1);
    sql += ");";
//--- send a query
    m_request = ::DatabasePrepare(m_handle, sql);
//--- check request
    if(m_request == INVALID_HANDLE)
       {
        return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Starting read values in every columns and row                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadFastStart(const string &column_names[],const int id)
   {
//--- create a query for get values
    string sql = "SELECT ";
    for(int i = 0; i < ArraySize(column_names); i++)
       {
        sql += column_names[i] + ",";
       }
    sql = StringSubstr(sql, 0, StringLen(sql) - 1);
    sql += StringFormat(" FROM '%s' WHERE %s == %d;",m_table_name,m_primary_key,id);
//--- send a query
    m_request = ::DatabasePrepare(m_handle, sql);
//--- check request
    if(m_request == INVALID_HANDLE)
       {
        return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Starting read values in every columns and every rows             |
//+------------------------------------------------------------------+
bool CDataBase::ReadFastStart(const string &column_names[],const int &ids[])
   {
//--- create a query for get values
    string sql = "SELECT ";
    for(int i = 0; i < ArraySize(column_names); i++)
       {
        sql += column_names[i] + ",";
       }
    sql = StringSubstr(sql, 0, StringLen(sql) - 1);
    sql += StringFormat(" FROM '%s' WHERE %s IN(",m_table_name,m_primary_key);
    for(int i = 0; i < ArraySize(ids); i++)
       {
        sql += (string)ids[i] + ",";
       }
    sql = StringSubstr(sql, 0, StringLen(sql) - 1);
    sql += ");";
//--- send a query
    m_request = ::DatabasePrepare(m_handle, sql);
//--- check request
    if(m_request == INVALID_HANDLE)
       {
        return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Reading values in current row                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadFastLine(void)
   {
//--- read line
    if(!::DatabaseRead(m_request))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Reading value in column                                          |
//+------------------------------------------------------------------+
bool CDataBase::ReadFastValue(const int column_number, string &value)
   {
//--- read value
    if(!::DatabaseColumnText(m_request, column_number, value))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of uchar type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteUChar(const uchar value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of char type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteChar(const char value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of ushort type                                  |
//+------------------------------------------------------------------+
bool CDataBase::WriteUShort(const ushort value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of short type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteShort(const short value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of uint type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteUInt(const uint value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of int type                                     |
//+------------------------------------------------------------------+
bool CDataBase::WriteInt(const int value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of ulong type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteULong(const ulong value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of long type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteLong(const long value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of float type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteFloat(const float value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of double type                                  |
//+------------------------------------------------------------------+
bool CDataBase::WriteDouble(const double value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of bool type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteBool(const bool value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of color type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteColor(const color value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of datetime type                                |
//+------------------------------------------------------------------+
bool CDataBase::WriteDateTime(const datetime value,const string column_name,const int id)
   {
//--- write value
    if(!Write((string)value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of string type                                  |
//+------------------------------------------------------------------+
bool CDataBase::WriteString(const string value,const string column_name,const int id)
   {
//--- write value
    if(!Write(value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of an enumeration type                          |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::WriteEnum(const T value,const string column_name,const int id)
   {
//--- write value
    if(!Write(StringFormat("%s(%d)",EnumToString(value),value),column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of an class or struct object type               |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::WriteObject(T value,const int id)
   {
//--- get names and values
    string names[],values[];
    int size = value.Variables(GET_NAMES,names,false);
    value.Variables(GET_VALUES,values,false);
//--- write values
    if(!WriteStringArray(values,names,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of uchar type                        |
//+------------------------------------------------------------------+
bool CDataBase::WriteUCharArray(const uchar &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of char type                         |
//+------------------------------------------------------------------+
bool CDataBase::WriteCharArray(const char &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of ushort type                       |
//+------------------------------------------------------------------+
bool CDataBase::WriteUShortArray(const ushort &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of short type                        |
//+------------------------------------------------------------------+
bool CDataBase::WriteShortArray(const short &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of uint type                         |
//+------------------------------------------------------------------+
bool CDataBase::WriteUIntArray(const uint &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of int type                          |
//+------------------------------------------------------------------+
bool CDataBase::WriteIntArray(const int &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of ulong type                        |
//+------------------------------------------------------------------+
bool CDataBase::WriteULongArray(const ulong &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of long type                         |
//+------------------------------------------------------------------+
bool CDataBase::WriteLongArray(const long &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of float type                        |
//+------------------------------------------------------------------+
bool CDataBase::WriteFloatArray(const float &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of double type                       |
//+------------------------------------------------------------------+
bool CDataBase::WriteDoubleArray(const double &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of bool type                         |
//+------------------------------------------------------------------+
bool CDataBase::WriteBoolArray(const bool &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,(string)array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of color type                        |
//+------------------------------------------------------------------+
bool CDataBase::WriteColorArray(const color &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,(string)array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of datetime type                     |
//+------------------------------------------------------------------+
bool CDataBase::WriteDateTimeArray(const datetime &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,(string)array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of string type                       |
//+------------------------------------------------------------------+
bool CDataBase::WriteStringArray(const string &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,array[i]))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of string type                       |
//+------------------------------------------------------------------+
bool CDataBase::WriteStringArray(const string &array[],const string &column_names[],const int id)
   {
//--- create rows
    if(!RowCreate(id))
        return(false);
//--- write starting
    if(!WriteFastStart(column_names))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(array); i++)
       {
        if(!WriteFastValue(i,array[i]))
            return(false);
       }
    if(!WriteFastValue(ArraySize(array),id))
        return(false);
//--- go to next line
    if(!WriteFastLine())
        return(false);
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of string type                       |
//+------------------------------------------------------------------+
bool CDataBase::WriteStringArray(const string &array[],const string &column_names[],const int &ids[])
   {
    int size_column = ArraySize(column_names);
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_names))
        return(false);
//--- write values
    int i = 0;
    for(int row = 0; row < ArraySize(ids); row++)
       {
        for(int column = 0; column < ArraySize(column_names); column++)
           {
            if(!WriteFastValue(column,array[i]))
                return(false);
            i++;
           }
        if(!WriteFastValue(size_column,ids[row]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write an array of variables of an enumeration type               |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::WriteEnumArray(const T &array[],const string column_name,const int &ids[])
   {
//--- create rows
    if(!RowsCreate(ids))
        return(false);
//--- write starting
    if(!WriteFastStart(column_name))
        return(false);
//--- write values
    for(int i = 0; i < ArraySize(ids); i++)
       {
        if(!WriteFastValue(0,StringFormat("%s(%d)",EnumToString(array[i]),array[i])))
            return(false);
        if(!WriteFastValue(1,ids[i]))
            return(false);
        //--- go to next line
        if(!WriteFastLine())
            return(false);
       }
//--- write ending
    WriteFastEnd();
    return(true);
   }
//+------------------------------------------------------------------+
//| Write a variable of an class or struct object type               |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::WriteObjectArray(T &array[],const int &ids[])
   {
//--- get names
    string names[],values[];
    array[0].Variables(GET_NAMES,names,false);
//--- get values
    for(int i = 0; i < ArraySize(array); i++)
       {
        array[i].Variables(GET_VALUES,values,false);
       }
//--- write values
    if(!WriteStringArray(values,names,ids))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of uchar type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadUChar(uchar &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (uchar)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of char type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadChar(char &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (char)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of ushort type                                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadUShort(ushort &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (ushort)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of short type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadShort(short &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (short)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of uint type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadUInt(uint &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (uint)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of int type                                      |
//+------------------------------------------------------------------+
bool CDataBase::ReadInt(int &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (int)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of ulong type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadULong(ulong &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (ulong)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of long type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadLong(long &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (long)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of float type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadFloat(float &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (float)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of double type                                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadDouble(double &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (double)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of bool type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadBool(bool &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = StringCompare(value_string,"true",false) == 0 ? true : false;;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of color type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadColor(color &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (color)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of datetime type                                 |
//+------------------------------------------------------------------+
bool CDataBase::ReadDateTime(datetime &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (datetime)value_string;
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of string type                                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadString(string &value,const string column_name,const int id)
   {
//--- get value
    if(!Read(value,column_name,id))
        return(false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of an enumeration type                           |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::ReadEnum(T &value,const string column_name,const int id)
   {
//--- get value
    string value_string = "";
    if(!Read(value_string,column_name,id))
        return(false);
//--- convert type
    value = (T)StringSubstr(value_string,find + 1,StringLen(value_string));
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of an class or struct object type                |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::ReadObject(T &value,const int id)
   {
//--- get names
    string names[],values[];
    value.Variables(GET_NAMES,names,false);
//--- read values
    if(!ReadStringArray(values,names,id))
        return(false);
//--- set values
    value.Variables(SET_VALUES,values,false);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of uchar type                         |
//+------------------------------------------------------------------+
bool CDataBase::ReadUCharArray(uchar &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (uchar)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of char type                          |
//+------------------------------------------------------------------+
bool CDataBase::ReadCharArray(char &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (char)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of ushort type                        |
//+------------------------------------------------------------------+
bool CDataBase::ReadUShortArray(ushort &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (ushort)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of short type                         |
//+------------------------------------------------------------------+
bool CDataBase::ReadShortArray(short &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (short)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of uint type                          |
//+------------------------------------------------------------------+
bool CDataBase::ReadUIntArray(uint &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (uint)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of int type                           |
//+------------------------------------------------------------------+
bool CDataBase::ReadIntArray(int &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (int)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of ulong type                         |
//+------------------------------------------------------------------+
bool CDataBase::ReadULongArray(ulong &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (ulong)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of long type                          |
//+------------------------------------------------------------------+
bool CDataBase::ReadLongArray(long &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (long)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of float type                         |
//+------------------------------------------------------------------+
bool CDataBase::ReadFloatArray(float &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (float)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of double type                        |
//+------------------------------------------------------------------+
bool CDataBase::ReadDoubleArray(double &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (double)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of bool type                          |
//+------------------------------------------------------------------+
bool CDataBase::ReadBoolArray(bool &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = StringCompare(value_string,"true",false) == 0 ? true : false;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of color type                         |
//+------------------------------------------------------------------+
bool CDataBase::ReadColorArray(color &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (color)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of datetime type                      |
//+------------------------------------------------------------------+
bool CDataBase::ReadDateTimeArray(datetime &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (datetime)value_string;
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of string type                        |
//+------------------------------------------------------------------+
bool CDataBase::ReadStringArray(string &array[],const string column_name,int &ids[])
   {
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,array[i]))
            return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of string type                        |
//+------------------------------------------------------------------+
bool CDataBase::ReadStringArray(string &array[],const string &column_names[],const int id)
   {
//--- size array column_names
    int size = ArraySize(column_names);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_names,id))
        return(false);
//--- read value and convert type
    if(!ReadFastLine())
        return(false);
    for(int i = 0; i < size; i++)
       {
        if(!ReadFastValue(i,array[i]))
            return(false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of string type                        |
//+------------------------------------------------------------------+
bool CDataBase::ReadStringArray(string &array[],const string &column_names[],const int &ids[])
   {
//--- size arraies
    int size_column = ArraySize(column_names);
    int size_row = ArraySize(ids);
//--- resize array
    ArrayResize(array,size_column * size_row);
//--- read starting
    if(!ReadFastStart(column_names,ids))
        return(false);
    int i = 0;
//--- read values
    for(int row = 0; row < size_row; row++)
       {
        if(!ReadFastLine())
            return(false);
        for(int column = 0; column < size_column; column++)
           {
            if(!ReadFastValue(column,array[i]))
                return(false);
            i++;
           }
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an enumeration type                |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::ReadEnumArray(T &array[],const string column_name,int &ids[])
   {
    string value_string = "";
//--- size array ids
    int size = ArraySize(ids);
//--- ids array sort
    if(!ArraySort(ids))
        return(false);
//--- resize array
    ArrayResize(array,size);
//--- read starting
    if(!ReadFastStart(column_name,ids))
        return(false);
//--- read value and convert type
    for(int i = 0; i < size && ReadFastLine() ; i++)
       {
        if(!ReadFastValue(0,value_string))
            return(false);
        array[i] = (T)StringSubstr(value_string,find + 1,StringLen(value_string));
       }
    return(true);
   }
//+------------------------------------------------------------------+
//| Read an array of variables of an class or struct object type     |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::ReadObjectArray(T &array[],int &ids[])
   {
//--- get names
    string names[],values[];
    array[0].Variables(GET_NAMES,names,false);
//--- read values
    if(!ReadStringArray(values,names,ids))
        return(false);
//--- set values
    for(int i = 0; i < ArraySize(array); i++)
       {
        array[i].Variables(SET_VALUES,values,false);
       }
    return(true);
   }
//+------------------------------------------------------------------+
