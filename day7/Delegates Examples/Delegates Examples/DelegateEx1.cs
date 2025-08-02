using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegates_Examples
{
    internal class DelegateEx1
    {
        public delegate void MyDelegate();

        public static void Show()
        {
            Console.WriteLine("Welcom to Delegates...");
        }

        static void Main()
        {
            MyDelegate obj = new MyDelegate(Show);
            obj();
        }
    }
}
