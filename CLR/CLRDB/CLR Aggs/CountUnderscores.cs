using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate(Format.Native)]
public struct CountUnderscores
{
    private Int32 countOfUnderscores;
    public void Init()
    {
        countOfUnderscores = 0;
    }

    public void Accumulate(SqlString InputValue)
    {
        foreach (char c in InputValue.ToString())
        {
            if (c == '_') { countOfUnderscores++; };
        }
    }

    public void Merge (CountUnderscores Value)
    {
        Accumulate(Value.Terminate());
    }

    public SqlString Terminate ()
    {
        return countOfUnderscores.ToString();
    }

    // This is a place-holder member field
    public int _var1;
}
