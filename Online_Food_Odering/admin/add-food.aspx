<%@ Page Title="Add Food | FoodieHub Admin"
    Language="C#"
    MasterPageFile="~/admin/Admin_Site2.Master"
    AutoEventWireup="true"
    CodeBehind="add-food.aspx.cs"
    Inherits="Online_Food_Odering.admin.add_food" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!DOCTYPE html>

    <html lang="en">

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">

        <title>Add Food | FoodieHub Admin</title>

        <link rel="icon"
              type="image/png"
              href="../images/favicon.png" />

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <link rel="stylesheet"
              href="css/admin.css">

        <link rel="stylesheet"
              href="css/responsive.css">

    </head>

    <body class="admin-body">


        <!-- =====================================================
             SIDEBAR OVERLAY
        ====================================================== -->

        <div class="sidebar-overlay"
             onclick="toggleSidebar()">
        </div>


        <!-- =====================================================
             SIDEBAR START
        ====================================================== -->

        <aside class="admin-sidebar">

            <div class="sidebar-brand">

                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80"
                     alt="FoodieHub">

                <span>FoodieHub</span>

            </div>


            <nav class="sidebar-nav">


                <!-- MAIN -->

                <div class="nav-label">
                    Main
                </div>


                <a href="dashboard.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-gauge-high"></i>
                    Dashboard

                </a>


                <!-- MANAGEMENT -->

                <div class="nav-label">
                    Management
                </div>


                <a href="orders.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-bag-shopping"></i>
                    Orders

                </a>


                <!-- ACTIVE MENU -->

                <a href="menu.aspx"
                   class="nav-item active">

                    <i class="fa-solid fa-utensils"></i>
                    Menu

                </a>


                <a href="categories.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-layer-group"></i>
                    Categories

                </a>


                <!-- USERS -->

                <div class="nav-label">
                    Users
                </div>


                <a href="customers.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-users"></i>
                    Customers

                </a>


                <!-- BUSINESS -->

                <div class="nav-label">
                    Business
                </div>


                <a href="coupons.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-ticket"></i>
                    Coupons

                </a>


                <a href="payments.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-credit-card"></i>
                    Payments

                </a>


                <a href="delivery.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-truck"></i>
                    Delivery

                </a>


                <!-- INSIGHTS -->

                <div class="nav-label">
                    Insights
                </div>


                <a href="reviews.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-star"></i>
                    Reviews

                </a>


                <a href="reports.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-chart-line"></i>
                    Reports

                </a>


                <!-- SYSTEM -->

                <div class="nav-label">
                    System
                </div>


                <a href="settings.aspx"
                   class="nav-item">

                    <i class="fa-solid fa-gear"></i>
                    Settings

                </a>


            </nav>


            <!-- LOGOUT -->

            <div class="sidebar-footer">

                <a href="#"
                   onclick="adminLogout()"
                   class="nav-item">

                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout

                </a>

            </div>

        </aside>


        <!-- =====================================================
             SIDEBAR END
        ====================================================== -->


        <!-- =====================================================
             TOPBAR START
        ====================================================== -->

        <header class="admin-topbar">


            <div class="topbar-left">


                <button
                    type="button"
                    class="menu-toggle"
                    onclick="toggleSidebar()">

                    <i class="fa-solid fa-bars"></i>

                </button>


                <div class="topbar-search">

                    <i class="fa-solid fa-search"></i>

                    <input type="text"
                           placeholder="Search anything...">

                </div>


            </div>


            <div class="topbar-right">


                <!-- NOTIFICATION -->

                <div class="topbar-icon">

                    <i class="fa-solid fa-bell"></i>

                    <span class="topbar-badge">
                        3
                    </span>

                </div>


                <!-- PROFILE -->

                <div style="position: relative">


                    <div class="admin-profile"
                         onclick="toggleProfileDropdown()">


                        <img src="https://i.pravatar.cc/40?img=68"
                             alt="Admin">


                        <span>
                            Admin
                        </span>


                        <i class="fa-solid fa-chevron-down"
                           style="font-size: .65rem; color: #6c757d">
                        </i>


                    </div>


                    <!-- PROFILE DROPDOWN -->

                    <div class="profile-dropdown">


                        <a href="settings.aspx">

                            <i class="fa-solid fa-user"></i>
                            My Profile

                        </a>


                        <a href="settings.aspx">

                            <i class="fa-solid fa-gear"></i>
                            Settings

                        </a>


                        <div class="divider">
                        </div>


                        <button
                            type="button"
                            onclick="adminLogout()"
                            class="text-danger">

                            <i class="fa-solid fa-right-from-bracket"></i>
                            Logout

                        </button>


                    </div>


                </div>


            </div>


        </header>


        <!-- =====================================================
             TOPBAR END
        ====================================================== -->


</asp:Content>



<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <main class="admin-main">


        <div class="admin-content">



            <div class="page-header">


                <div>

                    <h1>
                        Add Food Item
                    </h1>


                    <div class="breadcrumb-nav">

                        <a href="dashboard.aspx">
                            Dashboard
                        </a>

                        /

                        <a href="menu.aspx">
                            Menu
                        </a>

                        /

                        Add Food

                    </div>

                </div>


            </div>





            <div class="admin-form">


                <div style="display:grid;grid-template-columns:2fr 1fr;gap:1.25rem">




                    <div style="display:flex;flex-direction:column;gap:1.25rem">


               
                        <div class="admin-card">


                            <div class="card-header-admin">

                                <h3>

                                    <i class="fa-solid fa-info-circle"
                                       style="color:#0d6efd;margin-right:.4rem">
                                    </i>

                                    Basic Information

                                </h3>

                            </div>


                            <div class="card-body-admin">


                                <!-- FOOD NAME -->

                                <div style="margin-bottom:1rem">

                                    <label class="form-label">
                                        Food Name *
                                    </label>


                                    <asp:TextBox
                                        ID="txtFoodName"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="e.g. Pepperoni Pizza">
                                    </asp:TextBox>


                                </div>


                                <!-- CATEGORY + FOOD TYPE -->

                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-bottom:1rem">


                                    <!-- CATEGORY -->

                                    <div>

                                        <label class="form-label">
                                            Category *
                                        </label>


                                        <asp:DropDownList
                                            ID="ddlCategory"
                                            runat="server"
                                            CssClass="form-select">


                                            <asp:ListItem
                                                Text="Select category"
                                                Value="">
                                            </asp:ListItem>


                                          

                                        </asp:DropDownList>

                                    </div>


                                    <!-- FOOD TYPE -->

                                    <div>

                                        <label class="form-label">
                                            Food Type *
                                        </label>


                                        <asp:DropDownList
                                            ID="ddlFoodType"
                                            runat="server"
                                            CssClass="form-select">


                                            <asp:ListItem
                                                Text="Select type"
                                                Value="">
                                            </asp:ListItem>


                                            <asp:ListItem
                                                Text="Veg"
                                                Value="Veg">
                                            </asp:ListItem>


                                            <asp:ListItem
                                                Text="Non-Veg"
                                                Value="Non-Veg">
                                            </asp:ListItem>


                                        </asp:DropDownList>

                                    </div>


                                </div>


                                <!-- DESCRIPTION -->

                                <div>

                                    <label class="form-label">
                                        Description
                                    </label>


                                    <asp:TextBox
                                        ID="txtDescription"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="MultiLine"
                                        Rows="4"
                                        placeholder="Describe this food item...">
                                    </asp:TextBox>

                                </div>


                            </div>

                        </div>



                

                        <div class="admin-card">


                            <div class="card-header-admin">

                                <h3>

                                    <i class="fa-solid fa-indian-rupee-sign"
                                       style="color:#198754;margin-right:.4rem">
                                    </i>

                                    Pricing

                                </h3>

                            </div>


                            <div class="card-body-admin">


                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem">


                                    <!-- REGULAR PRICE -->

                                    <div>

                                        <label class="form-label">
                                            Regular Price (₹) *
                                        </label>


                                        <asp:TextBox
                                            ID="txtRegularPrice"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="Number"
                                            placeholder="e.g. 349">
                                        </asp:TextBox>

                                    </div>


                                    <!-- DISCOUNT PRICE -->

                                    <div>

                                        <label class="form-label">
                                            Discount Price (₹)
                                        </label>


                                        <asp:TextBox
                                            ID="txtDiscountPrice"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="Number"
                                            placeholder="e.g. 299">
                                        </asp:TextBox>

                                    </div>


                                </div>

                            </div>

                        </div>



              
            

                        <div class="admin-card">


                            <div class="card-header-admin">

                                <h3>

                                    <i class="fa-solid fa-leaf"
                                       style="color:#198754;margin-right:.4rem">
                                    </i>

                                    Ingredients

                                </h3>

                            </div>


                            <div class="card-body-admin">


                                <label class="form-label">
                                    Ingredients (comma separated)
                                </label>


                                <asp:TextBox
                                    ID="txtIngredients"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="e.g. Mozzarella, Pepperoni, Tomato Sauce, Basil"
                                    OnTextChanged="txtIngredients_TextChanged">
                                </asp:TextBox>


                            </div>

                        </div>


                    </div>



            

                    <div style="display:flex;flex-direction:column;gap:1.25rem">


                

                        <div class="admin-card">


                            <div class="card-header-admin">

                                <h3>

                                    <i class="fa-solid fa-image"
                                       style="color:#ff5a1f;margin-right:.4rem">
                                    </i>

                                    Food Image

                                </h3>

                            </div>


                            <div class="card-body-admin">


                                <!-- UPLOAD ZONE -->

                                <div
                                    class="img-upload-zone"
                                    onclick="document.getElementById('<%= fuFoodImage.ClientID %>').click()">


                                    <i class="fa-solid fa-cloud-arrow-up">
                                    </i>


                                    <p>

                                        Click to upload image

                                        <br />

                                        <span style="font-size:.75rem">
                                            JPG, PNG up to 5MB
                                        </span>

                                    </p>


                                </div>


                                <!-- FILE UPLOAD -->

                                <asp:FileUpload
                                    ID="fuFoodImage"
                                    runat="server"
                                    style="display:none"
                                    onchange="previewFoodImage(this)" />


                                <!-- IMAGE PREVIEW -->

                                <div
                                    id="foodImgPreview"
                                    style="margin-top:1rem;display:none;align-items:center;gap:.75rem">


                                    <img
                                        id="foodImgThumb"
                                        src=""
                                        alt="Preview"
                                        style="width:56px;height:56px;border-radius:.5rem;object-fit:cover" />


                                    <div>


                                        <div
                                            id="foodImgName"
                                            style="font-size:.85rem;font-weight:600">
                                        </div>


                                        <div
                                            style="font-size:.72rem;color:#6c757d">

                                            Ready to upload

                                        </div>


                                    </div>


                                </div>


                            </div>

                        </div>



                      

                        <div class="admin-card">


                            <div class="card-header-admin">

                                <h3>

                                    <i class="fa-solid fa-sliders"
                                       style="color:#6f42c1;margin-right:.4rem">
                                    </i>

                                    Settings

                                </h3>

                            </div>


                            <div class="card-body-admin">


                                <!-- AVAILABLE -->

                                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem">


                                    <label
                                        class="form-label"
                                        style="margin:0">

                                        Available

                                    </label>


                                    <div class="form-switch">


                                        <asp:CheckBox
                                            ID="chkAvailable"
                                            runat="server"
                                            Checked="true"
                                            CssClass="form-check-input" />


                                    </div>


                                </div>


                                <!-- FEATURED -->

                                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem">


                                    <label
                                        class="form-label"
                                        style="margin:0">

                                        Featured

                                    </label>


                                    <div class="form-switch">


                                        <asp:CheckBox
                                            ID="chkFeatured"
                                            runat="server"
                                            CssClass="form-check-input" />


                                    </div>


                                </div>


                                <!-- RATING -->

                                <div>


                                    <label class="form-label">
                                        Rating
                                    </label>


                                    <asp:DropDownList
                                        ID="ddlRating"
                                        runat="server"
                                        CssClass="form-select"
                                        OnSelectedIndexChanged="ddlRating_SelectedIndexChanged">


                                        <asp:ListItem
                                            Text="5.0"
                                            Value="5.0">
                                        </asp:ListItem>


                                        <asp:ListItem
                                            Text="4.5"
                                            Value="4.5">
                                        </asp:ListItem>


                                        <asp:ListItem
                                            Text="4.0"
                                            Value="4.0">
                                        </asp:ListItem>


                                        <asp:ListItem
                                            Text="3.5"
                                            Value="3.5">
                                        </asp:ListItem>


                                        <asp:ListItem
                                            Text="3.0"
                                            Value="3.0">
                                        </asp:ListItem>


                                    </asp:DropDownList>


                                </div>


                            </div>

                        </div>



                        <!-- =================================================
                             ACTION BUTTONS
                        ================================================== -->

                        <div class="admin-card">


                            <div
                                class="card-body-admin"
                                style="display:flex;flex-direction:column;gap:.5rem">


                                <!-- ADD FOOD -->

                                <asp:LinkButton
                                    ID="btnAddFood"
                                    runat="server"
                                    CssClass="btn-admin btn-admin-primary"
                                    style="width:100%;justify-content:center;padding:.7rem"
                                    OnClick="btnAddFood_Click">

                                    <i class="fa-solid fa-plus"></i>

                                    Add Food Item

                                </asp:LinkButton>


                                <!-- CANCEL -->

                                <asp:HyperLink
                                    ID="btnCancel"
                                    runat="server"
                                    NavigateUrl="menu.aspx"
                                    CssClass="btn-admin btn-admin-outline"
                                    style="width:100%;justify-content:center;padding:.7rem">

                                    <i class="fa-solid fa-times"></i>

                                    Cancel

                                </asp:HyperLink>


                            </div>

                        </div>


                    </div>


                </div>


            </div>


        </div>


    </main>


</asp:Content>




<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">


    <div id="adminToast"
         class="admin-toast">
    </div>


    <script src="js/admin.js"></script>


    <script>

        function previewFoodImage(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();


                reader.onload = function (e) {

                    document.getElementById("foodImgThumb").src =
                        e.target.result;


                    document.getElementById("foodImgName").textContent =
                        input.files[0].name;


                    document.getElementById("foodImgPreview").style.display =
                        "flex";

                };


                reader.readAsDataURL(input.files[0]);

            }

        }


        // Keep Menu active exactly like menu.aspx

        document.addEventListener("DOMContentLoaded", function () {

            var items =
                document.querySelectorAll(".sidebar-nav .nav-item");


            items.forEach(function (item) {

                if (item.getAttribute("href") === "menu.aspx") {

                    item.classList.add("active");

                }

            });

        });

    </script>


</asp:Content>


<asp:Content ID="Content4"
    ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">

</asp:Content>