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
            this.label1 = new System.Windows.Forms.Label();
            this.txtServidor = new System.Windows.Forms.TextBox();
            this.btnConectar = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.lblEstado = new System.Windows.Forms.ToolStripStatusLabel();
            this.label2 = new System.Windows.Forms.Label();
            this.txtOnLine = new System.Windows.Forms.TextBox();
            this.txtReadEnable = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtMemoryPos = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Servidor:";
            // 
            // txtServidor
            // 
            this.txtServidor.Location = new System.Drawing.Point(89, 11);
            this.txtServidor.Name = "txtServidor";
            this.txtServidor.ReadOnly = true;
            this.txtServidor.Size = new System.Drawing.Size(95, 20);
            this.txtServidor.TabIndex = 2;
            this.txtServidor.Text = "S7200.OPCServer";
            // 
            // btnConectar
            // 
            this.btnConectar.Location = new System.Drawing.Point(12, 114);
            this.btnConectar.Name = "btnConectar";
            this.btnConectar.Size = new System.Drawing.Size(172, 25);
            this.btnConectar.TabIndex = 7;
            this.btnConectar.Text = "Conectar";
            this.btnConectar.UseVisualStyleBackColor = true;
            this.btnConectar.Click += new System.EventHandler(this.btnConectar_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lblEstado});
            this.statusStrip1.Location = new System.Drawing.Point(0, 147);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(194, 22);
            this.statusStrip1.SizingGrip = false;
            this.statusStrip1.TabIndex = 12;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // lblEstado
            // 
            this.lblEstado.Name = "lblEstado";
            this.lblEstado.Size = new System.Drawing.Size(49, 17);
            this.lblEstado.Text = "Inactivo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(14, 40);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "On Line:";
            // 
            // txtOnLine
            // 
            this.txtOnLine.Location = new System.Drawing.Point(89, 37);
            this.txtOnLine.Name = "txtOnLine";
            this.txtOnLine.ReadOnly = true;
            this.txtOnLine.Size = new System.Drawing.Size(95, 20);
            this.txtOnLine.TabIndex = 14;
            // 
            // txtReadEnable
            // 
            this.txtReadEnable.Location = new System.Drawing.Point(89, 62);
            this.txtReadEnable.Name = "txtReadEnable";
            this.txtReadEnable.ReadOnly = true;
            this.txtReadEnable.Size = new System.Drawing.Size(95, 20);
            this.txtReadEnable.TabIndex = 16;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 65);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(72, 13);
            this.label3.TabIndex = 15;
            this.label3.Text = "Read Enable:";
            // 
            // txtMemoryPos
            // 
            this.txtMemoryPos.Location = new System.Drawing.Point(89, 88);
            this.txtMemoryPos.Name = "txtMemoryPos";
            this.txtMemoryPos.ReadOnly = true;
            this.txtMemoryPos.Size = new System.Drawing.Size(95, 20);
            this.txtMemoryPos.TabIndex = 18;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(14, 91);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 13);
            this.label4.TabIndex = 17;
            this.label4.Text = "Memory Pos:";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(194, 169);
            this.Controls.Add(this.txtMemoryPos);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtReadEnable);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtOnLine);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.btnConectar);
            this.Controls.Add(this.txtServidor);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormMain";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.Text = "Log PLC";
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtServidor;
        private System.Windows.Forms.Button btnConectar;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel lblEstado;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtOnLine;
        private System.Windows.Forms.TextBox txtReadEnable;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtMemoryPos;
        private System.Windows.Forms.Label label4;
    }
}

