<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tourists.aspx.cs" Inherits="TravelTourDatabaseWebApp.TravelTourDatabase.Tourists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
    <script src="/Scripts/jquery-3.6.0.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
            <div class="row">
        <div class="col-12 ">
            <h2 class="display-6 mt-2" style="text-align:center">Tourists</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="touristid" DataSourceID="dsTourists" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating" OnItemDataBound="ListView1_ItemDataBound">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ValidationGroup="g1" CssClass="btn btn-primary btn-sm mb-1" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="touristidLabel1" runat="server" Text='<%# Eval("touristid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="touristnameTextBox" runat="server" Text='<%# Bind("touristname") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="touristnameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tourist Name Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g1" CssClass="form-control date" ID="bookingdateTextBox" runat="server" Text='<%# Bind("bookingdate","{0:yyyy-MM-dd}") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="bookingdateTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Date of Birth Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g1" CssClass="form-control" ID="touristoccupationTextBox" runat="server" Text='<%# Bind("touristoccupation") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="touristoccupationTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Tourist Occupation is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <img src='<%# Eval("touristpicture", "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                            <asp:FileUpload ValidationGroup="g1" ID="img" runat="server" />
                            <asp:HiddenField  ID="touristpictureTextBox" runat="server" Value='<%# Bind("touristpicture") %>' /> 
                        </td>
                        <%--<td>
                            <asp:TextBox ID="touristpictureTextBox" runat="server" Text='<%# Bind("touristpicture") %>' />
                        </td>--%>
                        <td>
                            <asp:DropDownList ID="packageidTextBox" DataSourceID="SqlDataSource1"
                                CssClass="form-select" ValidationGroup="g1" runat="server"
                                SelectedValue='<%# Bind("packageid") %>' DataValueField="packageid"
                                DataTextField="packagename" AppendDataBoundItems="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g1" ControlToValidate="packageidTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="TspId Required"></asp:RequiredFieldValidator>
                        </td>
                        <%--<td>
                            <asp:TextBox ID="packageidTextBox" runat="server" Text='<%# Bind("packageid") %>' />
                        </td>--%>
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
                            <asp:Button ValidationGroup="g2" CssClass="btn btn-success btn-sm mb-1" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="g2" ID="touristnameTextBox" runat="server" Text='<%# Bind("touristname") %>'/>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="touristnameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tourist Name Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="g2" CssClass="form-control date" ID="bookingdateTextBox" runat="server" Text='<%# Bind("bookingdate","{0:yyyy-MM-dd}") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="bookingdateTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Booking date Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="touristoccupationTextBox" runat="server" Text='<%# Bind("touristoccupation") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="touristoccupationTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Tourist Occupation is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:FileUpload ValidationGroup="g2" ID="img" runat="server" />
                            <asp:HiddenField ID="touristpictureTextBox" runat="server" Value='<%# Bind("touristpicture") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="img" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Picture is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="packageidTextBox" DataSourceID="SqlDataSource1"
                                CssClass="form-select" ValidationGroup="g2" runat="server"
                                SelectedValue='<%# Bind("packageid") %>' DataValueField="packageid"
                                DataTextField="packagename" AppendDataBoundItems="true">
                                <asp:ListItem Value="" Text="Select one" Selected="True" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="g2" ControlToValidate="packageidTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Package Name Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-danger btn-sm mb-1" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-success btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="touristidLabel" runat="server" Text='<%# Eval("touristid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="touristnameLabel" runat="server" Text='<%# Eval("touristname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="bookingdateLabel" runat="server" Text='<%# Eval("bookingdate","{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="touristoccupationLabel" runat="server" Text='<%# Eval("touristoccupation") %>' />
                        </td>
                        <td>
                            <img src='<%# Eval("touristpicture", "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
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
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <thead>
                                        <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">Tourist Id</th>
                                        <th runat="server">Tourist Name</th>
                                        <th runat="server">Booking Date</th>
                                        <th runat="server">Tourist Occupation</th>
                                        <th runat="server">Tourist Picture</th>
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
            </asp:ListView>
            <asp:SqlDataSource ID="dsTourists" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [tourists] WHERE [touristid] = @touristid" InsertCommand="INSERT INTO [tourists] ([touristname], [bookingdate], [touristoccupation], [touristpicture], [packageid]) VALUES (@touristname, @bookingdate, @touristoccupation, @touristpicture, @packageid)" SelectCommand="SELECT * FROM [tourists]" UpdateCommand="UPDATE [tourists] SET [touristname] = @touristname, [bookingdate] = @bookingdate, [touristoccupation] = @touristoccupation, [touristpicture] = @touristpicture, [packageid] = @packageid WHERE [touristid] = @touristid">
                <DeleteParameters>
                    <asp:Parameter Name="touristid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="touristname" Type="String" />
                    <asp:Parameter DbType="Date" Name="bookingdate" />
                    <asp:Parameter Name="touristoccupation" Type="String" />
                    <asp:Parameter Name="touristpicture" Type="String" />
                    <asp:Parameter Name="packageid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="touristname" Type="String" />
                    <asp:Parameter DbType="Date" Name="bookingdate" />
                    <asp:Parameter Name="touristoccupation" Type="String" />
                    <asp:Parameter Name="touristpicture" Type="String" />
                    <asp:Parameter Name="packageid" Type="Int32" />
                    <asp:Parameter Name="touristid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [tourpackages]"></asp:SqlDataSource>
        </div>
    </div>
   </asp:Content> 
<asp:Content ContentPlaceHolderID="footer" runat="server">
    
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $(".date").datepicker({
                format: "yyyy-mm-dd"
            });
        })
    </script>
</asp:Content>
