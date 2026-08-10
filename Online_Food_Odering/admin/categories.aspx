<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="Online_Food_Odering.admin.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Categories | FoodieHub Admin</title>
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
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" alt="FoodieHub"><span>FoodieHub</span>
            </div>
            <nav class="sidebar-nav">
                <div class="nav-label">Main</div>
                <a href="dashboard.html" class="nav-item"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
                <div class="nav-label">Management</div>
                <a href="orders.html" class="nav-item"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.html" class="nav-item"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.html" class="nav-item active"><i class="fa-solid fa-layer-group"></i>Categories</a>
                <div class="nav-label">Users</div>
                <a href="customers.html" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
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
                <div class="topbar-search">
                    <i class="fa-solid fa-search"></i>
                    <input type="text" placeholder="Search anything...">
                </div>
            </div>
            <div class="topbar-right">
                <div class="topbar-icon"><i class="fa-solid fa-bell"></i><span class="topbar-badge">3</span></div>
                <div style="position: relative">
                    <div class="admin-profile" onclick="toggleProfileDropdown()">
                        <img src="https://i.pravatar.cc/40?img=68" alt="Admin"><span>Admin</span><i class="fa-solid fa-chevron-down" style="font-size: .65rem; color: #6c757d"></i>
                    </div>
                    <div class="profile-dropdown">
                        <a href="settings.html"><i class="fa-solid fa-user"></i>My Profile</a><a href="settings.html"><i class="fa-solid fa-gear"></i>Settings</a><div class="divider"></div>
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
                    <h1>Categories</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / Categories</div>
                </div>
                <button class="btn-admin btn-admin-primary" onclick="showAdminToast('Add category modal would open here')"><i class="fa-solid fa-plus"></i>Add Category</button>
            </div>

            <div class="gap-grid grid-3">
                <div class="admin-card">
                    <div style="position: relative">
                        <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=400&q=80" style="width: 100%; height: 160px; object-fit: cover">
                        <span class="badge-admin badge-active" style="position: absolute; top: .75rem; right: .75rem">Active</span>
                    </div>
                    <div class="card-body-admin">
                        <div class="flex-between" style="margin-bottom: .5rem">
                            <h3 style="font-size: 1rem; font-weight: 700; margin: 0">Pizza</h3>
                            <span class="fs-sm" style="color: #6c757d">12 items</span>
                        </div>
                        <div class="btn-group-admin" style="margin-top: .75rem">
                            <button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Edit category')"><i class="fa-solid fa-pen"></i>Edit</button>
                            <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Delete Category','Delete Pizza category?',()=>showAdminToast('Category deleted','error'))"><i class="fa-solid fa-trash"></i>Delete</button>
                        </div>
                    </div>
                </div>

                <div class="admin-card">
                    <div style="position: relative">
                        <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=400&q=80" style="width: 100%; height: 160px; object-fit: cover">
                        <span class="badge-admin badge-active" style="position: absolute; top: .75rem; right: .75rem">Active</span>
                    </div>
                    <div class="card-body-admin">
                        <div class="flex-between" style="margin-bottom: .5rem">
                            <h3 style="font-size: 1rem; font-weight: 700; margin: 0">Burger</h3>
                            <span class="fs-sm" style="color: #6c757d">8 items</span>
                        </div>
                        <div class="btn-group-admin" style="margin-top: .75rem">
                            <button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Edit category')"><i class="fa-solid fa-pen"></i>Edit</button>
                            <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Delete Category','Delete Burger category?',()=>showAdminToast('Category deleted','error'))"><i class="fa-solid fa-trash"></i>Delete</button>
                        </div>
                    </div>
                </div>

                <div class="admin-card">
                    <div style="position: relative">
                        <img src="https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=400&q=80" style="width: 100%; height: 160px; object-fit: cover">
                        <span class="badge-admin badge-active" style="position: absolute; top: .75rem; right: .75rem">Active</span>
                    </div>
                    <div class="card-body-admin">
                        <div class="flex-between" style="margin-bottom: .5rem">
                            <h3 style="font-size: 1rem; font-weight: 700; margin: 0">Biryani</h3>
                            <span class="fs-sm" style="color: #6c757d">10 items</span>
                        </div>
                        <div class="btn-group-admin" style="margin-top: .75rem">
                            <button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Edit category')"><i class="fa-solid fa-pen"></i>Edit</button>
                            <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Delete Category','Delete Biryani category?',()=>showAdminToast('Category deleted','error'))"><i class="fa-solid fa-trash"></i>Delete</button>
                        </div>
                    </div>
                </div>

                <div class="admin-card">
                    <div style="position: relative">
                        <img src="https://images.unsplash.com/photo-1526318896980-cf78c088247c?auto=format&fit=crop&w=400&q=80" style="width: 100%; height: 160px; object-fit: cover">
                        <span class="badge-admin badge-active" style="position: absolute; top: .75rem; right: .75rem">Active</span>
                    </div>
                    <div class="card-body-admin">
                        <div class="flex-between" style="margin-bottom: .5rem">
                            <h3 style="font-size: 1rem; font-weight: 700; margin: 0">Chinese</h3>
                            <span class="fs-sm" style="color: #6c757d">9 items</span>
                        </div>
                        <div class="btn-group-admin" style="margin-top: .75rem">
                            <button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Edit category')"><i class="fa-solid fa-pen"></i>Edit</button>
                            <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Delete Category','Delete Chinese category?',()=>showAdminToast('Category deleted','error'))"><i class="fa-solid fa-trash"></i>Delete</button>
                        </div>
                    </div>
                </div>

                <div class="admin-card">
                    <div style="position: relative">
                        <img src="https://images.unsplash.com/photo-1621303837174-89787a7d4729?auto=format&fit=crop&w=400&q=80" style="width: 100%; height: 160px; object-fit: cover">
                        <span class="badge-admin badge-active" style="position: absolute; top: .75rem; right: .75rem">Active</span>
                    </div>
                    <div class="card-body-admin">
                        <div class="flex-between" style="margin-bottom: .5rem">
                            <h3 style="font-size: 1rem; font-weight: 700; margin: 0">Desserts</h3>
                            <span class="fs-sm" style="color: #6c757d">7 items</span>
                        </div>
                        <div class="btn-group-admin" style="margin-top: .75rem">
                            <button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Edit category')"><i class="fa-solid fa-pen"></i>Edit</button>
                            <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Delete Category','Delete Desserts category?',()=>showAdminToast('Category deleted','error'))"><i class="fa-solid fa-trash"></i>Delete</button>
                        </div>
                    </div>
                </div>

                <div class="admin-card">
                    <div style="position: relative">
                        <img src="https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&w=400&q=80" style="width: 100%; height: 160px; object-fit: cover">
                        <span class="badge-admin badge-active" style="position: absolute; top: .75rem; right: .75rem">Active</span>
                    </div>
                    <div class="card-body-admin">
                        <div class="flex-between" style="margin-bottom: .5rem">
                            <h3 style="font-size: 1rem; font-weight: 700; margin: 0">Drinks</h3>
                            <span class="fs-sm" style="color: #6c757d">6 items</span>
                        </div>
                        <div class="btn-group-admin" style="margin-top: .75rem">
                            <button class="btn-admin btn-admin-info btn-admin-sm" onclick="showAdminToast('Edit category')"><i class="fa-solid fa-pen"></i>Edit</button>
                            <button class="btn-admin btn-admin-danger btn-admin-sm" onclick="showModal('Delete Category','Delete Drinks category?',()=>showAdminToast('Category deleted','error'))"><i class="fa-solid fa-trash"></i>Delete</button>
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
    <div id="modalOverlay" class="admin-modal-overlay">
        <div class="admin-modal">
            <h3>Confirm</h3>
            <p>Are you sure?</p>
            <div class="admin-modal-actions">
                <button class="btn-admin btn-admin-outline" onclick="closeModal()">Cancel</button>
                <button class="btn-admin btn-admin-primary" onclick="confirmModal()">Delete</button>
            </div>
        </div>
    </div>
    <script src="js/admin.js"></script>
    </body>
</html>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
