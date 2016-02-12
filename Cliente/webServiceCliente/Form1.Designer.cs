namespace webServiceCliente
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnConsultarProduto = new System.Windows.Forms.Button();
            this.dgwProduto = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgwProduto)).BeginInit();
            this.SuspendLayout();
            // 
            // btnConsultarProduto
            // 
            this.btnConsultarProduto.Location = new System.Drawing.Point(425, 311);
            this.btnConsultarProduto.Name = "btnConsultarProduto";
            this.btnConsultarProduto.Size = new System.Drawing.Size(75, 23);
            this.btnConsultarProduto.TabIndex = 0;
            this.btnConsultarProduto.Text = "Consultar";
            this.btnConsultarProduto.UseVisualStyleBackColor = true;
            this.btnConsultarProduto.Click += new System.EventHandler(this.btnConsultarProduto_Click);
            // 
            // dgwProduto
            // 
            this.dgwProduto.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgwProduto.Location = new System.Drawing.Point(12, 12);
            this.dgwProduto.Name = "dgwProduto";
            this.dgwProduto.Size = new System.Drawing.Size(488, 273);
            this.dgwProduto.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(512, 346);
            this.Controls.Add(this.dgwProduto);
            this.Controls.Add(this.btnConsultarProduto);
            this.Name = "Form1";
            this.Text = "Consultar Produtos ";
            ((System.ComponentModel.ISupportInitialize)(this.dgwProduto)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnConsultarProduto;
        private System.Windows.Forms.DataGridView dgwProduto;
    }
}

