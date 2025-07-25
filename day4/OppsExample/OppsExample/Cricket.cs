using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OppsExample
{
    internal class Cricket
    {
        static int score;
        public void Increment(int x)
        {
            score += x;
        }

        static void Main()
        {
            Cricket fb = new Cricket();
            Cricket sb = new Cricket();
            Cricket tb = new Cricket();

            fb.Increment(18);
            sb.Increment(100);
            tb.Increment(50);

            Console.WriteLine("Total Score  " + Cricket.score);
        }
    }
}
