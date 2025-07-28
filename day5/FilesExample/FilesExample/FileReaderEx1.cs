using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace FilesExample
{
    internal class FileReaderEx1
    {
        static void Main()
        {
            FileStream fs = new FileStream(@"D:\wipro\day5\CollectionsExample\CollectionsExample\OutParamEx1.cs", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            sr.BaseStream.Seek(0, SeekOrigin.Begin);
            string line;
            while((line = sr.ReadLine()) != null)
            {
                Console.WriteLine(line);
            }
            sr.Close();
            fs.Close();
        }
    }
}
