<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TourPackages.aspx.cs" Inherits="TravelTourDatabaseWebApp.TravelTourDatabase.TourPackages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
            <div class="col-12 m-2">
                <div class="alert alert-warning alert-dismissible" role="alert" runat="server" visible="false" id="error">
                    <strong>Error!</strong> This data has related child, delete them first.
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
            <div class="row">
                <div class="col-12 m-0">
                    <h2 class="display-6 d-flex justify-content-center">TourPackages</h2>
                    <asp:ListView class="w-100 d-flex justify-content-center" ID="ListView1" runat="server" DataKeyNames="packageid" DataSourceID="odspackage" InsertItemPosition="LastItem" OnItemDeleting="ListView1_ItemDeleting">

                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ValidationGroup="g1" ID="UpdateButton" CssClass="btn btn-success btn-sm mb-1" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" CssClass="btn btn-secondary btn-sm" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="packageidLabel1" runat="server" Text='<%# Eval("packageid") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="packagecategoryTextBox" runat="server" Text='<%# Bind("packagecategory") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="packagecategoryTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Package category is required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="packagenameTextBox" runat="server" Text='<%# Bind("packagename") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="packagenameTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Package name is required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="costperpersonTextBox" runat="server" Text='<%# Bind("costperperson") %>' />

                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="tourtimeTextBox" runat="server" Text='<%# Bind("tourtime") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="tourtimeTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Package name is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ValidationGroup="g2" CssClass="btn btn-primary btn-sm mb-1" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>[Auto]</td>
                                <td>
                                    <asp:TextBox ValidationGroup="g2" CssClass="form-control" ID="packagecategoryTextBox" runat="server" Text='<%# Bind("packagecategory") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="packagecategoryTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Package category is required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g2" CssClass="form-control" ID="packagenameTextBox" runat="server" Text='<%# Bind("packagename") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="packagenameTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Package name is required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g2" CssClass="form-control" ID="costperpersonTextBox" runat="server" Text='<%# Bind("costperperson") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="costperpersonTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Cost per person category is required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ValidationGroup="g2" ControlToValidate="costperpersonTextBox" Operator="DataTypeCheck" Type="Currency" ID="CompareValidator1" runat="server" ErrorMessage="Cost is required in currency"></asp:CompareValidator>
                                </td>
                                <td>
                                    <asp:TextBox ValidationGroup="g2" CssClass="form-control" ID="tourtimeTextBox" runat="server" Text='<%# Bind("tourtime") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="tourtimeTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Package name is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="DeleteButton" CssClass="btn btn-danger btn-sm mb-1" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" CssClass="btn btn-primary btn-sm" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="packageidLabel" runat="server" Text='<%# Eval("packageid") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="packagecategoryLabel" runat="server" Text='<%# Eval("packagecategory") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="packagenameLabel" runat="server" Text='<%# Eval("packagename") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costperpersonLabel" runat="server" Text='<%# Eval("costperperson","{0:0.00}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tourtimeLabel" runat="server" Text='<%# Eval("tourtime") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="table-responsive">
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                <thead>
                                                    <tr runat="server" style="">
                                                        <th runat="server"></th>
                                                        <th runat="server">Packageid</th>
                                                        <th runat="server">Package Category</th>
                                                        <th runat="server">Package Name</th>
                                                        <th runat="server">Cost per Person</th>
                                                        <th runat="server">Tour Duration(Days)</th>
                                                    </tr>
                                                </thead>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </LayoutTemplate>

                    </asp:ListView>
                </div>
            </div>
            <asp:ObjectDataSource ID="odspackage" runat="server" DataObjectTypeName="TravelTourDatabaseWebApp.BLL.TourpackagesDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="TravelTourDatabaseWebApp.BLL.TourPackagesRepo" UpdateMethod="Update"></asp:ObjectDataSource>
</asp:Content>
