<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="payments.aspx.cs" Inherits="Online_Food_Odering.admin.payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payments | FoodieHub Admin</title>
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
                <a href="dashboard.aspx" class="nav-item"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
                <div class="nav-label">Management</div>
                <a href="orders.aspx" class="nav-item"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.aspx" class="nav-item"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.aspx" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
                <div class="nav-label">Users</div>
                <a href="customers.aspx" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
                <div class="nav-label">Business</div>
                <a href="coupons.aspx" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a><a href="payments.aspx" class="nav-item active"><i class="fa-solid fa-credit-card"></i>Payments</a><a href="delivery.aspx" class="nav-item"><i class="fa-solid fa-truck"></i>Delivery</a>
                <div class="nav-label">Insights</div>
                <a href="reviews.aspx" class="nav-item"><i class="fa-solid fa-star"></i>Reviews</a><a href="reports.aspx" class="nav-item"><i class="fa-solid fa-chart-line"></i>Reports</a>
                <div class="nav-label">System</div>
                <a href="settings.aspx" class="nav-item"><i class="fa-solid fa-gear"></i>Settings</a>
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
                    <div class="profile-dropdown"><a href="settings.aspx"><i class="fa-solid fa-user"></i>My Profile</a><a href="settings.aspx"><i class="fa-solid fa-gear"></i>Settings</a><div class="divider"></div>
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
                    <h1>Payments</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.aspx">Dashboard</a> / Payments</div>
                </div>
                <button class="btn-admin btn-admin-outline"><i class="fa-solid fa-download"></i>Export</button>
            </div>

            <div class="gap-grid grid-4" style="margin-bottom: 1.5rem">
                <div class="admin-card stat-card">
                    <div class="stat-icon primary"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                    <div class="stat-info">
                        <h4>₹2,445</h4>
                        <p>Total Collected</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon success"><i class="fa-solid fa-circle-check"></i></div>
                    <div class="stat-info">
                        <h4>4</h4>
                        <p>Paid</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon warning"><i class="fa-solid fa-clock"></i></div>
                    <div class="stat-info">
                        <h4>1</h4>
                        <p>Pending</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon danger"><i class="fa-solid fa-circle-xmark"></i></div>
                    <div class="stat-info">
                        <h4>1</h4>
                        <p>Failed</p>
                    </div>
                </div>
            </div>

            <div class="admin-card">
                <div class="filter-bar">
                    <div class="input-icon"><i class="fa-solid fa-search"></i>
                        <input type="text" id="paymentSearch" class="form-control" placeholder="Search payments..."></div>
                    <select id="paymentStatusFilter" class="form-select" style="max-width: 140px">
                        <option value="">All Status</option>
                        <option>Paid</option>
                        <option>Pending</option>
                        <option>Failed</option>
                        <option>Refunded</option>
                    </select>
                    <input type="date" class="form-control" style="max-width: 160px">
                </div>
                <div class="table-responsive-admin">
                    <table class="admin-table" id="paymentsTable">
                        <thead>
                            <tr>
                                <th>Payment ID</th>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Amount</th>
                                <th>Method</th>
                                <th>Transaction ID</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody id="paymentsTableBody"></tbody>
                    </table>
                </div>
                <div class="admin-pagination">
                    <div class="info">Showing 1-6 of 6 payments</div>
                    <div class="page-btns">
                        <button class="page-btn"><i class="fa-solid fa-chevron-left"></i></button>
                        <button class="page-btn active">1</button>
                        <button class="page-btn"><i class="fa-solid fa-chevron-right"></i></button>
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
    <script>
        document.getElementById('paymentsTableBody').innerHTML = demoPayments.map(p => `<tr>
      <td class="fw-600 fs-sm">${p.id}</td>
      <td><a href="order-details.aspx" style="color:#ff5a1f;font-weight:600">${p.orderId}</a></td>
      <td class="fs-sm">${p.customer}</td>
      <td class="fw-600">${p.amount}</td>
      <td class="fs-sm">${p.method}</td>
      <td class="fs-sm" style="font-family:monospace">${p.txnId}</td>
      <td>${statusBadge(p.status)}</td>
      <td class="fs-sm">${p.date}</td>
    </tr>`).join('');
    </script>
    </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
