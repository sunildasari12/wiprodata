using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegates_Examples
{
    internal class ActionDelegate8
    {
        public delegate void MyDelegate(string str);

        public static void Greeting(string s)
        {
            Console.WriteLine("Good Morning  " + s);
        }

        static void Main()
        {
            //MyDelegate obj = new MyDelegate(Greeting);
            MyDelegate obj = Greeting;
            obj("Sunil");
        }
    }
}
