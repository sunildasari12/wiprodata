using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class ArrayExample
    {
        public void Show()
        {
            int[] a = new int[] { 12, 5, 23, 66, 22 };
            foreach (int i in a)
            {
                Console.WriteLine(i);
            }
        }
        static void Main()
        {
            ArrayExample example = new ArrayExample();
            example.Show();
        }
    }
}
