using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class ArrayCopy
    {
        public void Show()
        {
            int[] a = new int[] { 16, 18, 25, 40, 60 };
            int[] b = a;
            for (int i = 0; i < b.Length; i++)
            {
                Console.WriteLine(b[i]);
            }
        }
        static void Main()
        {
            ArrayCopy arrayCopy = new ArrayCopy();
            arrayCopy.Show();
        }
    }
}
