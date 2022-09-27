<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TravelTourDatabaseWebApp.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:UpdateProgress class="w-100" ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <button class="btn btn-info m-2" type="button" disabled>
                <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                Loading...
            </button>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
        <div class="col-12">
            <h1 class=" col-3 offset-3 mt-2 mb-1">Register</h1>
            <hr />
            <div class="alert alert-warning alert-dismissible fade show" role="alert" id="alert" runat="server" visible="false">
                <strong runat="server" id="msg"></strong>.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
            <div class="form-group row mb-1">
                <label class="col-form-label col-4 text-end">Username</label>
                <div class="col-4">
                    <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="username" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row mb-1">
                <label class="col-form-label col-4 text-end">Password</label>
                <div class="col-4">
                    <asp:TextBox TextMode="Password" ID="password" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="password" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group row mb-1">
                <label class="col-form-label col-4 text-end">Confirm Password</label>
                <div class="col-4">
                    <asp:TextBox TextMode="Password" ID="confirmpassword" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="confirmpassword" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password required"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="confirmpassword" ControlToCompare="password" Type="String" Operator="Equal" runat="server" ErrorMessage="Two password don't match" CssClass="text-danger"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group row mb-1">

                <div class="col-4 offset-7">
                    <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                </div>
            </div>

        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
