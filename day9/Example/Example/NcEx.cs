using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Example
{
    internal class NcEx
    {
        static void Main()
        {
            string s1 = null;
            string s2 = "Welcom";
            string s3 = "Bye";

            string s4 = s1 ?? s2;
            Console.WriteLine(s4);
            s4 = s3 ?? s2;
            Console.WriteLine(s4);
        }
    }
}
