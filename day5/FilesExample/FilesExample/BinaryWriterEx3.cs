using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace FilesExample
{
    internal class BinaryWriterEx3
    {
        static void Main()
        {
            FileStream fs = new FileStream(@"c:\Training\Files.txt", FileMode.Create, FileAccess.Write);
            BinaryWriter bw = new BinaryWriter(fs);
            bw.Write(63);
            bw.Write("Wipro");
            bw.Write(3333.99);
            bw.Write(true);
            bw.Close();
            bw.Close();
            Console.WriteLine("Primitive Data Stored in files");
        }
    }
}
