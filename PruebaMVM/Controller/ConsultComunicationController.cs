using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PruebaMVM.Controller
{
    public class ConsultComunicationController : generic.ConnectionString
    {
        String IDCargo;String IDResponsable;
        String Cadena = sp;
        SqlCommand cmd;
        DataSet dtac;
        public string IDCargo1 { get => IDCargo; set => IDCargo = value; }
        public string IDResponsable1 { get => IDResponsable; set => IDResponsable = value; }


        public ConsultComunicationController(string idcargo, string idresponsable)
        {
            IDCargo1 = idcargo;
            IDResponsable1 = idresponsable;
        }

        
        public DataSet ExecuteProsedureConsult()
        {
            String mensaje = "";
            try
            {
                Connection conn = new Connection(Cadena);
                conn.OpenConnection();
                cmd = new SqlCommand("usp_Comunicaciones_Consultar", conn.conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDCargo", SqlDbType.Int);
                cmd.Parameters.Add("@IDResposable", SqlDbType.VarChar,10);
                cmd.Parameters["@IDCargo"].Value = IDCargo1;
                cmd.Parameters["@IDResposable"].Value = IDResponsable1;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                dtac = new DataSet();
                da.Fill(dtac);
                IDCargo = dtac.Tables[0].Rows[0][0].ToString();
                IDResponsable = dtac.Tables[0].Rows[0][1].ToString();

                conn.CloseConnetion();
            }
            catch (Exception e)
            {
                mensaje = "Dato no encontrado"+ e.Message;
            }


            return dtac;
        }
    }
}