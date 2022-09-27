<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgentTourPackages.aspx.cs" Inherits="TravelTourDatabaseWebApp.TravelTourDatabase.AgentTourPackages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">  
        <div class="col-6">
            <h2 class="px-2 display-6">Select Package</h2>
            <asp:GridView ID="gvagentspackage" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" DataSourceID="dsPackages" OnRowDataBound="gvagentspackage_RowDataBound" DataKeyNames="packageid">
                <SelectedRowStyle CssClass="bg-secondary text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-sm" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="packagename" HeaderText="Package Name" SortExpression="packagename" />
                    <asp:BoundField DataField="touristname" HeaderText="Tourist Name" SortExpression="touristname" />
                    <asp:BoundField DataField="bookingdate" HeaderText="Booking Date" SortExpression="bookingdate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="transportmode" HeaderText="Transport Mode" SortExpression="transportmode" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsPackages" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT tourpackages.packageid, tourists.bookingdate, tourists.touristname, packagefeatures.transportmode, tourpackages.packagename FROM tourpackages INNER JOIN packagefeatures ON tourpackages.packageid = packagefeatures.packageid INNER JOIN tourists ON tourpackages.packageid = tourists.packageid"></asp:SqlDataSource>
        </div>
        <div class="col-6">
            <h2 class="px-2 display-6">Add Agent</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="agentid,packageid" DataSourceID="dsAgentPackages" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemDataBound="ListView1_ItemDataBound">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="agentidLabel1" runat="server" Text='<%# Eval("agentid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="packageidLabel1" runat="server" Text='<%# Eval("packageid") %>' />
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
                            <asp:TextBox ID="agentidTextBox" runat="server" Text='<%# Bind("agentid") %>' />
                        </td>
                        <td>
                            <asp:HiddenField ID="packageidTextBox" runat="server" Value='<%# Bind("packageid") %>' />
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="agentidLabel" runat="server" Text='<%# Eval("agentid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="packageidLabel" runat="server" Text='<%# Eval("packageid") %>' />
                        </td>
                        <td>
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <thead>
                                        <tr runat="server" style="">
                                        <th runat="server">Agent Id</th>
                                        <th runat="server">Package Name</th>
                                        <th runat="server"></th>                         
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
                </LayoutTemplate> 
            </asp:ListView>
            <asp:SqlDataSource ID="dsAgentPackages" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [agenttourpackages] WHERE [agentid] = @agentid AND [packageid] = @packageid" InsertCommand="INSERT INTO [agenttourpackages] ([agentid], [packageid]) VALUES (@agentid, @packageid)" SelectCommand="SELECT * FROM [agenttourpackages] WHERE ([packageid] = @packageid)">
                <DeleteParameters>
                    <asp:Parameter Name="agentid" Type="Int32" />
                    <asp:Parameter Name="packageid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="agentid" Type="Int32" />
                    <asp:Parameter Name="packageid" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvagentspackage" Name="packageid" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
      </div>
</asp:Content>

