﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class Boxing
    {
        static void Main()
        {
            int x = 54;
            string str = "Company";
            double y = 13;

            /* Implement Boxing */
            object ob1 = x;
            object ob2 = str;
            object ob3 = y;

            /* Implement Unboxing */

            int x1 = (Int32)ob1;
            string str1 = (string)ob2;
            double y1 = (Double)ob3;

            Console.WriteLine(x1);
            Console.WriteLine(str1);
            Console.WriteLine(y1);
        }
    }
}
