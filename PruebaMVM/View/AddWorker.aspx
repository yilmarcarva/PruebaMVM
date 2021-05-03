<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWorker.aspx.cs" Inherits="PruebaMVM.View.AddWorker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"/>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <title>Añadir Responsables</title>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
              <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Comunicaciones</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Home.aspx">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ConsultComunication.aspx">Consultar</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
         <%--aca comienza el cuerpo--%>
        <div class="container" style="align-items:center;align-content:center;float:right">
            <div class="row">
                <div class="col text-center">
                  <label class="col-form-label mb-4 text-dark" style="align-items:center;align-content:center">Agregar Responsables</label>
                </div>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Documento Responsable</label>
                <asp:TextBox ID="txtDoc" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Nombre Remitente</label>
                <asp:TextBox ID="txtName" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Dirección Remitente</label>
                <asp:TextBox ID="txtAddress" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Telefono Remitente</label>
                <asp:TextBox ID="txtPhone" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row" id="myForm">
                    <label class="form-label" style="margin-bottom:10px">Cargo Responsable</label>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                        class="form-select" aria-label="Default select example" style="width:350px" DataSourceID="SqlDataSource1" DataTextField="NombreCargo" DataValueField="ID">
                    </asp:DropDownList>   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT [ID], [NombreCargo] FROM [tblCargos]"></asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            <div class="row mb-5 text-end">
                <div class="col-6 mb-5">
                    <asp:Button ID="btnAddWorker" runat="server" Text="Guardar"  class="btn btn-group btn-success align-content-center" OnClick="btnAddWorker_Click"/>
                </div>
            </div>
        </div>
    </form>
</body>
    <script type="text/javascript">
        function btnAddWorker_Click()

    </script>
</html>
