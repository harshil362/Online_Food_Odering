<%@ Page Title="Admin Login | FoodieHub"
    Language="C#"
    MasterPageFile="~/admin/Admin_Site2.Master"
    AutoEventWireup="true"
    CodeBehind="login.aspx.cs"
    Inherits="Online_Food_Odering.admin.login" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <link rel="icon"
        type="image/png"
        href="<%= ResolveUrl("~/images/favicon.png") %>" />

    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link
        rel="stylesheet"
        href="<%= ResolveUrl("~/admin/css/admin.css") %>">

    <link
        rel="stylesheet"
        href="<%= ResolveUrl("~/admin/css/responsive.css") %>">

    <!-- LOGIN CSS MUST BE LAST -->
    <link
        rel="stylesheet"
        href="<%= ResolveUrl("~/admin/css/login.css") %>">
    <style type="text/css">
        .login-image-btn {
        }
    </style>
</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="admin-login-page">


        <!-- =================================================
             LEFT SIDE
        ================================================== -->

        <div class="login-visual">

            <img
                src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80"
                alt="Food">


            <h2>FoodieHub Admin
            </h2>


            <p>
                Manage your restaurant orders, menu,
                customers, and deliveries from one powerful
                dashboard.
            </p>


            <!-- STATISTICS -->

            <div class="login-stats">

                <div class="login-stat">

                    <div class="login-stat-value">
                        1.2K+
                    </div>

                    <div class="login-stat-label">
                        Orders
                    </div>

                </div>


                <div class="login-stat">

                    <div class="login-stat-value">
                        ₹4.5L
                    </div>

                    <div class="login-stat-label">
                        Revenue
                    </div>

                </div>


                <div class="login-stat">

                    <div class="login-stat-value">
                        850+
                    </div>

                    <div class="login-stat-label">
                        Customers
                    </div>

                </div>

            </div>

        </div>


        <!-- =================================================
             RIGHT SIDE
        ================================================== -->

        <div class="login-form-side">

            <div class="login-card">


                <!-- BRAND -->

                <div class="brand">

                    <img
                        src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80"
                        alt="FoodieHub">

                    <span>FoodieHub
                    </span>

                </div>


                <!-- TITLE -->

                <h2>Welcome back
                </h2>


                <p class="subtitle">
                    Sign in to your admin dashboard
                </p>


                <!-- =================================================
                     LOGIN FORM
                ================================================== -->

                <form
                    onsubmit="handleAdminLogin(event)"
                    class="admin-form">


                    <!-- EMAIL -->

                    <div class="admin-form-group">

                        <label
                            class="form-label"
                            for="adminEmail">
                            Email Address

                        </label>


                        <div class="input-icon">

                            <i class="fa-solid fa-envelope"></i>


                            <asp:TextBox
                                ID="adminEmail"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Email"
                                placeholder="admin@foodiehub.com">
                            </asp:TextBox>

                        </div>

                    </div>


                    <!-- PASSWORD -->

                    <div class="admin-form-group">

                        <label
                            class="form-label"
                            for="adminPassword">
                            Password

                        </label>


                        <div class="password-wrapper">


                            <asp:TextBox
                                ID="adminPassword"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password"
                                placeholder="Enter your password">
                            </asp:TextBox>

                            <button
                                type="button"
                                id="passwordToggle"
                                class="password-toggle"
                                onclick="togglePassword('<%= adminPassword.ClientID %>')"
                                aria-label="Show password">

                                <i
                                    class="fa-solid fa-eye"
                                    id="passwordIcon"></i>

                            </button>


                        </div>

                    </div>


                    <!-- REMEMBER + FORGOT -->

                    <div class="login-options">


                        <label class="remember-label">

                            <input
                                type="checkbox"
                                checked>

                            <span>Remember me
                            </span>

                        </label>


                        <a
                            href="#"
                            class="forgot-link">Forgot password?

                        </a>


                    </div>


                    <!-- SIGN IN -->

                    <asp:ImageButton
                        ID="ImageButton1"
                        runat="server"
                        ImageUrl="~/images/adminlogin.png"
                        CssClass="login-image-btn"
                        OnClick="adminLoginBtn_Click"
                        AlternateText="Login" />
                </form>


                <!-- DEMO MESSAGE -->

                <p class="demo-login-text">

                    <i class="fa-solid fa-shield-halved"></i>

                    Demo login — real authentication will be added later

                </p>

            </div>

        </div>

    </div>


    <!-- TOAST -->

    <div id="adminToast"
        class="admin-toast">
    </div>


    <!-- =================================================
         PASSWORD SCRIPT
    ================================================== -->

    <script>

        function togglePassword(inputId) {

            const passwordInput =
                document.getElementById(inputId);

            const passwordIcon =
                document.getElementById("passwordIcon");

            const passwordToggle =
                document.getElementById("passwordToggle");


            if (passwordInput.type === "password") {

                passwordInput.type = "text";

                passwordIcon.classList.remove("fa-eye");

                passwordIcon.classList.add("fa-eye-slash");

                passwordToggle.setAttribute(
                    "aria-label",
                    "Hide password"
                );

            }
            else {

                passwordInput.type = "password";

                passwordIcon.classList.remove("fa-eye-slash");

                passwordIcon.classList.add("fa-eye");

                passwordToggle.setAttribute(
                    "aria-label",
                    "Show password"
                );

            }

        }


        function handleAdminLogin(event) {

            event.preventDefault();


            const email =
                document.getElementById("adminEmail").value.trim();


            const password =
                document.getElementById("adminPassword").value;


            if (email === "" || password === "") {

                return false;

            }


            /*
                Your existing admin.js
                authentication logic can work here.
            */

            if (typeof window.adminLogin === "function") {

                window.adminLogin(
                    email,
                    password
                );

            }


            return false;

        }

    </script>


    <!-- ADMIN JS -->
</asp:Content>


<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">
</asp:Content>


<asp:Content ID="Content4"
    ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">
</asp:Content>
