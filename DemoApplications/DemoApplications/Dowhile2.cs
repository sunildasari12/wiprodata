using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class Dowhile2
    {
        static void Main()
        {
            int i = 4;
            do
            {
                Console.WriteLine(i);
                i++;
            } while (i <= 15);
        }
    }
}
