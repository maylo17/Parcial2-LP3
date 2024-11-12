<%@ Page Title="" Language="C#" MasterPageFile="~/paginaMaestra.Master" AutoEventWireup="true" CodeBehind="Prueba1.aspx.cs" Inherits="ParcialLP3.Prueba1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Formulario de Registro</h2>

    CORREO:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="No completo el campo correo" ForeColor="#CC3300" Display="None"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="El valor ingresado no es un Email" ForeColor="#CC3300" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
    <br />

    USERNAME:
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="No completo el campo username" ForeColor="#CC3300" Display="None"></asp:RequiredFieldValidator>
    <br />

    EDAD:
    <asp:TextBox ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="No completo el campo edad" ForeColor="#CC3300" Display="None"></asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="La edad debe ser mayor a 15 años" ForeColor="#CC3300" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    <br />

    CONTRASEÑA:
    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="No completo el campo contraseña" ForeColor="#CC3300" Display="None"></asp:RequiredFieldValidator>
    <br />

    CONFIRMAR CONTRASEÑA:
    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="No completo el campo verificar contraseña" ForeColor="#CC3300" Display="None"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" Display="None" ErrorMessage="No coinciden" ForeColor="#CC3300"></asp:CompareValidator>
    <br />

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC3300" />
    <br />

    <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
    <br />
</asp:Content>
