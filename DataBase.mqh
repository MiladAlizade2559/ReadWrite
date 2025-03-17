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
    string           m_table_name;
    uint             m_flags;
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
    bool             TableCreate(const string table_name);
    bool             TableOpen(const string table_name);
    void             TableClose(void);
    bool             TableRename(const string table_name, const string new_table_name);
    bool             TableClear(const string table_name);
    bool             TableDelete(const string table_name);
    bool             TableCopy(const string target_path,const string target_db_name);
    bool             TableCopy(const string target_table_name);
    bool             TableMove(const string target_path,const string target_db_name,const bool target_is_common_folder,const bool update_path = false);
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
bool CDataBase::TableCreate(const string table_name)
   {
//--- send a query to create an empty tabel
    if(::DatabaseExecute(m_handle, StringFormat("CREATE TABLE '%s'('');", table_name)))
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
        //--- set m_table_name variable
        m_table_name = table_name;
        return(true);
       }
    return(false);
   }
//+------------------------------------------------------------------+
//| Deleting table name variable                                     |
//+------------------------------------------------------------------+
void CDataBase::TableClose(void)
   {
//--- empty m_table_name variable
    m_table_name = "";
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
