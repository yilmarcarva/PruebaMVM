using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Using propios
using PruebaMVM.Controller;

namespace PruebaMVM.View
{
    public partial class ConsultComunication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
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


        protected void btnGetComunications_Click(object sender, EventArgs e)
        {
            ConsultComunicationController cns = new ConsultComunicationController(DropDownList1.SelectedValue, DropDownList2.SelectedValue);
            DataSet response = cns.ExecuteProsedureConsult();
            GridView1.DataSource = response;
            GridView1.DataBind();
            GridView1.SortedDescendingCellStyle.Width = 100;
            
        }
    }
}