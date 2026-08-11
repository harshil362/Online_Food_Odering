<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="customer-details.aspx.cs" Inherits="Online_Food_Odering.admin.customer_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer Details | FoodieHub Admin</title>
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
                <a href="customers.aspx" class="nav-item active"><i class="fa-solid fa-users"></i>Customers</a>
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
                    <h1>Customer Details</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.aspx">Dashboard</a> / <a href="customers.aspx">Customers</a> / Ava Johnson</div>
                </div>
                <button class="btn-admin btn-admin-danger" onclick="showModal('Block Customer','Block Ava Johnson?',()=>showAdminToast('Customer blocked','error'))"><i class="fa-solid fa-ban"></i>Block Customer</button>
            </div>

            <div style="display: grid; grid-template-columns: 1fr 2fr; gap: 1.25rem">
                <!-- Profile Card -->
                <div style="display: flex; flex-direction: column; gap: 1.25rem">
                    <div class="admin-card">
                        <div class="card-body-admin" style="text-align: center; padding: 2rem 1.25rem">
                            <img src="https://i.pravatar.cc/120?img=1" style="width: 96px; height: 96px; border-radius: 50%; object-fit: cover; border: 4px solid #f5f7fa; box-shadow: 0 8px 24px rgba(0,0,0,.1); margin-bottom: 1rem">
                            <h3 style="font-size: 1.1rem; font-weight: 700; margin: 0 0 .25rem">Ava Johnson</h3>
                            <p style="color: #6c757d; font-size: .82rem; margin: 0 0 .75rem">Customer since Jan 15, 2026</p>
                            <span class="badge-admin badge-active">Active</span>
                        </div>
                        <div style="border-top: 1px solid var(--admin-border); padding: 1.25rem">
                            <div style="display: flex; flex-direction: column; gap: .75rem; font-size: .85rem">
                                <div class="flex-between"><span style="color: #6c757d"><i class="fa-solid fa-envelope" style="width: 18px; margin-right: .4rem"></i>Email</span><span>ava@email.com</span></div>
                                <div class="flex-between"><span style="color: #6c757d"><i class="fa-solid fa-phone" style="width: 18px; margin-right: .4rem"></i>Phone</span><span>+1 234-567-8901</span></div>
                                <div class="flex-between"><span style="color: #6c757d"><i class="fa-solid fa-calendar" style="width: 18px; margin-right: .4rem"></i>Joined</span><span>Jan 15, 2026</span></div>
                            </div>
                        </div>
                    </div>

                    <!-- Stats -->
                    <div class="admin-card">
                        <div class="card-body-admin">
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem">
                                <div style="text-align: center; padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div style="font-size: 1.25rem; font-weight: 700; color: #ff5a1f">12</div>
                                    <div style="font-size: .72rem; color: #6c757d">Orders</div>
                                </div>
                                <div style="text-align: center; padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div style="font-size: 1.25rem; font-weight: 700; color: #198754">₹8,450</div>
                                    <div style="font-size: .72rem; color: #6c757d">Total Spent</div>
                                </div>
                                <div style="text-align: center; padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div style="font-size: 1.25rem; font-weight: 700; color: #0d6efd">₹704</div>
                                    <div style="font-size: .72rem; color: #6c757d">Avg. Order</div>
                                </div>
                                <div style="text-align: center; padding: .75rem; background: var(--admin-bg); border-radius: .6rem">
                                    <div style="font-size: 1.25rem; font-weight: 700; color: #6f42c1">3</div>
                                    <div style="font-size: .72rem; color: #6c757d">Reviews</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Addresses -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3>Saved Addresses</h3>
                        </div>
                        <div class="card-body-admin" style="display: flex; flex-direction: column; gap: .75rem">
                            <div style="background: var(--admin-bg); padding: .85rem; border-radius: .6rem">
                                <div class="fw-600 fs-sm"><i class="fa-solid fa-house" style="color: #ff5a1f; margin-right: .3rem"></i>Home</div>
                                <div style="font-size: .78rem; color: #6c757d; margin-top: .25rem">42 Park Avenue, Apt 3B, New York, NY 10001</div>
                            </div>
                            <div style="background: var(--admin-bg); padding: .85rem; border-radius: .6rem">
                                <div class="fw-600 fs-sm"><i class="fa-solid fa-briefcase" style="color: #0d6efd; margin-right: .3rem"></i>Work</div>
                                <div style="font-size: .78rem; color: #6c757d; margin-top: .25rem">180 Broadway, Floor 12, New York, NY 10007</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div style="display: flex; flex-direction: column; gap: 1.25rem">
                    <!-- Order History -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3>Order History</h3>
                            <a href="orders.aspx" class="btn-admin btn-admin-outline btn-admin-sm">View All</a></div>
                        <div class="table-responsive-admin">
                            <table class="admin-table">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Items</th>
                                        <th>Amount</th>
                                        <th>Status</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="fw-600">#FH1001</td>
                                        <td class="fs-sm">Pepperoni Pizza x2</td>
                                        <td class="fw-600">₹649</td>
                                        <td><span class="badge-admin badge-delivered">Delivered</span></td>
                                        <td class="fs-sm">Aug 8, 2026</td>
                                        <td><a href="order-details.aspx" class="btn-admin btn-admin-outline btn-admin-sm"><i class="fa-solid fa-eye"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-600">#FH0987</td>
                                        <td class="fs-sm">Smoky Burger x1</td>
                                        <td class="fw-600">₹249</td>
                                        <td><span class="badge-admin badge-delivered">Delivered</span></td>
                                        <td class="fs-sm">Aug 3, 2026</td>
                                        <td><a href="order-details.aspx" class="btn-admin btn-admin-outline btn-admin-sm"><i class="fa-solid fa-eye"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-600">#FH0945</td>
                                        <td class="fs-sm">Biryani x1, Lassi x2</td>
                                        <td class="fw-600">₹499</td>
                                        <td><span class="badge-admin badge-delivered">Delivered</span></td>
                                        <td class="fs-sm">Jul 28, 2026</td>
                                        <td><a href="order-details.aspx" class="btn-admin btn-admin-outline btn-admin-sm"><i class="fa-solid fa-eye"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-600">#FH0901</td>
                                        <td class="fs-sm">Chocolate Lava x3</td>
                                        <td class="fw-600">₹477</td>
                                        <td><span class="badge-admin badge-cancelled">Cancelled</span></td>
                                        <td class="fs-sm">Jul 20, 2026</td>
                                        <td><a href="order-details.aspx" class="btn-admin btn-admin-outline btn-admin-sm"><i class="fa-solid fa-eye"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Recent Activity -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3>Recent Activity</h3>
                        </div>
                        <div class="card-body-admin">
                            <div class="timeline">
                                <div class="timeline-item completed">
                                    <h5>Placed Order #FH1001</h5>
                                    <p>Aug 8, 2026 • 10:30 AM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Left a 5-star review on Pepperoni Pizza</h5>
                                    <p>Aug 5, 2026 • 2:15 PM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Placed Order #FH0987</h5>
                                    <p>Aug 3, 2026 • 7:45 PM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Updated delivery address</h5>
                                    <p>Aug 1, 2026 • 11:00 AM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Placed Order #FH0945</h5>
                                    <p>Jul 28, 2026 • 1:20 PM</p>
                                </div>
                                <div class="timeline-item">
                                    <h5>Account created</h5>
                                    <p>Jan 15, 2026 • 9:00 AM</p>
                                </div>
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
    </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
