<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TravelTourDatabaseWebApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .container {
            display: block;
            width: 97.5vw;
            margin: 0 auto;
        }

        .banner {
            width: 80vw;
            margin: 15px auto;
            padding: 15px 30px;
            border-radius: 3px;
            background-color: #e3f2fd;
            color: #000000;
            display: flex;
            gap: .5em;
            flex-direction: column;
            justify-content: flex-start;
            align-items: stretch;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <section class="container">
        <div class="banner">
            <h3>Realational DataBase Create Update Delete ASP.NET Web Forms Application</h3>
            <h5>Using ASP.NET WEb Froms</h5>
            <h6>Features</h6>
            <ul class="col-4">
                <li>Security</li>
                <li>Parent Tables</li>
                <li>Realtional Tables</li>
                <li>Realtional Tables With Dropdown Control</li>
                <li>Login/Register With ASP.NET Identity feature</li>
                <li>Multiple Crystal Reports</li>
                <li>User Control</li>
            </ul>
            <h5>Take a tour by register yourself 
                <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" PostBackUrl="register.aspx" CausesValidation="false" Text="Register here"></asp:LinkButton>
            </h5>
            <hr />
            <h6 class="ms-auto">Name: Md Nur Rahman Sakib<br />Id: 1268589</h6>
        </div>
    </section>
</asp:Content>
