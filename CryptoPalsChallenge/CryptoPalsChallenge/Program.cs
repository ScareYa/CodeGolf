using System;
using System.Collections.Generic;
using System.Linq;

using System.Text;
using System.Threading.Tasks;

namespace CryptoPalsChallenge
{
    class Program
    {
        static void Main(string[] args)
        {
            var functions = new CryptoFunctions.EncodingFunctions();

            functions.InitialConversion();

            var output = functions.XorArrays(functions.ConvertStringToByteArray("1c0111001f010100061a024b53535009181c"), functions.ConvertStringToByteArray("686974207468652062756c6c277320657965"));

            

            var outputstring = functions.ByteArrayToHex (output);

            var bestScore = functions.GetEnglishScore(functions.ConvertStringToByteArray("1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"));

            var decryptedText = bestScore.Item2;
            
            Console.WriteLine("test");



            //1c0111001f010100061a024b53535009181c ^
            //686974207468652062756c6c277320657965

            //746865206b696420646f6e277420706c6179

        }
    }
}
