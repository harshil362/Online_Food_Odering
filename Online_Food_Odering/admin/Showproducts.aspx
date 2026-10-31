<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showproducts.aspx.cs" Inherits="Online_Food_Odering.Showproducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Foods</title>
</head>

<body>

    <form id="form1" runat="server">

        <div>

            <h1>All Foods</h1>

            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

            <center>

                <asp:DataList ID="DataList1" runat="server"
                    CellSpacing="40"
                    RepeatDirection="Horizontal"
                    OnItemCommand="DataList1_ItemCommand"
                    Width="924px">

                    <ItemTemplate>

                        <asp:Image ID="Image1" runat="server"
                            ImageUrl='<%# Eval("Food_Image") %>'
                            Height="100px"
                            Width="100px" />

                        <br />

                        <strong>Food Name :</strong>

                        <asp:Label ID="Label2" runat="server"
                            Text='<%# Eval("Food_Name") %>'>
                        </asp:Label>

                        <br />

                        <strong>Price :</strong>

                        <asp:Label ID="Label3" runat="server"
                            Text='<%# Eval("Food_Discount_Price") %>'>
                        </asp:Label>

                        <br />

                        <strong>Description :</strong>

                        <asp:Label ID="Label4" runat="server"
                            Text='<%# Eval("Food_Description") %>'>
                        </asp:Label>

                        <br />
                        <br />

                        <asp:LinkButton ID="LinkButton1" runat="server"
                            CommandName="cmd_vdlt"
                            CommandArgument='<%# Eval("Food_Id") %>'>
                            View Details
                        </asp:LinkButton>

                        <br />

                        <asp:LinkButton ID="LinkButton2" runat="server"
                            CommandName="cmd_cart"
                            CommandArgument='<%# Eval("Food_Id") %>'>
                            Add to Cart
                        </asp:LinkButton>

                    </ItemTemplate>

                </asp:DataList>

            </center>

        </div>

    </form>

</body>
</html>