using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegates_Examples
{
    internal class DelegatesEx2
    {
        public delegate void MyDelegate(string s);

        public static void Show(string s)
        {
            Console.WriteLine("Welcom to Delegates from " +s);
        }

        static void Main()
        {
            MyDelegate obj = new MyDelegate(Show);
            obj("Sunil");
        }
    }
}
