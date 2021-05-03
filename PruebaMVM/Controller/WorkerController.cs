using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PruebaMVM.Controller
{
    public class WorkerController : generic.ConnectionString
    {
        String Documento; String Nombre; int IDCargo; String Direccion; String Telefono;
        String Cadena = sp;
        SqlCommand cmd;

        public string Documento1 { get => Documento; set => Documento = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public int IDCargo1 { get => IDCargo; set => IDCargo = value; }
        public string Direccion1 { get => Direccion; set => Direccion = value; }
        public string Telefono1 { get => Telefono; set => Telefono = value; }

        public WorkerController(string documento, string nombre, int idcargo, string direccion, string telefono)
        {
            Documento1 = documento;
            Nombre1 = nombre;
            IDCargo1 = idcargo;
            Direccion1 = direccion;
            Telefono1 = telefono;
        }


        public String ExecuteProcedureInsert()
        {
            String mensaje = "";
            try
            {
                Connection conn = new Connection(Cadena);
                conn.OpenConnection();
                cmd = new SqlCommand("dbo.usp_Responsable_Actualizar", conn.conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Documento", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 1000);
                cmd.Parameters.Add("@IDCargo", SqlDbType.Int);
                cmd.Parameters.Add("@Direccion", SqlDbType.VarChar, 200);
                cmd.Parameters.Add("@Telefono", SqlDbType.VarChar, 10);
                cmd.Parameters["@Documento"].Value = Documento1;
                cmd.Parameters["@Nombre"].Value = Nombre1;
                cmd.Parameters["@IDCargo"].Value = IDCargo1;
                cmd.Parameters["@Direccion"].Value = Direccion1;
                cmd.Parameters["@Telefono"].Value = Telefono1;
                cmd.ExecuteNonQuery();
                mensaje = "Exitoso";
            }
            catch (Exception e)
            {
                mensaje = "Error al ejecutar el procedimiento dbo.usp_Responsable_Actualizar "+e.Message;
            }

            return mensaje;

        }
    }

}