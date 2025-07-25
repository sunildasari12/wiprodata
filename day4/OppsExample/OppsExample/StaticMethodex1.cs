using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OppsExample
{
    class Data
    {
        public void Show()
        {
            Console.WriteLine("Show Method from Class Data...");
        }

        public static void Display()
        {
            Console.WriteLine("Display Method from Class Data...");
        }
    }
    internal class StaticMethodex1
    {
        static void Main()
        {
            Data.Display();
            new Data().Show();
        }
    }
}
