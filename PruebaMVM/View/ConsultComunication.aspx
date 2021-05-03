<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultComunication.aspx.cs" Inherits="PruebaMVM.View.ConsultComunication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"/>
    <title></title>
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
      </ul>
    </div>
  </div>
</nav>
        <div class="container-lg">
            <div class="row">
                <div class="col-12 text-center">
                  <label class="col-form-label mb-4 text-dark" style="align-items:center;align-content:center">Consultar Comunicaciones</label>
                </div>
            </div>
            <div class="row" id="myForm">
                <div class="col-4">
                    <label class="form-label" style="margin-bottom:10px">Seleccione la categoría de la comunicación</label>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                        class="form-select" aria-label="Default select example" style="width:300px" AutoPostBack="True" DataSourceID="SqlDataSourceCargo" DataTextField="NombreCargo" DataValueField="ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                    </asp:DropDownList>   
                    <asp:SqlDataSource ID="SqlDataSourceCargo" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT [ID], [NombreCargo] FROM [tblCargos] WHERE ([ID] &lt;&gt; @ID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-4">
                    <label class="form-label"  style="margin-bottom:10px">Seleccione el responsable de la comunicación</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        class="form-select" aria-label="Default select example" style="width:350px"
                        ></asp:DropDownList>
                        
                </div>
                <div class="col-4">
                    <asp:Button ID="btnGetComunications" runat="server" Text="Consultar" class="btn btn-group btn-success align-content-center" OnClick="btnGetComunications_Click"/>
                </div>
            </div>
            
        </div>
        <div class="row mt-3">
                <div class="col" >
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="Comunicacion" class="table table-responsive-sm table-bordered " style="margin-right:10%" Width="134px"></asp:GridView>
                </div>
            </div>
    </form>
</body>
</html>
