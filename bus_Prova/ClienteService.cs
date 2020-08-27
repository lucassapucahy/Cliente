using db_Prova;
using Dominio;
using System;
using System.Collections.Generic;
using System.Text;

namespace bus_Prova
{
    public class ClienteService
    {
        private readonly ClienteRepository _clienteRepository;
        public ClienteService()
        {
            _clienteRepository = new ClienteRepository();
        }

        public List<Cliente> Listar()
        {
            return _clienteRepository.Listar();
        }

        public Cliente BuscarPorId(int cod_cliente)
        {
            return _clienteRepository.BuscarPorId(cod_cliente);
        }

        public void Adicionar(Cliente cliente)
        {
            _clienteRepository.Adicionar(cliente);
        }

        public void Atualizar(Cliente cliente)
        {
            _clienteRepository.Atualizar(cliente);
        }

        public void Excluir(int cod_cliente)
        {
            _clienteRepository.Excluir(cod_cliente);
        }
    }
}
