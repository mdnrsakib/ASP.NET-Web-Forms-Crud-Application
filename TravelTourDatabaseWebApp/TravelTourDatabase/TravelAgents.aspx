<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TravelAgents.aspx.cs" Inherits="TravelTourDatabaseWebApp.TravelTourDatabase.TravelAgents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="col-12 m-2">
         <div class="alert alert-warning alert-dismissible" role="alert" runat="server" visible="false" id="error">
                  <strong>Error!</strong> This data has related child, delete them first.
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
         </div>
    </div>
    <div class="row px-4">
        <div class="col-12 px-2 bg-info shadow-sm mb-4">
            <h1 class="display-6 d-flex justify-content-center text-light mb-2">Agents</h1>
        </div>
        <div class="col-6">
            <h4 class="display-8">Edit/Delete</h4>
            <asp:GridView CssClass="table table-bordered table-striped" ID="gvAgents" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="agentid" DataSourceID="dsAgents" OnRowDataBound="gvAgents_RowDataBound" OnRowDeleting="gvAgents_RowDeleting" OnRowUpdating="gvAgents_RowUpdating">
                <HeaderStyle CssClass="table-light" />
                <Columns>
                    <asp:TemplateField HeaderText="Agent Name" SortExpression="agentname">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv1" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("agentname") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv1" ControlToValidate="TextBox1" Text="Agent name is required" CssClass="text-danger err" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("agentname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv1" CssClass="form-control form-control-sm" ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv1" ControlToValidate="TextBox2" Text="Email is required" CssClass="text-danger err" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Agent Address">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv1" CssClass="form-control form-control-sm" ID="TextBox3" runat="server" Text='<%# Bind("agentaddress") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="gv1" ControlToValidate="TextBox3" Text="Agent address is required" CssClass="text-danger err" ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("agentaddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton CssClass="btn btn-success btn-sm rounded-circle mb-1"  ValidationGroup="gv1" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-success btn-sm rounded-circle" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm rounded-circle mb-1" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm rounded-circle" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsAgents" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [travelagents]" DeleteCommand="DELETE FROM [travelagents] WHERE [agentid] = @agentid" InsertCommand="INSERT INTO [travelagents] ([agentname], [email], [agentaddress]) VALUES (@agentname, @email, @agentaddress)" UpdateCommand="UPDATE [travelagents] SET [agentname] = @agentname, [email] = @email, [agentaddress] = @agentaddress WHERE [agentid] = @agentid">
                <DeleteParameters>
                    <asp:Parameter Name="agentid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="agentname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="agentaddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="agentname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="agentaddress" Type="String" />
                    <asp:Parameter Name="agentid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-6">
            <h4 class="display-8">Add New</h4>
            <asp:FormView Width="100%" ID="fvAgents" DefaultMode="Insert" runat="server" DataKeyNames="agentid" DataSourceID="dsAgents">
                <EditItemTemplate>
                    agentid:
                    <asp:Label ID="agentidLabel1" runat="server" Text='<%# Eval("agentid") %>' />
                    <br />
                    agentname:
                    <asp:TextBox ID="agentnameTextBox" runat="server" Text='<%# Bind("agentname") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    agentaddress:
                    <asp:TextBox ID="agentaddressTextBox" runat="server" Text='<%# Bind("agentaddress") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-3">Agent Name</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="fv1" CssClass="form-control form-control-sm" ID="agentnameTextBox" runat="server" Text='<%# Bind("agentname") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv1" CssClass="text-danger err" ID="RequiredFieldValidator3" ControlToValidate="agentnameTextBox"  runat="server" ErrorMessage="Agent name is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                   <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-3">Email</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="fv1" CssClass="form-control form-control-sm" ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv1" CssClass="text-danger err" ID="RequiredFieldValidator2" ControlToValidate="emailTextBox"  runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="regEmail"
                                CssClass="text-danger err"
                                ValidationGroup="fv1"
                                ControlToValidate="emailTextBox"
                                Text="Enter valid email id"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-3">Agent Address</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="fv1" CssClass="form-control form-control-sm" ID="TextBox4" runat="server" Text='<%# Bind("agentaddress") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv1" CssClass="text-danger err" ID="RequiredFieldValidator4" ControlToValidate="agentnameTextBox"  runat="server" ErrorMessage="Agent name is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-12">
                       <div class="d-flex justify-content-end">
                            <asp:LinkButton ValidationGroup="fv1" CssClass="btn btn-success btn-sm" ID="LinkButton3" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-circle"></i> Insert</asp:LinkButton>
                        &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="bi bi-x"></i> Cancel</asp:LinkButton>
                       </div>
                    </div>
                   <%-- <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />--%>
                </InsertItemTemplate> 
            </asp:FormView>
        </div>
    </div>
</asp:Content>
