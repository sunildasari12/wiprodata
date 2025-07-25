using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbstractEx1
{
    internal abstract class Program
    {
        static void Main(string[] args)
        {
            //Training obj1 = new Rajesh();
            //Training obj2 = new Venkat();
            //Training obj3 = new Mahi();

            //int[] a =new int[] { 1, 2, 3, 4 };

            Training[] arrTraining = new Training[]
            {
                new Venkat(),
                new Rajesh(),
                new Mahi()
            };

            foreach (Training t in arrTraining)
            {
                t.Company();
                t.Email();
                t.Name();
                Console.WriteLine("-----------------------------");
            }
        }
    }
}
