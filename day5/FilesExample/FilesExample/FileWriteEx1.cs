using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace FilesExample
{
    internal class FileWriteEx1
    {
        static void Main(string[] args)
        {
            FileStream fs = new FileStream(@"c:\Training\Files.txt", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine("Hellow World......");
            sw.WriteLine("This is DotNet....");
            sw.Flush();
            sw.Close();
            sw.Close();
            Console.WriteLine("Files Created Successfully");
        }
    }
}
