using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class Reverse
    {
        static string ReverseString(string word)
        {
            char[] arr = word.ToCharArray();
            Array.Reverse(arr);
            return new string(arr);
        }
        static void Main()
        {
            Console.WriteLine("Enter a sentence..");
            string input = Console.ReadLine();
            string[] words = input.Split(' ');
            for (int i=0; i <words.Length; i++)
            {
                if (i % 2 == 1)
                {
                    words[i] = ReverseString(words[i]);
                }
            }
            string result = string.Join(" ",words);
            Console.WriteLine("output: " +result);

        }
    }
}
