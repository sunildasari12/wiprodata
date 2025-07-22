using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class Dowhile
    {
        static void Main()
        {
            int count = 20;

            do 
            {
                Console.WriteLine("Hello! This will print at least once.");
            }while (count < 10);
        }
    }
}
