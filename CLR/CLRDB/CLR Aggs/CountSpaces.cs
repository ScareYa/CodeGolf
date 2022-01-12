using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate(Format.Native)]
public struct CountSpaces
{
    private Int32 countOfSpaces;
    public void Init()
    {
        countOfSpaces = 0;
    }

    public void Accumulate(SqlString InputValue)
    {
        foreach (char c in InputValue.ToString())
        {
            if (c == ' ') { countOfSpaces++; };
        }
    }
    
    //this was previously CountSpaces Group... need to understand the difference
    public void Merge (CountSpaces Value)
    {
        Accumulate(Value.Terminate());
    }

    public SqlString Terminate ()
    {
        return countOfSpaces.ToString();
    }

    //is this necessary?
    // This is a place-holder member field
    //public int _var1;
}
