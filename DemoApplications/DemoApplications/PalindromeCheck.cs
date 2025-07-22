using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplications
{
    internal class PalindromeCheck
    {
        public bool Check(string str)
        {
            char[] chars = str.ToCharArray();
            string rev = "";
            for (int i = chars.Length - 1; i >= 0; i--)
            {
                rev += chars[i];
            }
            Console.WriteLine(rev);
            if (rev.Equals(str))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        static void Main()
        {
            string str = "welcom liril soap malayalam language madam shalini";
            PalindromeCheck obj = new PalindromeCheck();
            Console.WriteLine(obj.Check(str));
        }
    }
}
