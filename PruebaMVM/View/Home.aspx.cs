using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//using propios
using PruebaMVM.Controller;

namespace PruebaMVM.View
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(mainconn);
            sqlcon.Open();
            string sqlquery = "select * from dbo.tblEmpleados where IDCargo=" + DropDownList1.SelectedValue + "";
            SqlDataAdapter sda = new SqlDataAdapter(sqlquery, sqlcon);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DropDownList2.DataSource = ds.Tables[0];
            DropDownList2.DataTextField = ds.Tables[0].Columns["Nombre"].ToString();
            DropDownList2.DataValueField = ds.Tables[0].Columns["Documento"].ToString();
            DropDownList2.DataBind();
            sqlcon.Close();
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddWorker.aspx");
        }

        protected void btnAddComunications_Click(object sender, EventArgs e)
        {
            FileUpload1.SaveAs(@"C:\Users\Usuario\source\repos\PruebaMVM\PruebaMVM\images\" + FileUpload1.FileName);

            string saveFile = @"C:\Users\Usuario\source\repos\PruebaMVM\PruebaMVM\images\" + FileUpload1.FileName;

            SenderController sc = new SenderController(txtDoc.Text, txtName.Text, txtAddress.Text, txtPhone.Text);
                string responseSender = sc.ExecuteProcedureInsertSender();

            ComunicationController cc = new ComunicationController(saveFile, DropDownList2.SelectedValue, txtDoc.Text, DropDownList1.SelectedValue);
            string responseComunication = cc.ExecuteProcedureInsertComunication();

            Response.Write("<script LANGUAGE='JavaScript' >alert('" + responseSender + "')</script>");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}