<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invioce_Data.aspx.cs" Inherits="test_project.Invioce_Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
             <asp:HiddenField ID="Customer" runat="server"/>
        
        <table>
            <tr>
                <td>
                    <asp:Label Text="Customer_Name" runat="server" />
                </td>
            
                <td colspan="5">
                    <asp:DropDownList ID="custimer_Name" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Invioce_Date" runat="server" />
                </td>
                <td>
                    <asp:Calendar ID="DateInvioce" runat="server"/>
                </td>

            </tr>


            <tr>
                <td>
                    <asp:Label text="Value"  runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtvalue" runat="server"/>
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
            <tr>
                <td>
                    <asp:Button ID="btnSave"   Text="Save" runat="server" OnClick="btnSave_Click"/>
                    
                    
                    <asp:Button ID="btnClear" Text="clear" runat="server" OnClick="btnClear_Click" style="height: 26px" />


                </td>
            
            </tr>
                

        </table>
        <br /. />
                    <asp:GridView ID="dbGrid" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="InvoiceId_DateTime" HeaderText="InvoiceId_DateTime" />
                            <asp:BoundField DataField="Value" HeaderText="Value" />
                            
                             </Columns>
                    </asp:GridView>
       
    

    </div>
    </form>
</body>
</html>
