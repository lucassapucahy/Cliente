using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using bus_Prova;
using Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;


namespace WebApplication2.Pages
{
    public class IndexModel : PageModel
    {
        [BindProperty]
        public List<Cliente> clientes { get; set; }

        private ClienteService _clienteService;
        public IndexModel()
        {
            _clienteService = new ClienteService();
        }

        public void OnGet()
        {
            clientes = _clienteService.Listar();
        }
    }
}
