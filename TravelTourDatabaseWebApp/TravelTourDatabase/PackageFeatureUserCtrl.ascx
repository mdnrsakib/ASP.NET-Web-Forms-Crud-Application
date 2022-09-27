<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PackageFeatureUserCtrl.ascx.cs" Inherits="TravelTourDatabaseWebApp.TravelTourDatabase.PackageFeatureUserCtrl" %>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="featureid" DataSourceID="odsfeature" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ValidationGroup="g1" CssClass="btn btn-primary btn-sm mb-1" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="featureidLabel1" runat="server" Text='<%# Eval("featureid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="transportmodeTextBox" runat="server" Text='<%# Bind("transportmode") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="transportmodeTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Transport mode required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="hotelbookingTextBox" runat="server" Text='<%# Bind("hotelbooking") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="hotelbookingTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Hotel booking required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Bind("status") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" DataSourceID="odspackage"
                                CssClass="form-select" ValidationGroup="g1" runat="server"
                                SelectedValue='<%# Bind("packageid") %>' DataValueField="packageid"
                                DataTextField="packagename" AppendDataBoundItems="true">
                            </asp:DropDownList>
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
                            <asp:Button ValidationGroup="g2" CssClass="btn btn-success btn-sm mb-1" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" /><i class="bi bi-plus-circle"></i>
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="Button1" runat="server" CommandName="Cancel" Text="Clear" /><i class="bi bi-x"></i>
                        </td>
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox ValidationGroup="g2" CssClass="form-control" ID="transportmodeTextBox" runat="server" Text='<%# Bind("transportmode") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="transportmodeTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Transport mode required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g2" CssClass="form-control" ID="hotelbookingTextBox" runat="server" Text='<%# Bind("hotelbooking") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="hotelbookingTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Hotel booking required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox CssClass="form-control" ID="CheckBox1" runat="server" Checked='<%# Bind("status") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="packageidTextBox" DataSourceID="odspackage"
                                CssClass="form-select" ValidationGroup="g2" runat="server"
                                SelectedValue='<%# Bind("packageid") %>' DataValueField="packageid"
                                DataTextField="packagename" AppendDataBoundItems="true">
                                <asp:ListItem Value="" Text="Select one" Selected="True" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="packageidTextBox" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Package name Required"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="width: 120px;">
                            <asp:Button CssClass="btn btn-danger btn-sm mb-1" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-success btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="featureidLabel" runat="server" Text='<%# Eval("featureid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="transportmodeLabel" runat="server" Text='<%# Eval("transportmode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="hotelbookingLabel" runat="server" Text='<%# Eval("hotelbooking") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("status") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="packageidLabel" runat="server" Text='<%# Eval("packageid") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="table-responsive">
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table class="table table-bordered table-striped center" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <thead>
                                            <tr runat="server" style="">
                                                <th runat="server"></th>
                                                <th runat="server">Feature Id</th>
                                                <th runat="server">Transport Mode</th>
                                                <th runat="server">Hotel Booking</th>
                                                <th runat="server">Status</th>
                                                <th runat="server">Package Name</th>
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
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="Button2" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="Button3" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("featureid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("transportmode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("hotelbooking") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("status") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("packageid") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
<asp:ObjectDataSource ID="odsfeature" runat="server" DataObjectTypeName="TravelTourDatabaseWebApp.BLL.PackageFetauresDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="TravelTourDatabaseWebApp.BLL.PackageFetauresManager" UpdateMethod="Update"></asp:ObjectDataSource>

    <br />
    <asp:ObjectDataSource ID="odspackage" runat="server" SelectMethod="tourpackagesDropItems" TypeName="TravelTourDatabaseWebApp.BLL.PackageFetauresManager"></asp:ObjectDataSource>
