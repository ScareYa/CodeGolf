using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate(Format.Native)]
public struct CountVowels
{
    // count only the vowels in the passed-in strings
    private SqlInt32 countOfVowels;
    public void Init()
    {
        countOfVowels = 0;
    }

    public void Accumulate(SqlString Value)
    {
        // list of vowels to look for
        string vowels = "aeiou";

        // for each character in the given parameter
        for (int i = 0; i < Value.ToString().Length; i++)
        {
            // for each character in the vowels string
            for (int j = 0; j < vowels.Length; j++)
            {
                // convert parameter character to lowercase and compare to vowel
                if (Value.Value.Substring(i, 1).ToLower() == vowels.Substring(j, 1))
                {
                    // it is a vowel, increment the count
                    countOfVowels += 1;
                }
            }
        }
    }

    public void Merge (CountVowels Value)
    {
        Accumulate(Value.Terminate());
    }

    public SqlString Terminate ()
    {
        return countOfVowels.ToString();
    }

    // This is a place-holder member field
    // public int _var1;
}
