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
    public class NovoClienteModel : PageModel
    {
        [BindProperty]
        public Cliente cliente { get; set; }

        private ClienteService _clienteService;
        public NovoClienteModel()
        {
            _clienteService = new ClienteService();
        }

        public void OnGet()
        {

        }

        public IActionResult OnPost() 
        {
            var cliente = new Cliente
            {
                nom_cliente = this.cliente.nom_cliente,
                des_observacao = this.cliente.des_observacao,
                fl_ativo = true,
                dt_cadastramento = DateTime.Now
            };

            _clienteService.Adicionar(cliente);
            return Redirect("./Index");
        }
    }
}
