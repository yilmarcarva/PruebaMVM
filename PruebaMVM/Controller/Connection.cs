using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PruebaMVM.Controller
{
    public class Connection
    {
        public SqlConnection conexion;

        String cadenaConexion;
        public Connection(string cadenaConexion)
        {
            this.cadenaConexion = cadenaConexion;
        }

		public String OpenConnection()
		{
			String mensaje = "";
			try
			{
				conexion = new SqlConnection(cadenaConexion);
				conexion.Open();
				//conex = new SqlConnection(cadena);
				//conex.Open();
			}
			catch (Exception ex)
			{
				mensaje = ex.Message;
			}
			return mensaje;
		}

		public String CloseConnetion()
		{

			String mensaje = "";
			try
			{
				conexion = new SqlConnection(cadenaConexion);
				conexion.Close();
			}
			catch (Exception ex)
			{
				mensaje = ex.Message;
			}
			return mensaje;

		}
	}
}