using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using bus_Prova;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Prova.WebUI.Pages
{
    public class DeletarClienteModel : PageModel
    {
        [BindProperty]
        public int cod_cliente { get; set; }

        private ClienteService _clienteService;
        public DeletarClienteModel()
        {
            _clienteService = new ClienteService();
        }

        public void OnGet(int id) 
        {
            this.cod_cliente = id;
        }

        public IActionResult OnPost() 
        {
            _clienteService.Excluir(this.cod_cliente);
            return Redirect("./Index");
        }

    }
}
