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
protected:
    string           TypeToString(const ENUM_DATABASE_FIELD_TYPE type);
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
    string           PrimaryKey(const string table_name);
    int              Columns(string &array[]);
    bool             ColumnExists(const string column_name);
    bool             ColumnCreate(const ENUM_DATABASE_FIELD_TYPE column_type,const string column_name);
    bool             ColumnRename(const string column_name, const string new_column_name);
    bool             ColumnClear(const string column_name);
    bool             ColumnDelete(const string column_name);
    ENUM_DATABASE_FIELD_TYPE ColumnType(const string column_name);
    //--- Functions for controlling work with database table rows
    int              Rows(void);
    int              Rows(int &array[]);
    bool             RowExists(const int id);
    bool             RowCreate(const int id);
    bool             RowRechange(const int id, const int new_id);
    bool             RowClear(const int id);
    bool             RowDelete(const int id);
    int              MaxId(void);
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
            int start = StringFind(value,"(",0) + 2;
            int end = StringFind(value,"'",start);
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
    if(::DatabaseExecute(m_handle, StringFormat("INSERT INTO '%s'(%s) VALUES(%d);", m_table_name,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
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
//| Write a variable of uchar type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteUChar(const uchar value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of char type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteChar(const char value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of ushort type                                  |
//+------------------------------------------------------------------+
bool CDataBase::WriteUShort(const ushort value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of short type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteShort(const short value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of uint type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteUInt(const uint value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of int type                                     |
//+------------------------------------------------------------------+
bool CDataBase::WriteInt(const int value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of ulong type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteULong(const ulong value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of long type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteLong(const long value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of float type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteFloat(const float value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of double type                                  |
//+------------------------------------------------------------------+
bool CDataBase::WriteDouble(const double value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of bool type                                    |
//+------------------------------------------------------------------+
bool CDataBase::WriteBool(const bool value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of color type                                   |
//+------------------------------------------------------------------+
bool CDataBase::WriteColor(const color value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of datetime type                                |
//+------------------------------------------------------------------+
bool CDataBase::WriteDateTime(const datetime value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,(string)value,
                         m_table_name,column_name,(string)value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of string type                                  |
//+------------------------------------------------------------------+
bool CDataBase::WriteString(const string value,const string column_name,const int id)
   {
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,value,
                         m_table_name,column_name,value,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Write a variable of an enumeration type                          |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::WriteEnum(const T value,const string column_name,const int id)
   {
    string value_string = StringFormat("%s(%d)",EnumToString(value),value);
//--- send a query to updata row value
    if(::DatabaseExecute(m_handle, StringFormat("INSERT OR IGNORE INTO '%s' (%s,%s) VALUES (%d,%s);UPDATE '%s' SET %s = %s WHERE %s = %d;",
                         m_table_name,m_primary_key,column_name,id,value_string,
                         m_table_name,column_name,value_string,m_primary_key,id)))
       {
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Read a variable of uchar type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadUChar(uchar &value,const string column_name,const int id)
   {
    int value_int = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnInteger(request, 0, value_int);
        value = (uchar)value_int;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of char type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadChar(char &value,const string column_name,const int id)
   {
    int value_int = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnInteger(request, 0, value_int);
        value = (char)value_int;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of ushort type                                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadUShort(ushort &value,const string column_name,const int id)
   {
    int value_int = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnInteger(request, 0, value_int);
        value = (ushort)value_int;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of short type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadShort(short &value,const string column_name,const int id)
   {
    int value_int = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnInteger(request, 0, value_int);
        value = (short)value_int;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of uint type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadUInt(uint &value,const string column_name,const int id)
   {
    int value_int = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnInteger(request, 0, value_int);
        value = (uint)value_int;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of int type                                      |
//+------------------------------------------------------------------+
bool CDataBase::ReadInt(int &value,const string column_name,const int id)
   {
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnInteger(request, 0, value);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of ulong type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadULong(ulong &value,const string column_name,const int id)
   {
    long value_long = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnLong(request, 0, value_long);
        value = (ulong)value_long;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of long type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadLong(long &value,const string column_name,const int id)
   {
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnLong(request, 0, value);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of float type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadFloat(float &value,const string column_name,const int id)
   {
    double value_double = 0;
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnDouble(request, 0, value_double);
        value = (float)value_double;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of double type                                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadDouble(double &value,const string column_name,const int id)
   {
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnDouble(request, 0, value);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of bool type                                     |
//+------------------------------------------------------------------+
bool CDataBase::ReadBool(bool &value,const string column_name,const int id)
   {
    string value_string = "";
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnText(request, 0, value_string);
        value = StringCompare(value_string,"true",false) == 0 ? true : false;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of color type                                    |
//+------------------------------------------------------------------+
bool CDataBase::ReadColor(color &value,const string column_name,const int id)
   {
    string value_string = "";
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnText(request, 0, value_string);
        value = (color)value_string;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of datetime type                                 |
//+------------------------------------------------------------------+
bool CDataBase::ReadDateTime(datetime &value,const string column_name,const int id)
   {
    string value_string = "";
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnText(request, 0, value_string);
        value = (datetime)value_string;
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of string type                                   |
//+------------------------------------------------------------------+
bool CDataBase::ReadString(string &value,const string column_name,const int id)
   {
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnText(request, 0, value);
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
//| Read a variable of an enumeration type                           |
//+------------------------------------------------------------------+
template<typename T>
bool CDataBase::ReadEnum(T &value,const string column_name,const int id)
   {
    string value_string = "";
//--- send a query to get value
    int request = ::DatabasePrepare(m_handle, StringFormat("SELECT %s FROM '%s' WHERE %s == %d;", column_name,m_table_name,m_primary_key,id));
//--- check request
    if(request == INVALID_HANDLE)
        return(false);
//--- read a query
    if(::DatabaseRead(request))
       {
        //--- get value
        ::DatabaseColumnText(request, 0, value_string);
        value = (T)StringSubstr(value_string,find + 1,StringLen(value_string));
       }
//--- end query
    ::DatabaseFinalize(request);
    return(true);
   }
//+------------------------------------------------------------------+
