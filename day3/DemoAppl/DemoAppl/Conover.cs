using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoAppl
{
    internal class Conover
    {
        int a, b;

        public Conover()
        {
            a = 1;
            b = 2;
        }
        public Conover(int a, int b)
        {
            this.a = a;
            this.b = b;
        }
        public void Show()
        {
            Console.WriteLine("A value is " + a + " B value is " + b);
        }
        static void Main()
        {
            Conover obj1 = new Conover();
            obj1.Show();
            Conover obj2 = new Conover(75, 19);
            obj2.Show();
        }
    }
}
