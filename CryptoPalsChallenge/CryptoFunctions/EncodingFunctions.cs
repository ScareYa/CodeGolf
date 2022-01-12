using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;

namespace CryptoFunctions
{
    public class EncodingFunctions
    {
        public byte[] ConvertStringToByteArray(string input) {
            return SoapHexBinary.Parse(input).Value;
        } 

        public byte[] XorArrays(byte[] array1, byte[] array2) {
            var outputArray = new byte[array1.Length];

            for (var i = 0; i< array1.Length; i++) {
                outputArray[i] = (byte)(array1[i] ^ array2[i % array2.Length]);
            }
            return outputArray;
        }

        public Tuple<int, string> GetEnglishScore(byte[] array1) {
            var bestScore = Tuple.Create<int, string> (0, "");

            List<string> allOutput = new List<string>();

            for (var xorNumber = 0; xorNumber < 256; xorNumber++) {
                var text = ByteArrayToText(XorArrays(array1, new byte[] { (byte)xorNumber }));
                var score = text.Count(c => char.IsLetter(c) || char.IsWhiteSpace(c));
                allOutput.Add($"{score} = {text}");
                
                if (bestScore.Item1 >= score) { continue; }

                bestScore = Tuple.Create<int, string>(score, text);
            }

            return bestScore;
        }


        public string ByteArrayToText(byte[] array) {
            return Encoding.ASCII.GetString(array);
        }

        public string ByteArrayToHex(byte[] array) {
            return BitConverter.ToString(array).Replace("-","").ToLower();
        }

        public void InitialConversion() {
            var stringToConvert = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d";

            var bytesOfString = ConvertStringToByteArray(stringToConvert);

            var base64string = System.Convert.ToBase64String(bytesOfString);

        }
    }
}
