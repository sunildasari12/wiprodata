using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoAppl
{
    internal class JaggedArrayex1
    {
        static void Main()
        {
            int[][] jaggedArray = new int[2][];

            int[] x = new int[] { 1, 3, 12 };
            int[] y = new int[] { 19, 41, 50 };

            jaggedArray[0] = x;
            jaggedArray[1] = y;

            Console.WriteLine(jaggedArray[0][0]);
            Console.WriteLine(jaggedArray[0][1]);
            Console.WriteLine(jaggedArray[0][2]);

            Console.WriteLine("***********************");

            Console.WriteLine(jaggedArray[1][0]);
            Console.WriteLine(jaggedArray[1][1]);
            Console.WriteLine(jaggedArray[1][2]);
        }
    }
}
