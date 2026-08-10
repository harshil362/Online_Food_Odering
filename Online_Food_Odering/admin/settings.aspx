<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="Online_Food_Odering.admin.settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Settings | FoodieHub Admin</title>
        <link rel="icon" type="image/png" href="../images/favicon.png" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body class="admin-body">
        <div class="sidebar-overlay" onclick="toggleSidebar()"></div>
        <!-- SIDEBAR START -->

        <aside class="admin-sidebar">
            <div class="sidebar-brand">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" alt="FoodieHub"><span>FoodieHub</span></div>
            <nav class="sidebar-nav">
                <div class="nav-label">Main</div>
                <a href="dashboard.html" class="nav-item"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
                <div class="nav-label">Management</div>
                <a href="orders.html" class="nav-item"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.html" class="nav-item"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.html" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
                <div class="nav-label">Users</div>
                <a href="customers.html" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
                <div class="nav-label">Business</div>
                <a href="coupons.html" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a><a href="payments.html" class="nav-item"><i class="fa-solid fa-credit-card"></i>Payments</a><a href="delivery.html" class="nav-item"><i class="fa-solid fa-truck"></i>Delivery</a>
                <div class="nav-label">Insights</div>
                <a href="reviews.html" class="nav-item"><i class="fa-solid fa-star"></i>Reviews</a><a href="reports.html" class="nav-item"><i class="fa-solid fa-chart-line"></i>Reports</a>
                <div class="nav-label">System</div>
                <a href="settings.html" class="nav-item active"><i class="fa-solid fa-gear"></i>Settings</a>
            </nav>
            <div class="sidebar-footer"><a href="#" onclick="adminLogout()" class="nav-item"><i class="fa-solid fa-right-from-bracket"></i>Logout</a></div>
        </aside>
        <!-- SIDEBAR END -->
        <!-- TOPBAR START -->


        <header class="admin-topbar">
            <div class="topbar-left">
                <button class="menu-toggle" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
                <div class="topbar-search"><i class="fa-solid fa-search"></i>
                    <input type="text" placeholder="Search anything..."></div>
            </div>
            <div class="topbar-right">
                <div class="topbar-icon"><i class="fa-solid fa-bell"></i><span class="topbar-badge">3</span></div>
                <div style="position: relative">
                    <div class="admin-profile" onclick="toggleProfileDropdown()">
                        <img src="https://i.pravatar.cc/40?img=68" alt="Admin"><span>Admin</span><i class="fa-solid fa-chevron-down" style="font-size: .65rem; color: #6c757d"></i></div>
                    <div class="profile-dropdown"><a href="settings.html"><i class="fa-solid fa-user"></i>My Profile</a><a href="settings.html"><i class="fa-solid fa-gear"></i>Settings</a><div class="divider"></div>
                        <button onclick="adminLogout()" class="text-danger"><i class="fa-solid fa-right-from-bracket"></i>Logout</button></div>
                </div>
            </div>
        </header>
        <!-- TOPBAR END -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- MAIN CONTENT START -->


    <main class="admin-main">
        <div class="admin-content">
            <div class="page-header">
                <div>
                    <h1>Settings</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / Settings</div>
                </div>
            </div>

            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 1.25rem">
                <div style="display: flex; flex-direction: column; gap: 1.25rem">
                    <!-- General Settings -->
                    <div class="admin-card admin-form">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-store" style="color: #ff5a1f; margin-right: .4rem"></i>General Settings</h3>
                        </div>
                        <div class="settings-section">
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-bottom: 1rem">
                                <div>
                                    <label class="form-label">Restaurant Name</label><input type="text" class="form-control" value="FoodieHub"></div>
                                <div>
                                    <label class="form-label">Email</label><input type="email" class="form-control" value="admin@foodiehub.com"></div>
                            </div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-bottom: 1rem">
                                <div>
                                    <label class="form-label">Phone</label><input type="tel" class="form-control" value="+1 234 567 890"></div>
                                <div>
                                    <label class="form-label">Currency</label><select class="form-select"><option selected>₹ INR</option>
                                        <option>$ USD</option>
                                        <option>€ EUR</option>
                                    </select></div>
                            </div>
                            <div>
                                <label class="form-label">Address</label><textarea class="form-control" rows="2">123 Food Street, New York, NY 10001</textarea></div>
                            <div style="margin-top: 1rem">
                                <label class="form-label">Logo</label>
                                <div style="display: flex; align-items: center; gap: 1rem">
                                    <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" style="width: 56px; height: 56px; border-radius: 50%; object-fit: cover; border: 2px solid var(--admin-border)">
                                    <button type="button" class="btn-admin btn-admin-outline" onclick="showAdminToast('Upload dialog would open','info')"><i class="fa-solid fa-cloud-arrow-up"></i>Change Logo</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Delivery Settings -->
                    <div class="admin-card admin-form">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-truck" style="color: #0dcaf0; margin-right: .4rem"></i>Delivery Settings</h3>
                        </div>
                        <div class="settings-section">
                            <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 1rem">
                                <div>
                                    <label class="form-label">Delivery Charge (₹)</label><input type="number" class="form-control" value="30"></div>
                                <div>
                                    <label class="form-label">Min. Order (₹)</label><input type="number" class="form-control" value="149"></div>
                                <div>
                                    <label class="form-label">Free Delivery Above (₹)</label><input type="number" class="form-control" value="499"></div>
                            </div>
                            <div style="margin-top: 1rem">
                                <label class="form-label">Delivery Radius (km)</label><input type="number" class="form-control" value="10" style="max-width: 200px"></div>
                        </div>
                    </div>

                    <!-- Payment Settings -->
                    <div class="admin-card admin-form">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-credit-card" style="color: #198754; margin-right: .4rem"></i>Payment Settings</h3>
                        </div>
                        <div class="settings-section">
                            <div style="display: flex; flex-direction: column; gap: 1rem">
                                <div class="flex-between" style="padding: .85rem 1rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div>
                                        <div class="fw-600 fs-sm">Cash on Delivery</div>
                                        <div style="font-size: .72rem; color: #6c757d">Accept cash payments on delivery</div>
                                    </div>
                                    <div class="form-switch">
                                        <input class="form-check-input" type="checkbox" checked></div>
                                </div>
                                <div class="flex-between" style="padding: .85rem 1rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div>
                                        <div class="fw-600 fs-sm">Online Payment</div>
                                        <div style="font-size: .72rem; color: #6c757d">Credit card, debit card, UPI</div>
                                    </div>
                                    <div class="form-switch">
                                        <input class="form-check-input" type="checkbox" checked></div>
                                </div>
                                <div class="flex-between" style="padding: .85rem 1rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div>
                                        <div class="fw-600 fs-sm">Net Banking</div>
                                        <div style="font-size: .72rem; color: #6c757d">Direct bank transfers</div>
                                    </div>
                                    <div class="form-switch">
                                        <input class="form-check-input" type="checkbox" checked></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification Settings -->
                    <div class="admin-card admin-form">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-bell" style="color: #ffc107; margin-right: .4rem"></i>Notification Settings</h3>
                        </div>
                        <div class="settings-section">
                            <div style="display: flex; flex-direction: column; gap: 1rem">
                                <div class="flex-between" style="padding: .85rem 1rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div>
                                        <div class="fw-600 fs-sm">New Order Notification</div>
                                        <div style="font-size: .72rem; color: #6c757d">Get notified for every new order</div>
                                    </div>
                                    <div class="form-switch">
                                        <input class="form-check-input" type="checkbox" checked></div>
                                </div>
                                <div class="flex-between" style="padding: .85rem 1rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div>
                                        <div class="fw-600 fs-sm">Order Status Update</div>
                                        <div style="font-size: .72rem; color: #6c757d">When order status changes</div>
                                    </div>
                                    <div class="form-switch">
                                        <input class="form-check-input" type="checkbox" checked></div>
                                </div>
                                <div class="flex-between" style="padding: .85rem 1rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div>
                                        <div class="fw-600 fs-sm">Email Notifications</div>
                                        <div style="font-size: .72rem; color: #6c757d">Send email for important events</div>
                                    </div>
                                    <div class="form-switch">
                                        <input class="form-check-input" type="checkbox"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column - Admin Profile -->
                <div style="display: flex; flex-direction: column; gap: 1.25rem">
                    <div class="admin-card admin-form">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-user-shield" style="color: #6f42c1; margin-right: .4rem"></i>Admin Profile</h3>
                        </div>
                        <div class="card-body-admin" style="text-align: center">
                            <img src="https://i.pravatar.cc/120?img=68" style="width: 96px; height: 96px; border-radius: 50%; object-fit: cover; border: 4px solid #f5f7fa; box-shadow: 0 8px 24px rgba(0,0,0,.1); margin-bottom: 1rem">
                            <button type="button" class="btn-admin btn-admin-outline btn-admin-sm" onclick="showAdminToast('Upload dialog would open','info')" style="margin-bottom: 1.25rem"><i class="fa-solid fa-camera"></i>Change Photo</button>
                            <div style="text-align: left; display: flex; flex-direction: column; gap: 1rem">
                                <div>
                                    <label class="form-label">Full Name</label><input type="text" class="form-control" value="Admin User"></div>
                                <div>
                                    <label class="form-label">Email</label><input type="email" class="form-control" value="admin@foodiehub.com"></div>
                                <div>
                                    <label class="form-label">Phone</label><input type="tel" class="form-control" value="+1 234 567 890"></div>
                            </div>
                        </div>
                    </div>

                    <div class="admin-card admin-form">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-lock" style="color: #dc3545; margin-right: .4rem"></i>Change Password</h3>
                        </div>
                        <div class="card-body-admin" style="display: flex; flex-direction: column; gap: 1rem">
                            <div>
                                <label class="form-label">Current Password</label><input type="password" class="form-control" placeholder="Enter current password"></div>
                            <div>
                                <label class="form-label">New Password</label><input type="password" class="form-control" placeholder="Enter new password"></div>
                            <div>
                                <label class="form-label">Confirm Password</label><input type="password" class="form-control" placeholder="Confirm new password"></div>
                        </div>
                    </div>

                    <!-- Save Button -->
                    <button class="btn-admin btn-admin-primary" style="width: 100%; justify-content: center; padding: .8rem; font-size: .95rem" onclick="showAdminToast('Settings saved successfully!')">
                        <i class="fa-solid fa-save"></i>Save All Settings
                    </button>
                </div>
            </div>
        </div>
    </main>
    <!-- MAIN CONTENT END -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="adminToast" class="admin-toast"></div>
    <script src="js/admin.js"></script>
    </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
