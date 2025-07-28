using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Text;
using System.Threading.Tasks;

namespace CollectionsExample
{
    internal class Example2
    {
        static void Main()
        {
            Employe employ1 = new Employe();
            employ1.Empno = 1;
            employ1.Name = "Rajesh";
            employ1.Basic = 88233.11;

            Employe employ2 = new Employe();
            employ2.Empno = 2;
            employ2.Name = "Sunil";
            employ2.Basic = 98822.11;

            Employe employ3 = new Employe();
            employ3.Empno = 3;
            employ3.Name = "Yamini";
            employ3.Basic = 89911.11;

            ArrayList arrayList = new ArrayList();
            arrayList.Add(employ1);
            arrayList.Add(employ2);
            arrayList.Add(employ3);
            //arrayList.Add(12);

            foreach (object obj in arrayList)
            {
                Employe employ = (Employe)obj;
                Console.WriteLine(employ);
            }
        }
    }
}
