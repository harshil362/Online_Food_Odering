<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Online_Food_Odering.admin.menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu | FoodieHub Admin</title>
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
                <a href="orders.aspx" class="nav-item"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.aspx" class="nav-item active"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.aspx" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
                <div class="nav-label">Users</div>
                <a href="customers.aspx" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
                <div class="nav-label">Business</div>
                <a href="coupons.aspx" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a><a href="payments.aspx" class="nav-item"><i class="fa-solid fa-credit-card"></i>Payments</a><a href="delivery.aspx" class="nav-item"><i class="fa-solid fa-truck"></i>Delivery</a>
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
                    <h1>Menu Management</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.aspx">Dashboard</a> / Menu</div>
                </div>
                <a href="add-food.aspx" class="btn-admin btn-admin-primary"><i class="fa-solid fa-plus"></i>Add Food Item</a>
            </div>

            <div class="admin-card">
                <div class="filter-bar">
                    <div class="input-icon"><i class="fa-solid fa-search"></i>
                        <input type="text" id="menuSearch" class="form-control" placeholder="Search menu..."></div>
                    <select class="form-select" style="max-width: 160px">
                        <option value="">All Categories</option>
                        <option>Pizza</option>
                        <option>Burger</option>
                        <option>Biryani</option>
                        <option>Chinese</option>
                        <option>Sandwich</option>
                        <option>Drinks</option>
                        <option>Desserts</option>
                    </select>
                    <select class="form-select" style="max-width: 140px">
                        <option value="">All Types</option>
                        <option>Veg</option>
                        <option>Non-Veg</option>
                    </select>
                </div>
                <div class="table-responsive-admin">
                    <table class="admin-table" id="menuTable">
                        <thead>
                            <tr>
                                <th>Food</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Discount</th>
                                <th>Type</th>
                                <th>Rating</th>
                                <th>Available</th>
                                <th>Featured</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="menuTableBody"></tbody>
                    </table>
                </div>
                <div class="admin-pagination">
                    <div class="info">Showing 1-8 of 8 items</div>
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
            <h3>Delete Item</h3>
            <p>Are you sure you want to delete this food item?</p>
            <div class="admin-modal-actions">
                <button class="btn-admin btn-admin-outline" onclick="closeModal()">Cancel</button>
                <button class="btn-admin btn-admin-primary" onclick="confirmModal()">Delete</button></div>
        </div>
    </div>

    <script src="js/admin.js"></script>
    <script>
        document.getElementById('menuTableBody').innerHTML = demoFoodItems.map(f => `<tr>
      <td><div class="table-user"><img src="${f.image}" class="table-img">${f.name}</div></td>
      <td class="fs-sm">${f.category}</td>
      <td class="fw-600">${f.price}</td>
      <td>${f.discount ? '<span style="color:#198754">' + f.discount + '</span>' : '—'}</td>
      <td><span class="badge-admin badge-${f.type === 'Veg' ? 'veg' : 'nonveg'}">${f.type}</span></td>
      <td>${starRating(Math.round(f.rating))}</td>
      <td><label style="cursor:pointer"><input type="checkbox" ${f.available ? 'checked' : ''} style="accent-color:#ff5a1f;width:16px;height:16px" onchange="showAdminToast(this.checked?'Item enabled':'Item disabled','info')"></label></td>
      <td>${f.featured ? '<span class="badge-admin badge-featured"><i class="fa-solid fa-fire"></i> Featured</span>' : '—'}</td>
      <td><div class="btn-group-admin">
       
       <asp:LinkButton ID="btnDeleteFood" runat="server" CssClass="btn-admin btn-admin-danger btn-admin-sm" ToolTip="Delete" OnClientClick="showModal('Delete Item','Are you sure you want to delete this item?',()=>showAdminToast('Item deleted','error')); return false;"> <i class="fa-solid fa-trash"></i></asp:LinkButton>
      </div></td>
    </tr>`).join('');
    </script>
    </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
