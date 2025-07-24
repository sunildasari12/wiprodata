using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CalculationLibrary;

namespace CalculationCleint
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Calculation calculation = new Calculation();
            int a, b;
            Console.WriteLine("Enter 2 Numbers  ");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Sum is " +calculation.Sum(a, b));
            Console.WriteLine("Sub is " + calculation.Sub(a, b));
            Console.WriteLine("Mul is " + calculation.Mult(a, b));

        }
    }
}
