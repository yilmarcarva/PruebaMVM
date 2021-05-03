using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using propios
using PruebaMVM.Controller;

namespace PruebaMVM.View
{
    public partial class AddWorker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddWorker_Click(object sender, EventArgs e)
        {
            WorkerController wc = new WorkerController(txtDoc.Text, txtName.Text, Convert.ToInt16(DropDownList1.SelectedValue), txtAddress.Text, txtPhone.Text);
            string response = wc.ExecuteProcedureInsert();
            Response.Write("<script LANGUAGE='JavaScript' >alert('"+response+"')</script>");
            txtDoc.Text = null;
            txtName.Text = null;
            txtAddress.Text = null;
            txtPhone.Text = null;
        }
    }
}