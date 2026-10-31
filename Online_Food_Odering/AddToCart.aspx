<%@ Page Title="My Cart | FoodieHub" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="Online_Food_Odering.AddToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="css/style.css" />

    <style>
        .cart-section {
            padding: 40px 0 60px 0;
        }

        .cart-card {
            background: #ffffff;
            border-radius: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
            border: 1px solid rgba(0, 0, 0, 0.05);
            padding: 2rem;
        }

        .cart-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 0;
        }

        .cart-table thead th {
            background: #ff5a1f;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1rem 1.25rem;
            border: none;
            vertical-align: middle;
            white-space: nowrap;
        }

        .cart-table thead th:first-child {
            border-top-left-radius: 1rem;
            border-bottom-left-radius: 1rem;
        }

        .cart-table thead th:last-child {
            border-top-right-radius: 1rem;
            border-bottom-right-radius: 1rem;
        }

        .cart-table tbody tr {
            transition: background-color 0.15s ease;
        }

        .cart-table tbody tr:hover {
            background-color: #fff9f6;
        }

        .cart-table tbody td {
            padding: 1.15rem 1.25rem;
            vertical-align: middle;
            border-bottom: 1px solid #f2f2f2;
        }

        .cart-table tbody tr:last-child td {
            border-bottom: none;
        }

        .cart-item-img {
            width: 75px;
            height: 75px;
            object-fit: cover;
            border-radius: 0.85rem;
            border: 1px solid rgba(0, 0, 0, 0.08);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .cart-price-pill {
            color: #ff5a1f;
            font-weight: 700;
            font-size: 1rem;
        }

        .cart-total-pill {
            color: #2d2d2d;
            font-weight: 700;
            font-size: 1.05rem;
        }

        .cart-qty-badge {
            display: inline-block;
            background: #f8f9fa;
            color: #2d2d2d;
            border: 1px solid #e2e8f0;
            border-radius: 999px;
            padding: 0.35rem 0.9rem;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .cart-table .btn-outline-orange {
            border: 1px solid #ff5a1f;
            color: #ff5a1f;
            border-radius: 999px;
            padding: 0.35rem 0.85rem;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-block;
        }

        .cart-table .btn-outline-orange:hover {
            background: #ff5a1f;
            color: #ffffff;
        }

        .cart-table .btn-outline-danger {
            border-radius: 999px;
            padding: 0.35rem 0.85rem;
            font-size: 0.85rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
        }

        .cart-summary-box {
            background: linear-gradient(135deg, #fff9f6 0%, #fff0e6 100%);
            border: 1px solid rgba(255, 90, 31, 0.2);
            border-radius: 1.25rem;
            padding: 1.25rem 1.75rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="container cart-section">
        <!-- Page Header -->
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-4">
            <div>
                <h1 class="section-title mb-1">My Cart</h1>
                <p class="section-subtitle mb-0">Review your food items, update quantities, or proceed to checkout.</p>
            </div>
            <a href="menu.aspx" class="btn btn-outline-orange">
                <i class="fa-solid fa-arrow-left me-2"></i>Continue Shopping
            </a>
        </div>

        <!-- Cart Card Container -->
        <div class="cart-card">
            <div class="table-responsive">
                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="Food_Id"
                    GridLines="None"
                    CssClass="table table-hover align-middle cart-table"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit">

                    <EmptyDataTemplate>
                        <div class="text-center py-5">
                            <i class="fa-solid fa-cart-shopping fa-3x text-muted mb-3 opacity-50"></i>
                            <h4 class="fw-bold mb-2">Your cart is empty</h4>
                            <p class="text-muted mb-4">Looks like you haven't added any delicious food yet.</p>
                            <a href="menu.aspx" class="btn btn-orange">
                                <i class="fa-solid fa-utensils me-2"></i>Explore Menu
                            </a>
                        </div>
                    </EmptyDataTemplate>

                    <Columns>
                      
                        <asp:TemplateField HeaderText="Food Image" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Image
                                    ID="Image1"
                                    runat="server"
                                    ImageUrl='<%# Eval("Food_Image") %>'
                                    AlternateText='<%# Eval("Food_Name") %>'
                                    CssClass="cart-item-img" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Food Name">
                            <ItemTemplate>
                                <h6 class="fw-bold mb-0 text-dark">
                                    <asp:Label
                                        ID="Label2"
                                        runat="server"
                                        Text='<%# Eval("Food_Name") %>'>
                                    </asp:Label>
                                </h6>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Food Price">
                            <ItemTemplate>
                                <span class="cart-price-pill">
                                    ₹<asp:Label
                                        ID="Label3"
                                        runat="server"
                                        Text='<%# Eval("Food_Discount_Price") %>'>
                                    </asp:Label>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <span class="cart-qty-badge">
                                    <asp:Label
                                        ID="Label4"
                                        runat="server"
                                        Text='<%# Eval("Quantity") %>'>
                                    </asp:Label>
                                </span>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList
                                    ID="DropDownList1"
                                    runat="server"
                                    CssClass="form-select form-select-sm w-auto mx-auto d-inline-block">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <span class="cart-total-pill">
                                    ₹<asp:Label
                                        ID="LabelTotal"
                                        runat="server"
                                        Text='<%# Convert.ToDecimal(Eval("Food_Discount_Price")) * Convert.ToInt32(Eval("Quantity")) %>'>
                                    </asp:Label>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField
                            HeaderText="Update Quantity"
                            ShowEditButton="True"
                            ButtonType="Link"
                            EditText="Edit"
                            UpdateText="Update"
                            CancelText="Cancel"
                            HeaderStyle-CssClass="text-center"
                            ItemStyle-CssClass="text-center"
                            ControlStyle-CssClass="btn btn-sm btn-outline-orange" />

                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:LinkButton
                                    ID="LinkButton1"
                                    runat="server"
                                    CssClass="btn btn-sm btn-outline-danger">
                                    <i class="fa-solid fa-trash-can me-1"></i>Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="row align-items-center justify-content-between mt-4 pt-3 border-top gy-3">
                <div class="col-md-6">
                    <a href="menu.aspx" class="btn btn-outline-orange">
                        <i class="fa-solid fa-utensils me-2"></i>Order More Items
                    </a>
                </div>
                <div class="col-md-6 col-lg-5 text-md-end text-center">
                    <div class="cart-summary-box d-inline-block text-md-end text-center">
                        <asp:Label
                            ID="grand_total"
                            runat="server"
                            CssClass="fs-4 fw-bold text-orange d-block">
                        </asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>