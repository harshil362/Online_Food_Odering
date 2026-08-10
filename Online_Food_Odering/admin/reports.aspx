<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="Online_Food_Odering.admin.reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reports | FoodieHub Admin</title>
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
                <a href="reviews.html" class="nav-item"><i class="fa-solid fa-star"></i>Reviews</a><a href="reports.html" class="nav-item active"><i class="fa-solid fa-chart-line"></i>Reports</a>
                <div class="nav-label">System</div>
                <a href="settings.html" class="nav-item"><i class="fa-solid fa-gear"></i>Settings</a>
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
                    <h1>Reports & Analytics</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / Reports</div>
                </div>
                <div style="display: flex; gap: .5rem; align-items: center">
                    <div class="chart-tabs">
                        <button class="chart-tab active">This Month</button>
                        <button class="chart-tab">This Year</button>
                        <button class="chart-tab">Custom</button>
                    </div>
                    <button class="btn-admin btn-admin-outline"><i class="fa-solid fa-download"></i>Export</button>
                </div>
            </div>

            <!-- Summary Stats -->
            <div class="gap-grid grid-4" style="margin-bottom: 1.5rem">
                <div class="admin-card stat-card">
                    <div class="stat-icon primary"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                    <div class="stat-info">
                        <h4>₹4,52,800</h4>
                        <p>Total Revenue</p>
                        <div class="stat-trend up"><i class="fa-solid fa-arrow-up"></i>12.5%</div>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon info"><i class="fa-solid fa-bag-shopping"></i></div>
                    <div class="stat-info">
                        <h4>1,248</h4>
                        <p>Total Orders</p>
                        <div class="stat-trend up"><i class="fa-solid fa-arrow-up"></i>8.2%</div>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon success"><i class="fa-solid fa-users"></i></div>
                    <div class="stat-info">
                        <h4>856</h4>
                        <p>Customers</p>
                        <div class="stat-trend up"><i class="fa-solid fa-arrow-up"></i>5.1%</div>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon warning"><i class="fa-solid fa-star"></i></div>
                    <div class="stat-info">
                        <h4>4.5</h4>
                        <p>Avg Rating</p>
                        <div class="stat-trend up"><i class="fa-solid fa-arrow-up"></i>0.2</div>
                    </div>
                </div>
            </div>

            <!-- Revenue + Orders Charts -->
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.25rem; margin-bottom: 1.5rem">
                <div class="admin-card">
                    <div class="card-header-admin">
                        <h3><i class="fa-solid fa-chart-column" style="color: #ff5a1f; margin-right: .4rem"></i>Revenue Report</h3>
                    </div>
                    <div class="card-body-admin">
                        <div class="chart-container">
                            <canvas id="revenueBarChart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="admin-card">
                    <div class="card-header-admin">
                        <h3><i class="fa-solid fa-chart-line" style="color: #0d6efd; margin-right: .4rem"></i>Order Report</h3>
                    </div>
                    <div class="card-body-admin">
                        <div class="chart-container">
                            <canvas id="orderLineChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Category + Food Sales -->
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.25rem; margin-bottom: 1.5rem">
                <div class="admin-card">
                    <div class="card-header-admin">
                        <h3><i class="fa-solid fa-chart-pie" style="color: #6f42c1; margin-right: .4rem"></i>Category Performance</h3>
                    </div>
                    <div class="card-body-admin">
                        <div class="chart-container">
                            <canvas id="categoryPieChart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="admin-card">
                    <div class="card-header-admin">
                        <h3><i class="fa-solid fa-ranking-star" style="color: #198754; margin-right: .4rem"></i>Food Sales Report</h3>
                    </div>
                    <div class="card-body-admin">
                        <div class="chart-container">
                            <canvas id="foodSalesChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Payment + Customer Reports -->
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.25rem">
                <div class="admin-card">
                    <div class="card-header-admin">
                        <h3><i class="fa-solid fa-credit-card" style="color: #0dcaf0; margin-right: .4rem"></i>Payment Report</h3>
                    </div>
                    <div class="card-body-admin">
                        <div style="display: flex; flex-direction: column; gap: .75rem">
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">Credit Card</div>
                                    <div style="font-size: .72rem; color: #6c757d">42% of payments</div>
                                </div>
                                <div class="fw-600" style="color: #ff5a1f">₹1,90,176</div>
                            </div>
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">UPI</div>
                                    <div style="font-size: .72rem; color: #6c757d">31% of payments</div>
                                </div>
                                <div class="fw-600" style="color: #ff5a1f">₹1,40,368</div>
                            </div>
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">Cash on Delivery</div>
                                    <div style="font-size: .72rem; color: #6c757d">20% of payments</div>
                                </div>
                                <div class="fw-600" style="color: #ff5a1f">₹90,560</div>
                            </div>
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">Net Banking</div>
                                    <div style="font-size: .72rem; color: #6c757d">7% of payments</div>
                                </div>
                                <div class="fw-600" style="color: #ff5a1f">₹31,696</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="admin-card">
                    <div class="card-header-admin">
                        <h3><i class="fa-solid fa-user-group" style="color: #198754; margin-right: .4rem"></i>Customer Report</h3>
                    </div>
                    <div class="card-body-admin">
                        <div style="display: flex; flex-direction: column; gap: .75rem">
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">New Customers</div>
                                    <div style="font-size: .72rem; color: #6c757d">This month</div>
                                </div>
                                <div class="fw-600" style="color: #198754">+42</div>
                            </div>
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">Returning Customers</div>
                                    <div style="font-size: .72rem; color: #6c757d">This month</div>
                                </div>
                                <div class="fw-600" style="color: #0d6efd">68%</div>
                            </div>
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">Avg. Order Value</div>
                                    <div style="font-size: .72rem; color: #6c757d">Per customer</div>
                                </div>
                                <div class="fw-600" style="color: #ff5a1f">₹362</div>
                            </div>
                            <div class="flex-between" style="padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                <div>
                                    <div class="fw-600 fs-sm">Customer Lifetime Value</div>
                                    <div style="font-size: .72rem; color: #6c757d">Average</div>
                                </div>
                                <div class="fw-600" style="color: #6f42c1">₹5,290</div>
                            </div>
                        </div>
                    </div>
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
