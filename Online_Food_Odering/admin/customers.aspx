<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="Online_Food_Odering.admin.customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customers | FoodieHub Admin</title>
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
                <a href="customers.html" class="nav-item active"><i class="fa-solid fa-users"></i>Customers</a>
                <div class="nav-label">Business</div>
                <a href="coupons.html" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a><a href="payments.html" class="nav-item"><i class="fa-solid fa-credit-card"></i>Payments</a><a href="delivery.html" class="nav-item"><i class="fa-solid fa-truck"></i>Delivery</a>
                <div class="nav-label">Insights</div>
                <a href="reviews.html" class="nav-item"><i class="fa-solid fa-star"></i>Reviews</a><a href="reports.html" class="nav-item"><i class="fa-solid fa-chart-line"></i>Reports</a>
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
                    <h1>Customers</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / Customers</div>
                </div>
                <button class="btn-admin btn-admin-outline"><i class="fa-solid fa-download"></i>Export</button>
            </div>

            <div class="gap-grid grid-4" style="margin-bottom: 1.5rem">
                <div class="admin-card stat-card">
                    <div class="stat-icon success"><i class="fa-solid fa-users"></i></div>
                    <div class="stat-info">
                        <h4>856</h4>
                        <p>Total Customers</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon primary"><i class="fa-solid fa-user-plus"></i></div>
                    <div class="stat-info">
                        <h4>42</h4>
                        <p>New This Month</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon info"><i class="fa-solid fa-user-check"></i></div>
                    <div class="stat-info">
                        <h4>812</h4>
                        <p>Active</p>
                    </div>
                </div>
                <div class="admin-card stat-card">
                    <div class="stat-icon danger"><i class="fa-solid fa-user-slash"></i></div>
                    <div class="stat-info">
                        <h4>5</h4>
                        <p>Blocked</p>
                    </div>
                </div>
            </div>

            <div class="admin-card">
                <div class="filter-bar">
                    <div class="input-icon"><i class="fa-solid fa-search"></i>
                        <input type="text" id="customerSearch" class="form-control" placeholder="Search customers..."></div>
                    <select class="form-select" style="max-width: 140px">
                        <option value="">All Status</option>
                        <option>Active</option>
                        <option>Blocked</option>
                    </select>
                </div>
                <div class="table-responsive-admin">
                    <table class="admin-table" id="customersTable">
                        <thead>
                            <tr>
                                <th>Customer</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Orders</th>
                                <th>Total Spent</th>
                                <th>Status</th>
                                <th>Joined</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="customersTableBody"></tbody>
                    </table>
                </div>
                <div class="admin-pagination">
                    <div class="info">Showing 1-8 of 8 customers</div>
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
        document.getElementById('customersTableBody').innerHTML = demoCustomers.map(c => `<tr>
      <td><div class="table-user"><img src="${c.avatar}" alt="">${c.name}</div></td>
      <td class="fs-sm">${c.email}</td>
      <td class="fs-sm">${c.phone}</td>
      <td class="fw-600">${c.orders}</td>
      <td class="fw-600">${c.spent}</td>
      <td>${statusBadge(c.status)}</td>
      <td class="fs-sm">${c.joined}</td>
      <td><div class="btn-group-admin">
        <a href="customer-details.html" class="btn-admin btn-admin-outline btn-admin-sm"><i class="fa-solid fa-eye"></i></a>
        <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Block Customer','Block ${c.name}?',()=>showAdminToast('Customer blocked','error'))"><i class="fa-solid fa-ban"></i></button>
      </div></td>
    </tr>`).join('');
    </script>
    </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
