<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="Online_Food_Odering.admin.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Orders | FoodieHub Admin</title>
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
                <a href="orders.aspx" class="nav-item active"><i class="fa-solid fa-bag-shopping"></i>Orders</a>
                <a href="menu.aspx" class="nav-item"><i class="fa-solid fa-utensils"></i>Menu</a>
                <a href="categories.aspx" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
                <div class="nav-label">Users</div>
                <a href="customers.aspx" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
                <div class="nav-label">Business</div>
                <a href="coupons.aspx" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a>
                <a href="payments.aspx" class="nav-item"><i class="fa-solid fa-credit-card"></i>Payments</a>
                <a href="delivery.aspx" class="nav-item"><i class="fa-solid fa-truck"></i>Delivery</a>
                <div class="nav-label">Insights</div>
                <a href="reviews.aspx" class="nav-item"><i class="fa-solid fa-star"></i>Reviews</a>
                <a href="reports.aspx" class="nav-item"><i class="fa-solid fa-chart-line"></i>Reports</a>



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
                    <div class="profile-dropdown">
                        <a href="settings.aspx"><i class="fa-solid fa-user"></i>My Profile</a>
                        <a href="settings.aspx"><i class="fa-solid fa-gear"></i>Settings</a>
                        <div class="divider"></div>
                        <button onclick="adminLogout()" class="text-danger"><i class="fa-solid fa-right-from-bracket"></i>Logout</button>
                    </div>
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
                    <h1>Orders</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.aspx">Dashboard</a> / Orders</div>
                </div>
                <button class="btn-admin btn-admin-primary"><i class="fa-solid fa-download"></i>Export Orders</button>
            </div>

            <!-- Stats Row -->
            <div class="gap-grid grid-4" style="margin-bottom: 1.5rem">
                <div class="admin-card stat-card">
                    <div class="stat-icon info"><i class="fa-solid fa-bag-shopping"></i></div>
                    <div class="stat-info">
                        <h4>1,248</h4>
                        <p>Total Orders</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon warning"><i class="fa-solid fa-clock"></i></div>
                    <div class="stat-info">
                        <h4>23</h4>
                        <p>Pending</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon purple"><i class="fa-solid fa-fire-burner"></i></div>
                    <div class="stat-info">
                        <h4>8</h4>
                        <p>Preparing</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon success"><i class="fa-solid fa-circle-check"></i></div>
                    <div class="stat-info">
                        <h4>1,180</h4>
                        <p>Delivered</p>
                    </div>
                </div>
            </div>

            <!-- Orders Table -->
            <div class="admin-card">
                <div class="filter-bar">
                    <div class="input-icon"><i class="fa-solid fa-search"></i>
                        <input type="text" id="orderSearch" class="form-control" placeholder="Search orders..."></div>
                    <select id="orderStatusFilter" class="form-select">
                        <option value="">All Status</option>
                        <option>Pending</option>
                        <option>Confirmed</option>
                        <option>Preparing</option>
                        <option>Out for Delivery</option>
                        <option>Delivered</option>
                        <option>Cancelled</option>
                    </select>
                    <input type="date" class="form-control" style="max-width: 160px">
                </div>
                <div class="table-responsive-admin">
                    <table class="admin-table" id="ordersTable">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Items</th>
                                <th>Amount</th>
                                <th>Payment</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="ordersTableBody"></tbody>
                    </table>
                </div>
                <div class="admin-pagination">
                    <div class="info">Showing 1-10 of 10 orders</div>
                    <div class="page-btns">
                        <button class="page-btn"><i class="fa-solid fa-chevron-left"></i></button>
                        <button class="page-btn active">1</button>
                        <button class="page-btn">2</button>
                        <button class="page-btn">3</button>
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
    <div id="modalOverlay" class="admin-modal-overlay">
        <div class="admin-modal">
            <h3>Confirm</h3>
            <p>Are you sure?</p>
            <div class="admin-modal-actions">
                <button class="btn-admin btn-admin-outline" onclick="closeModal()">Cancel</button>
                <button class="btn-admin btn-admin-primary" onclick="confirmModal()">Confirm</button></div>
        </div>
    </div>

    <script src="js/admin.js"></script>
    <script>
        document.getElementById('ordersTableBody').innerHTML = demoOrders.map(o => `<tr>
      <td class="fw-600">${o.id}</td>
      <td><div class="table-user"><img src="${o.avatar}" alt="">${o.customer}</div></td>
      <td class="fs-sm">${o.items}</td>
      <td class="fw-600">${o.amount}</td>
      <td class="fs-sm">${o.payment}</td>
      <td>${statusBadge(o.status)}</td>
      <td class="fs-sm">${o.date}</td>
      <td><div class="btn-group-admin"><a href="order-details.aspx" class="btn-admin btn-admin-outline btn-admin-sm"><i class="fa-solid fa-eye"></i></a><button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Status updated')"><i class="fa-solid fa-pen"></i></button></div></td>
    </tr>`).join('');
    </script>
    </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
