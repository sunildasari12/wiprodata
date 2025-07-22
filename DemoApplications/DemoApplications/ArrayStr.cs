using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class ArrayStr
    {
        public void Show()
        {
            string[] names = new string[]
            {
                "Siri","Sai","Pavan","Krishna","Sunil"
            };
            foreach (string name in names)
            {
                Console.WriteLine(name);
            }

        }
        static void Main()
        {
            ArrayStr arrayStr = new ArrayStr();
            arrayStr.Show();
        }
    }
}
