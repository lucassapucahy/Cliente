using Dapper;
using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;

namespace db_Prova
{
    public class ClienteRepository
    {
        private readonly SqlConnection _conn;
        public ClienteRepository()
        {
            _conn = new SqlConnection("Data Source=DESKTOP-Q0SS7U2;Initial Catalog=db_Estudo;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        }

        public List<Cliente> Listar() 
        {
            var clientes = _conn.Query<Cliente>("Listar",commandType:System.Data.CommandType.StoredProcedure).ToList();
            return clientes;
        }

        public Cliente BuscarPorId(int cod_cliente)
        {
            var cliente = _conn.Query<Cliente>("BuscarPorId", new { cod_cliente }, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
            return cliente;
        }

        public void Adicionar(Cliente cliente)
        {
            _conn.Execute("InsereCliente", 
                new { nom_cliente = cliente.nom_cliente, dt_cadastramento=cliente.dt_cadastramento, fl_ativo = cliente.fl_ativo, des_observacao = cliente.des_observacao } , 
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public void Atualizar(Cliente cliente)
        {
            _conn.Execute("AtualizaCliente", cliente, commandType: System.Data.CommandType.StoredProcedure);

        }

        public void Excluir(int cod_cliente)
        {
            _conn.Execute("ExcluirCliente", new { cod_cliente }, commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
