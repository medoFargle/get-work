<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer_data.aspx.cs" Inherits="test_project.customer_data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField ID="Customer" runat="server"/>
        <table>
            <tr>
                <td>
                    <asp:Label Text="Customer_Name" runat="server"/>

                    
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TxtCustomer_Name" runat="server" />

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label  Text="Customer_Phone" runat="server"/>

                    
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TxtCustomer_Phone" runat="server" />


                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label   Text="Customer_Address" runat="server"/>

                    
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TxtCustomer_Address" runat="server" />


                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label   Text="Customer_Email" runat="server"/>

                    
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TxtCustomer_Email" runat="server" />


                </td>
            </tr>


            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave"   Text="Save" runat="server" OnClick="btnSave_Click" style="height: 26px"/>
                    <asp:Button ID="BtnEdit"   Text="Edit" runat="server" OnClick="BtnEdit_Click" />

                    
                    <asp:Button ID="btnClear" Text="clear" runat="server" OnClick="btnClear_Click" />


                </td>
            </tr>
            <tr>
                <td></td>
                    <td>
                    <asp:Label ID ="lblMessge" Text="" runat="server" ForeColor="Green" />
                </td>

            </tr>
            <tr>
                <td></td>
                    <td>
                    <asp:Label ID ="lblErrormessage" Text="" runat="server" ForeColor="Green" />
                </td>

            </tr>
            

        </table>
        <br /. />
                    <asp:GridView ID="dbGrid" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="InvoiceId_DateTime" HeaderText="InvoiceId_DateTime" />
                            <asp:BoundField DataField="Value" HeaderText="Value" />
                            <asp:BoundField DataField="Customer_Address" HeaderText="Customer_Address" />
                            <asp:BoundField DataField="Customer_Email" HeaderText="Customer_Email" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton Text="Select" ID="lnkSelect" CommandArgument='<%Eval("Customer_ID") %>' runat="server" />  
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                             </Columns>
                    </asp:GridView>
       
    
    </div>
    </form>
</body>
</html>
