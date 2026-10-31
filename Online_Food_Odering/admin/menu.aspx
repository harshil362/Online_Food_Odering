<%@ Page Title="Menu Management | FoodieHub Admin" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master"
    AutoEventWireup="true"
    CodeBehind="menu.aspx.cs"
    Inherits="Online_Food_Odering.admin.menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="css/admin.css" />
    <link rel="stylesheet" href="css/responsive.css" />


    <!-- =========================================
         FOOD GRID DESIGN ONLY
         ========================================= -->

    <style>

        /* Main Grid Container */
        .food-grid-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e7e9ee;
            border-radius: 14px;
            background: #ffffff;
        }


        /* Grid */
        .food-grid {
            width: 100%;
            min-width: 1150px;
        }


        /* Header + Row Layout */
        .food-grid-header,
        .food-grid-row {

            display: grid;

            grid-template-columns:
                90px
                1.25fr
                .75fr
                .85fr
                .9fr
                .95fr
                1.35fr
                1.45fr
                .65fr
                1.15fr;

            align-items: center;
        }


        /* =========================================
           TABLE HEADER
           ========================================= */

        .food-grid-header {

            min-height: 58px;

            background: #f8f9fb;

            border-bottom: 1px solid #e5e7eb;

            color: #374151;

            font-size: 12px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: .3px;
        }


        .food-grid-header .food-grid-cell {

            padding: 15px 12px;

        }


        /* =========================================
           TABLE ROW
           ========================================= */

        .food-grid-row {

            min-height: 88px;

            background: #ffffff;

            border-bottom: 1px solid #edf0f3;

            transition: all .2s ease;
        }


        .food-grid-row:last-child {

            border-bottom: none;

        }


        /* Alternate Row */
        .food-grid-row:nth-child(even) {

            background: #fcfcfd;

        }


        /* Hover */
        .food-grid-row:hover {

            background: #fff8f4;

            box-shadow: inset 3px 0 0 #ff5a1f;

        }


        /* =========================================
           CELL
           ========================================= */

        .food-grid-cell {

            padding: 13px 12px;

            min-width: 0;

            color: #374151;

            font-size: 14px;

            line-height: 1.45;

        }


        /* =========================================
           FOOD IMAGE
           ========================================= */

        .food-image-box {

            width: 58px;

            height: 58px;

            border-radius: 10px;

            overflow: hidden;

            border: 1px solid #e5e7eb;

            background: #f8f9fb;

            display: flex;

            align-items: center;

            justify-content: center;

        }


        .food-image-box img {

            width: 100%;

            height: 100%;

            object-fit: cover;

            display: block;

        }


        /* =========================================
           FOOD NAME
           ========================================= */

        .food-name {

            font-size: 14px;

            font-weight: 650;

            color: #1f2937;

            line-height: 1.4;

        }


        /* =========================================
           CATEGORY
           ========================================= */

        .food-category {

            display: inline-flex;

            align-items: center;

            padding: 5px 9px;

            border-radius: 7px;

            background: #f3f4f6;

            color: #4b5563;

            font-size: 12px;

            font-weight: 600;

        }


        /* =========================================
           FOOD TYPE
           ========================================= */

        .food-type {

            display: inline-flex;

            align-items: center;

            padding: 5px 9px;

            border-radius: 7px;

            background: #fff3ed;

            color: #e64b1f;

            font-size: 12px;

            font-weight: 600;

        }


        /* =========================================
           REGULAR PRICE
           ========================================= */

        .food-price {

            font-weight: 650;

            color: #1f2937;

            white-space: nowrap;

        }


        /* =========================================
           DISCOUNT PRICE
           ========================================= */

        .food-discount-price {

            font-weight: 650;

            color: #16a34a;

            white-space: nowrap;

        }


        /* =========================================
           DESCRIPTION
           ========================================= */

        .food-description {

            color: #6b7280;

            display: -webkit-box;

            -webkit-box-orient: vertical;

            -webkit-line-clamp: 2;

            overflow: hidden;

            line-height: 1.45;

            max-height: 42px;

        }


        /* =========================================
           INGREDIENTS
           ========================================= */

        .food-ingredients {

            color: #6b7280;

            display: -webkit-box;

            -webkit-box-orient: vertical;

            -webkit-line-clamp: 2;

            overflow: hidden;

            line-height: 1.45;

            max-height: 42px;

        }


        /* =========================================
           RATING
           ========================================= */

        .food-rating {

            display: inline-flex;

            align-items: center;

            gap: 5px;

            font-weight: 650;

            color: #374151;

            white-space: nowrap;

        }


        .food-rating i {

            color: #f59e0b;

            font-size: 12px;

        }


        /* =========================================
           ACTION BUTTONS
           ========================================= */

        .food-actions {

            display: flex;

            align-items: center;

            gap: 7px;

            white-space: nowrap;

        }


        .food-action-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 5px;

            height: 34px;

            padding: 0 10px;

            border-radius: 7px;

            font-size: 12px;

            font-weight: 600;

            text-decoration: none !important;

            transition: all .2s ease;

            cursor: pointer;

        }


        /* Edit */
        .food-edit-btn {

            background: #fff3ed;

            color: #ff5a1f !important;

            border: 1px solid #ffd8c7;

        }


        .food-edit-btn:hover {

            background: #ff5a1f;

            color: #ffffff !important;

            border-color: #ff5a1f;

        }


        /* Delete */
        .food-delete-btn {

            background: #fff1f2;

            color: #dc3545 !important;

            border: 1px solid #fecdd3;

        }


        .food-delete-btn:hover {

            background: #dc3545;

            color: #ffffff !important;

            border-color: #dc3545;

        }


        /* =========================================
           SCROLLBAR
           ========================================= */

        .food-grid-wrapper::-webkit-scrollbar {

            height: 8px;

        }


        .food-grid-wrapper::-webkit-scrollbar-track {

            background: #f3f4f6;

        }


        .food-grid-wrapper::-webkit-scrollbar-thumb {

            background: #d1d5db;

            border-radius: 10px;

        }


        .food-grid-wrapper::-webkit-scrollbar-thumb:hover {

            background: #9ca3af;

        }


        /* =========================================
           RESPONSIVE
           ========================================= */

        @media (max-width: 1200px) {

            .food-grid-wrapper {

                overflow-x: auto;

            }

            .food-grid {

                min-width: 1150px;

            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <main class="admin-main">

        <div class="admin-content">


            <!-- =========================================
                 PAGE HEADER
                 ========================================= -->

            <div class="d-flex justify-content-between align-items-center mb-4"
                style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">

                <div>

                    <h1 style="margin: 0; font-size: 1.75rem;">
                        Menu Management
                    </h1>


                    <div class="breadcrumb-nav"
                        style="color: #6c757d; font-size: 0.875rem; margin-top: 0.25rem;">

                        <a href="dashboard.aspx"
                            style="color: #ff5a1f; text-decoration: none;">
                            Dashboard
                        </a>

                        / Menu

                    </div>

                </div>


                <!-- ADD FOOD -->
                <asp:HyperLink
                    ID="AddFoodBtn"
                    runat="server"
                    NavigateUrl="add-food.aspx"
                    CssClass="btn-admin btn-admin-primary"
                    Style="display: inline-flex; align-items: center; gap: 0.5rem; text-decoration: none;">

                    <i class="fa-solid fa-plus"></i>

                    Add Food Item

                </asp:HyperLink>

            </div>


            <!-- =========================================
                 SEARCH / FILTER SECTION
                 ========================================= -->

            <div class="admin-card p-3 mb-4"
                style="margin-bottom: 1.5rem; padding: 1.25rem;">

                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 1rem;">


                    <!-- SEARCH FOOD -->

                    <div>

                        <label class="form-label"
                            style="font-size: 0.85rem; font-weight: 600;">

                            Search Food

                        </label>


                        <asp:TextBox
                            ID="txtSearch"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Search food by name...">
                        </asp:TextBox>

                    </div>


                    <!-- CATEGORY -->

                    <div>

                        <label class="form-label"
                            style="font-size: 0.85rem; font-weight: 600;">

                            Category

                        </label>


                        <asp:DropDownList
                            ID="ddlCategory"
                            runat="server"
                            CssClass="form-select">

                        </asp:DropDownList>

                    </div>


                    <!-- FOOD TYPE -->

                    <div>

                        <label class="form-label"
                            style="font-size: 0.85rem; font-weight: 600;">

                            Food Type

                        </label>


                        <asp:DropDownList
                            ID="ddlType"
                            runat="server"
                            CssClass="form-select">

                        </asp:DropDownList>

                    </div>


                </div>

            </div>


            <!-- =========================================
                 FOOD PRODUCTS CARD
                 ========================================= -->

            <div class="admin-card mb-4"
                style="margin-bottom: 1.5rem; padding: 1.25rem;">


                <!-- CARD HEADER -->

                <div class="card-header-admin"
                    style="margin-bottom: 1rem; border-bottom: 1px solid #eee; padding-bottom: 0.75rem;">

                    <h3 style="margin: 0;">

                        <i class="fa-solid fa-utensils"
                            style="color: #ff5a1f; margin-right: 0.5rem;">
                        </i>

                        All Food Products

                    </h3>

                </div>


                <!-- =========================================
                     FOOD GRID
                     ========================================= -->

                <div class="food-grid-wrapper">


                    <asp:DataList
                        ID="DataList1"
                        runat="server"
                        RepeatDirection="Vertical"
                        Width="100%"
                        BorderStyle="None"
                        CellSpacing="0"
                        CellPadding="0"
                        OnItemCommand="DataList1_ItemCommand">



                        <HeaderTemplate>

                            <div class="food-grid">

                                <div class="food-grid-header">


                                    <!-- IMAGE -->

                                    <div class="food-grid-cell">
                                        Food Image
                                    </div>


                                    <!-- NAME -->

                                    <div class="food-grid-cell">
                                        Food Name
                                    </div>


                                    <!-- CATEGORY -->

                                    <div class="food-grid-cell">
                                        Category
                                    </div>


                                    <!-- TYPE -->

                                    <div class="food-grid-cell">
                                        Food Type
                                    </div>


                                    <!-- REGULAR PRICE -->

                                    <div class="food-grid-cell">
                                        Regular Price
                                    </div>


                                    <!-- DISCOUNT -->

                                    <div class="food-grid-cell">
                                        Discount Price
                                    </div>


                                    <!-- DESCRIPTION -->

                                    <div class="food-grid-cell">
                                        Description
                                    </div>


                                    <!-- INGREDIENTS -->

                                    <div class="food-grid-cell">
                                        Ingredients
                                    </div>


                                    <!-- RATING -->

                                    <div class="food-grid-cell">
                                        Rating
                                    </div>


                                    <!-- ACTION -->

                                    <div class="food-grid-cell">
                                        Actions
                                    </div>


                                </div>

                            </div>

                        </HeaderTemplate>


                     

                        <ItemTemplate>

                            <div class="food-grid">

                                <div class="food-grid-row">


                                    

                                    <div class="food-grid-cell">

                                        <div class="food-image-box">

                                            <asp:Image
                                                ID="Image1"
                                                runat="server"
                                                ImageUrl='<%# Eval("Food_Image") %>' />

                                        </div>

                                    </div>


                                    <div class="food-grid-cell">

                                        <div class="food-name">

                                            <%# Eval("Food_Name") %>

                                        </div>

                                    </div>


                  

                                    <div class="food-grid-cell">

                                        <span class="food-category">

                                            <%# Eval("Food_Category_id") %>

                                        </span>

                                    </div>



                                    <div class="food-grid-cell">

                                        <span class="food-type">

                                            <%# Eval("Food_Type") %>

                                        </span>

                                    </div>



                                    <div class="food-grid-cell">

                                        <span class="food-price">

                                            ₹<%# Eval("Food_Regular_Price") %>

                                        </span>

                                    </div>


                                    <div class="food-grid-cell">

                                        <span class="food-discount-price">

                                            ₹<%# Eval("Food_Discount_Price") %>

                                        </span>

                                    </div>




                                    <div class="food-grid-cell">

                                        <div class="food-description">

                                            <%# Eval("Food_Description") %>

                                        </div>

                                    </div>


                                    <div class="food-grid-cell">

                                        <div class="food-ingredients">

                                            <%# Eval("Food_Ingredients") %>

                                        </div>

                                    </div>



                                    <div class="food-grid-cell">

                                        <span class="food-rating">

                                            <i class="fa-solid fa-star"></i>

                                            <%# Eval("Food_Rating") %>

                                        </span>

                                    </div>


                                    <div class="food-grid-cell">

                                        <div class="food-actions">


                                            <!-- EDIT -->

                                            <asp:HyperLink
                                                ID="EditFood"
                                                runat="server"
                                                NavigateUrl='<%# "edit-food.aspx?id=" + Eval("Food_Id") %>'
                                                CssClass="food-action-btn food-edit-btn">

                                                <i class="fa-solid fa-pen-to-square"></i>

                                                Edit

                                            </asp:HyperLink>


                                            <!-- DELETE -->

                                            <asp:LinkButton
                                                ID="DeleteFood"
                                                runat="server"
                                                CommandName="DeleteFood"
                                                CommandArgument='<%# Eval("Food_Id") %>'
                                                OnClientClick="return confirm('Are you sure you want to remove this food item?');"
                                                CssClass="food-action-btn food-delete-btn">

                                                <i class="fa-solid fa-trash"></i>

                                                Remove

                                            </asp:LinkButton>


                                        </div>

                                    </div>


                                </div>

                            </div>

                        </ItemTemplate>


                    </asp:DataList>


                </div>


            </div>


        </div>

    </main>


    <!-- TOAST -->

    <div id="adminToast" class="admin-toast"></div>


    <script src="js/admin.js"></script>


</asp:Content>


<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">

</asp:Content>