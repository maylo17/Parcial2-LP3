<%@ Page Title="" Language="C#" MasterPageFile="~/paginaMaestra.Master" AutoEventWireup="true" CodeBehind="Prueba2.aspx.cs" Inherits="ParcialLP3.Prueba2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
        <br />
        <asp:Button ID="ButtonUpload" runat="server" OnClick="ButtonUpload_Click" Text="Subir Archivos" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre del Archivo" />
                <asp:ButtonField ButtonType="Button" CommandName="Descargar" HeaderText="Descargar" Text="Descargar" />
            </Columns>
        </asp:GridView>
        <br />
    </div>
</asp:Content>
