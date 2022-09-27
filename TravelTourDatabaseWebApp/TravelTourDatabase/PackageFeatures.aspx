<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PackageFeatures.aspx.cs" Inherits="TravelTourDatabaseWebApp.TravelTourDatabase.PackageFeatures" %>

<%@ Register Src="~/TravelTourDatabase/PackageFeatureUserCtrl.ascx" TagPrefix="uc1" TagName="PackageFeatureUserCtrl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <%--<style>
        .mt {
            margin: auto;
            width: 80%;
            border: 1px #ccc;
            padding: 10px;
        }
    </style>--%>
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
            <div class="row mt justify-content-evenly">
                <div class="col-12">
                    <h2 class="display-6 mt-2">Package Features</h2>
                </div>
                <div class="col=12">
                    <uc1:PackageFeatureUserCtrl runat="server" ID="PackageFeatureUserCtrl" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
