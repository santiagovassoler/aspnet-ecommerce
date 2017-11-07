using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// DataAccess class to connect to database and execute queries
/// </summary>
public static class DataAccess
{
    private static string connection_string;
    static DataAccess()
    {
        connection_string = WebConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
    }

    public static DataTable selectQuery(string query)
    {
        DataTable dataTable = new DataTable();
        SqlConnection conn = new SqlConnection(connection_string);
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        dataTable.Load(cmd.ExecuteReader());
        conn.Close();
        return dataTable;
    }

    public static DataTable selectProcedure(string procedureName, string value,string procedureParameter)
    {
        DataTable dataTable = new DataTable();
        SqlConnection conn = new SqlConnection(connection_string);
        conn.Open();

        SqlCommand cmd = new SqlCommand(procedureName, conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue(procedureParameter, value);
        dataTable.Load(cmd.ExecuteReader());
        conn.Close();
        return dataTable;
    }
}