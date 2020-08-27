using System;
using System.ComponentModel;

namespace Dominio
{
    public class Cliente
    {
        [DisplayName("Id")]
        public int cod_cliente { get; set; }
        [DisplayName("Nome")]
        public string nom_cliente { get; set; }
        [DisplayName("Data de Cadastro")]
        public DateTime dt_cadastramento { get; set; }
        [DisplayName("Ativo")]
        public bool fl_ativo { get; set; }
        [DisplayName("Descrição")]
        public string des_observacao { get; set; }
    }
}
