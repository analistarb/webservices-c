using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace webServiceCliente
{
    public class Produto
    {
        public int ProdutoID { get; set; }
        public string Descricao { get; set; }
        public int ProdutoCategoriaId { get; set; }
        public DateTime DataCadastro { get; set; }
    }
}
