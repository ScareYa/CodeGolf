using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void AcceptArg (Int32 intAny)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Context Connection=true";

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        conn.Open();
        cmd.CommandText = "Select @intAny [dbo.AcceptArg]";
        SqlParameter paramAny = new SqlParameter();
        paramAny.Value = intAny;
        paramAny.Direction = ParameterDirection.Input;
        paramAny.DbType = DbType.Int32;
        paramAny.ParameterName = "@intAny";

        cmd.Parameters.Add(paramAny);
        SqlDataReader sqldr = cmd.ExecuteReader();
        SqlContext.Pipe.Send(sqldr);

        sqldr.Close();
        conn.Close();
    }
}
