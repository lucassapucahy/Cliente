using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using bus_Prova;
using Dominio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Prova.WebUI.Pages
{
    public class EditarClienteModel : PageModel
    {
        [BindProperty]
        public Cliente cliente { get; set; }
        private ClienteService _clienteService;

        public EditarClienteModel()
        {
            _clienteService = new ClienteService();
        }

        public void OnGet(int id)
        {
            var clienteRecuperadoBanco = _clienteService.BuscarPorId(id);
            this.cliente = clienteRecuperadoBanco;
        }

        public IActionResult OnPost()
        {
            _clienteService.Atualizar(this.cliente);
            return Redirect("./Index");
        }

    }
}
