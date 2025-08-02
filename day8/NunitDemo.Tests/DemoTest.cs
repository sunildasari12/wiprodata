using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NunitDemo.Tests
{
    [TestFixture]
    public class DemoTest
    {
        [Test]
        public void TestSayHello()
        {
            Demo demo = new Demo();

            Assert.AreEqual("Welcome to C# FSD Programming...", demo.SayHello());
        }
    }
}

