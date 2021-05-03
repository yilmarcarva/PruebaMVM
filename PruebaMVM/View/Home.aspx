<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PruebaMVM.View.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"/>
    <title>Comunicaciones</title>
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
          <a class="nav-link active" aria-current="page" href="#">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ConsultComunication.aspx">Consultar</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
        <%--aca comienza el cuerpo--%>
        <div class="container g-py-100" style="margin-left:20%">
            <div class="row">
                <div class="col-12 text-center">
                  <label class="col-form-label mb-4 text-dark" style="align-items:center;align-content:center">Agregar Comunicaciones</label>
                </div>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Documento Remitente</label>
                <asp:TextBox ID="txtDoc" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Nombre Remitente</label>
                <asp:TextBox ID="txtName" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Telefono Remitente</label>
                <asp:TextBox ID="txtPhone" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Dirección Remitente</label>
                <asp:TextBox ID="txtAddress" runat="server" class="form-control" style="width:300px;"></asp:TextBox>
            </div>
            <div class="row mb-2">
                <label class="form-label" style="margin-bottom:10px">Seleccione comunicación</label>
                <asp:FileUpload  class="form-control" style="width:50%" ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif,.doc,.docx,.xls,.xlsx,.pdf"/>
            </div>
            <div class="row" id="myForm">
                <div class="col-4">
                    <label class="form-label" style="margin-bottom:10px">Seleccione la categoría de la comunicación</label>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                        class="form-select" aria-label="Default select example" style="width:300px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="2">Interna</asp:ListItem>
                        <asp:ListItem Value="3">Externa</asp:ListItem>
                    </asp:DropDownList>   
                </div>
                <div class="col-4">
                    <label class="form-label"  style="margin-bottom:10px">Seleccione el responsable de la comunicación</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        class="form-select" aria-label="Default select example" style="width:350px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                        ></asp:DropDownList>
                        
                </div>
                <div class="col-1">
                    <asp:Button ID="Button1" runat="server" Text="+ Responsable" style="align-items:flex-start;margin-top:40px"
                        class="btn btn-sm btn-primary align-content-center" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
            <div class="row mb-5 text-end mt-3">
                <div class="col-10 mb-5 mt-5">
                    <asp:Button ID="btnAddComunications" runat="server" Text="Guardar" class="btn btn-group btn-success align-content-center" OnClick="btnAddComunications_Click"/>
                </div>
            </div>
        </div>
    </form>

</body>

</html>
