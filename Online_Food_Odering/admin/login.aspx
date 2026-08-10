<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Online_Food_Odering.admin.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login | FoodieHub</title>
        <link rel="icon" type="image/png" href="../images/favicon.png" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body class="admin-body">
        <div class="admin-login-page">
            <div class="login-visual">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Food">
                <h2>FoodieHub Admin</h2>
                <p>Manage your restaurant orders, menu, customers, and deliveries from one powerful dashboard.</p>
                <div style="margin-top: 2rem; display: flex; gap: 2rem; z-index: 1; position: relative">
                    <div style="text-align: center">
                        <div style="font-size: 1.5rem; font-weight: 700">1.2K+</div>
                        <div style="font-size: .8rem; color: rgba(255,255,255,.6)">Orders</div>
                    </div>
                    <div style="text-align: center">
                        <div style="font-size: 1.5rem; font-weight: 700">₹4.5L</div>
                        <div style="font-size: .8rem; color: rgba(255,255,255,.6)">Revenue</div>
                    </div>
                    <div style="text-align: center">
                        <div style="font-size: 1.5rem; font-weight: 700">850+</div>
                        <div style="font-size: .8rem; color: rgba(255,255,255,.6)">Customers</div>
                    </div>
                </div>
            </div>
            <div class="login-form-side">
                <div class="login-card">
                    <div class="brand">
                        <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" alt="FoodieHub">
                        <span>FoodieHub</span>
                    </div>
                    <h2>Welcome back</h2>
                    <p class="subtitle">Sign in to your admin dashboard</p>
                    <form onsubmit="handleAdminLogin(event)" class="admin-form">
                        <div style="margin-bottom: 1rem">
                            <label class="form-label">Email Address</label>
                            <div class="input-icon">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="email" id="adminEmail" class="form-control" placeholder="admin@foodiehub.com" value="admin@foodiehub.com" required>
                            </div>
                        </div>
                        <div style="margin-bottom: 1rem">
                            <label class="form-label">Password</label>
                            <div style="position: relative">
                                <input type="password" id="adminPassword" class="form-control" placeholder="Enter your password" value="admin123" required style="padding-right: 2.5rem">
                                <button type="button" onclick="togglePassword('adminPassword')" style="position: absolute; right: .5rem; top: 50%; transform: translateY(-50%); background: none; border: none; cursor: pointer; color: #6c757d"><i class="fa-solid fa-eye"></i></button>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.25rem; font-size: .85rem">
                            <label style="display: flex; align-items: center; gap: .4rem; cursor: pointer">
                                <input type="checkbox" checked style="accent-color: #ff5a1f">
                                Remember me
                            </label>
                            <a href="#" style="color: #ff5a1f; font-weight: 500">Forgot password?</a>
                        </div>
                        <button type="submit" class="btn-admin btn-admin-primary" style="width: 100%; padding: .75rem; font-size: .95rem; justify-content: center">
                            <i class="fa-solid fa-right-to-bracket"></i>Sign In
                        </button>
                    </form>
                    <p style="text-align: center; margin-top: 1.5rem; font-size: .8rem; color: #6c757d">
                        <i class="fa-solid fa-shield-halved"></i>Demo login — real authentication will be added later
                    </p>
                </div>
            </div>
        </div>
        <div id="adminToast" class="admin-toast"></div>
        <script src="js/admin.js"></script>
    </body>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    </html>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
