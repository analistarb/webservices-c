using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Windows.Forms;


namespace webServiceCliente
{
    public partial class Form1 : Form
    {
        webService.wsProdutoSoapClient wsProduto;
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        string strJson = "";
        List<Produto> lstProduto = new List<Produto>();


        public Form1()
        {
            InitializeComponent();
        }

        private void btnConsultarProduto_Click(object sender, EventArgs e)
        {
            try
            {
                wsProduto = new webService.wsProdutoSoapClient();

                strJson = wsProduto.ConsultarProduto();
                lstProduto = jsSerializer.Deserialize<List<Produto>>(strJson);

                if (lstProduto.Count() > 0)
                {
                    dgwProduto.DataSource = null;
                    dgwProduto.DataSource = lstProduto;
                }
                else
                {
                    MessageBox.Show("A consulta não retorno nenhum registro.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao consultar produtos no web service. Detalhes " + ex.Message);
            }
        }
    }
}
