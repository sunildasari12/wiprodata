using DotnetCoreExample.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace DotnetCoreExample.Pages
{
    public class EmployeeShowModel : PageModel
    {
        public List<Employee> Employees { get; private set; }

        public void OnGet()
        {
            Employees = new List<Employee>
            {
                new Employee{Empno=1,Name="Yamini",Basic=83234},
                new Employee{Empno=2,Name="Sunil",Basic=83257},
                new Employee{Empno=3,Name="Shiva",Basic=83534},

            };
        }
    }
}
