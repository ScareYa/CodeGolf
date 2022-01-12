using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void SelectTest ()
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Context Connection=true";

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "Select 1 [dbo.SelectTest]";
        conn.Open();

        SqlDataReader sqldr = cmd.ExecuteReader();
        SqlContext.Pipe.Send(sqldr);

        sqldr.Close();
        conn.Close();
    }
}