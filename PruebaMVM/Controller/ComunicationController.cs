using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PruebaMVM.Controller
{
    public class ComunicationController : generic.ConnectionString
    {
        String RutaComunicacion; String IDResponsable; String IDRemintente;String IDTipoComunicacion;
        String Cadena = sp;
        SqlCommand cmd;

        public string RutaComunicacion1 { get => RutaComunicacion; set => RutaComunicacion = value; }
        public string IDResponsable1 { get => IDResponsable; set => IDResponsable = value; }
        public string IDRemintente1 { get => IDRemintente; set => IDRemintente = value; }
        public string IDTipoComunicacion1 { get => IDTipoComunicacion; set => IDTipoComunicacion = value; }

        public ComunicationController(string rutacomunicacion, string idresposable, string idremitente, string idtipocomunicacion)
        {
            RutaComunicacion1 = rutacomunicacion;
            IDResponsable1 = idresposable;
            IDRemintente1 = idremitente;
            IDTipoComunicacion1 = idtipocomunicacion;
        }

        public String ExecuteProcedureInsertComunication()
        {
            String mensaje = "";
            try
            {
                Connection conn = new Connection(Cadena);
                conn.OpenConnection();
                cmd = new SqlCommand("dbo.usp_Comunicaciones_Actualizar", conn.conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@RutaComunicacion", SqlDbType.VarChar, 100);
                cmd.Parameters.Add("@IDResponsable", SqlDbType.VarChar, 200);
                cmd.Parameters.Add("@IDRemitente", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@IDTipoComunicacion", SqlDbType.Int);
                cmd.Parameters["@RutaComunicacion"].Value = RutaComunicacion1;
                cmd.Parameters["@IDResponsable"].Value = IDResponsable1;
                cmd.Parameters["@IDRemitente"].Value = IDRemintente1;
                cmd.Parameters["@IDTipoComunicacion"].Value = IDTipoComunicacion1;
                cmd.ExecuteNonQuery();
                mensaje = "Registro exitoso";
            }
            catch (Exception e)
            {
                mensaje = "Error al ejecutar el procedimiento dbo.usp_Remitente_Actualizar " + e.Message;
            }

            return mensaje;

        }
    }
}