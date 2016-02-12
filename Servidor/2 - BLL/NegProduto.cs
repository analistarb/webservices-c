using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class NegProduto
    {

        public List<Produto> ConsultarProduto(int? intProdutoId)
        {
            try
            {
                List<Produto> produtoColecao = new List<Produto>();

                using (var bancoDados = new webserviceEntities())
                {
                    var produtoSelecionado = from p in bancoDados.Produto
                                             where ((p.ProdutoId.Equals(intProdutoId)) ||
                                                   (intProdutoId == null))
                                             select p;

                    if (produtoSelecionado.Count() > 0)
                    {
                        foreach (Produto item in produtoSelecionado)
                        {
                            Produto novoItem = new Produto();
                            novoItem.ProdutoId = item.ProdutoId;
                            novoItem.Descricao = item.Descricao;
                            novoItem.DataCadastro = item.DataCadastro;
                            novoItem.ProdutoCategoria = new ProdutoCategoria
                            {
                                ProdutoCategoriaId = item.ProdutoCategoria.ProdutoCategoriaId,
                                Descricao = item.ProdutoCategoria.Descricao
                            };

                            produtoColecao.Add(novoItem);
                        }
                    }
                }


                return produtoColecao;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

    }
}
