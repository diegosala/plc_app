namespace PLC
{
    partial class FormMain
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
            this.btnEmpezar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtServidor = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtGrupo = new System.Windows.Forms.TextBox();
            this.txtItem = new System.Windows.Forms.TextBox();
            this.btnConectar = new System.Windows.Forms.Button();
            this.btnAgregarGrupo = new System.Windows.Forms.Button();
            this.btnAgregarItem = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtValor = new System.Windows.Forms.TextBox();
            this.txtUltimaLectura = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnEmpezar
            // 
            this.btnEmpezar.Enabled = false;
            this.btnEmpezar.Location = new System.Drawing.Point(12, 182);
            this.btnEmpezar.Name = "btnEmpezar";
            this.btnEmpezar.Size = new System.Drawing.Size(260, 36);
            this.btnEmpezar.TabIndex = 0;
            this.btnEmpezar.Text = "Leer";
            this.btnEmpezar.UseVisualStyleBackColor = true;
            this.btnEmpezar.Click += new System.EventHandler(this.btnEmpezar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Servidor:";
            // 
            // txtServidor
            // 
            this.txtServidor.Location = new System.Drawing.Point(67, 11);
            this.txtServidor.Name = "txtServidor";
            this.txtServidor.Size = new System.Drawing.Size(205, 20);
            this.txtServidor.TabIndex = 2;
            this.txtServidor.Text = "S7200.OPCServer";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 40);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Grupo:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 66);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(30, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Item:";
            // 
            // txtGrupo
            // 
            this.txtGrupo.Location = new System.Drawing.Point(67, 37);
            this.txtGrupo.Name = "txtGrupo";
            this.txtGrupo.Size = new System.Drawing.Size(205, 20);
            this.txtGrupo.TabIndex = 5;
            this.txtGrupo.Text = "Group1";
            // 
            // txtItem
            // 
            this.txtItem.Location = new System.Drawing.Point(68, 63);
            this.txtItem.Name = "txtItem";
            this.txtItem.Size = new System.Drawing.Size(204, 20);
            this.txtItem.TabIndex = 6;
            // 
            // btnConectar
            // 
            this.btnConectar.Location = new System.Drawing.Point(12, 89);
            this.btnConectar.Name = "btnConectar";
            this.btnConectar.Size = new System.Drawing.Size(260, 25);
            this.btnConectar.TabIndex = 7;
            this.btnConectar.Text = "Conectar";
            this.btnConectar.UseVisualStyleBackColor = true;
            this.btnConectar.Click += new System.EventHandler(this.btnConectar_Click);
            // 
            // btnAgregarGrupo
            // 
            this.btnAgregarGrupo.Enabled = false;
            this.btnAgregarGrupo.Location = new System.Drawing.Point(12, 120);
            this.btnAgregarGrupo.Name = "btnAgregarGrupo";
            this.btnAgregarGrupo.Size = new System.Drawing.Size(260, 25);
            this.btnAgregarGrupo.TabIndex = 8;
            this.btnAgregarGrupo.Text = "Agregar Grupo";
            this.btnAgregarGrupo.UseVisualStyleBackColor = true;
            this.btnAgregarGrupo.Click += new System.EventHandler(this.btnAgregarGrupo_Click);
            // 
            // btnAgregarItem
            // 
            this.btnAgregarItem.Enabled = false;
            this.btnAgregarItem.Location = new System.Drawing.Point(12, 151);
            this.btnAgregarItem.Name = "btnAgregarItem";
            this.btnAgregarItem.Size = new System.Drawing.Size(260, 25);
            this.btnAgregarItem.TabIndex = 9;
            this.btnAgregarItem.Text = "Agregar Item";
            this.btnAgregarItem.UseVisualStyleBackColor = true;
            this.btnAgregarItem.Click += new System.EventHandler(this.btnAgregarItem_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 229);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(34, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "Valor:";
            // 
            // txtValor
            // 
            this.txtValor.Location = new System.Drawing.Point(67, 226);
            this.txtValor.Name = "txtValor";
            this.txtValor.Size = new System.Drawing.Size(205, 20);
            this.txtValor.TabIndex = 11;
            // 
            // txtUltimaLectura
            // 
            this.txtUltimaLectura.Location = new System.Drawing.Point(67, 252);
            this.txtUltimaLectura.Name = "txtUltimaLectura";
            this.txtUltimaLectura.Size = new System.Drawing.Size(205, 20);
            this.txtUltimaLectura.TabIndex = 12;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(279, 280);
            this.Controls.Add(this.txtUltimaLectura);
            this.Controls.Add(this.txtValor);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnAgregarItem);
            this.Controls.Add(this.btnAgregarGrupo);
            this.Controls.Add(this.btnConectar);
            this.Controls.Add(this.txtItem);
            this.Controls.Add(this.txtGrupo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtServidor);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnEmpezar);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnEmpezar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtServidor;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtGrupo;
        private System.Windows.Forms.TextBox txtItem;
        private System.Windows.Forms.Button btnConectar;
        private System.Windows.Forms.Button btnAgregarGrupo;
        private System.Windows.Forms.Button btnAgregarItem;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtValor;
        private System.Windows.Forms.TextBox txtUltimaLectura;
    }
}

