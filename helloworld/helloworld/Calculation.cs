using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Helloworld
{
    internal class Calculation
    {
        static void Main()
        {
            int a, b, c;
            Console.WriteLine("Enter 2 Number ");
            a = Convert.ToInt32 (Console.ReadLine());
            b = Convert.ToInt32 ((Console.ReadLine()));
            c = a + b;
            Console.WriteLine("sum is  "+c);
            c = a - b;
            Console.WriteLine("Sub is  " +c);
            c = a * b;
            Console.WriteLine("mult is  " +c);
        }
    }
}
