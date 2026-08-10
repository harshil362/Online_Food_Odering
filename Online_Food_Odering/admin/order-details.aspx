<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="order-details.aspx.cs" Inherits="Online_Food_Odering.admin.order_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details | FoodieHub Admin</title>
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
                <a href="orders.html" class="nav-item active"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.html" class="nav-item"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.html" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
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
                    <h1>Order #FH1001</h1>
                    <div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / <a href="orders.html">Orders</a> / #FH1001</div>
                </div>
                <div style="display: flex; gap: .5rem">
                    <button class="btn-admin btn-admin-outline"><i class="fa-solid fa-print"></i>Print</button>
                    <select class="form-select" style="width: auto; font-size: .82rem; border-radius: .5rem" onchange="showAdminToast('Status updated to '+this.value)">
                        <option>Pending</option>
                        <option>Confirmed</option>
                        <option>Preparing</option>
                        <option selected>Delivered</option>
                        <option>Cancelled</option>
                    </select>
                </div>
            </div>

            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 1.25rem">
                <div style="display: flex; flex-direction: column; gap: 1.25rem">
                    <!-- Customer Info -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-user" style="color: #0d6efd; margin-right: .4rem"></i>Customer Information</h3>
                        </div>
                        <div class="card-body-admin">
                            <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1rem">
                                <img src="https://i.pravatar.cc/60?img=1" style="width: 56px; height: 56px; border-radius: 50%; object-fit: cover">
                                <div>
                                    <div class="fw-600">Ava Johnson</div>
                                    <div class="fs-sm" style="color: #6c757d">ava@email.com • +1 234-567-8901</div>
                                </div>
                            </div>
                            <div style="background: var(--admin-bg); padding: 1rem; border-radius: .6rem">
                                <div class="fs-sm fw-600" style="margin-bottom: .35rem"><i class="fa-solid fa-location-dot" style="color: #ff5a1f; margin-right: .4rem"></i>Delivery Address</div>
                                <div class="fs-sm" style="color: #6c757d">42 Park Avenue, Apt 3B, New York, NY 10001</div>
                            </div>
                        </div>
                    </div>

                    <!-- Ordered Items -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-utensils" style="color: #198754; margin-right: .4rem"></i>Ordered Items</h3>
                        </div>
                        <div class="table-responsive-admin">
                            <table class="admin-table">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="table-user">
                                                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=80&q=80" class="table-img">Pepperoni Pizza</div>
                                        </td>
                                        <td>2</td>
                                        <td>₹299</td>
                                        <td class="fw-600">₹598</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="table-user">
                                                <img src="https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&w=80&q=80" class="table-img">Berry Smoothie</div>
                                        </td>
                                        <td>1</td>
                                        <td>₹149</td>
                                        <td class="fw-600">₹149</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Payment Summary -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-receipt" style="color: #6f42c1; margin-right: .4rem"></i>Payment Summary</h3>
                        </div>
                        <div class="card-body-admin">
                            <div style="display: flex; flex-direction: column; gap: .5rem; font-size: .875rem">
                                <div class="flex-between"><span style="color: #6c757d">Subtotal</span><span>₹747</span></div>
                                <div class="flex-between"><span style="color: #6c757d">Discount (WELCOME50)</span><span style="color: #198754">-₹100</span></div>
                                <div class="flex-between"><span style="color: #6c757d">Delivery Fee</span><span>₹30</span></div>
                                <div class="flex-between"><span style="color: #6c757d">Tax (5%)</span><span>₹32</span></div>
                                <hr style="border: none; border-top: 1px dashed #e8ecf1; margin: .35rem 0">
                                <div class="flex-between fw-600" style="font-size: 1rem"><span>Total</span><span style="color: #ff5a1f">₹649</span></div>
                            </div>
                            <div style="margin-top: 1rem; background: var(--admin-bg); padding: .75rem 1rem; border-radius: .6rem; font-size: .82rem">
                                <span class="fw-600"><i class="fa-solid fa-credit-card" style="margin-right: .3rem"></i>Payment Method:</span> Credit Card (Visa ****1234)
                <span class="badge-admin badge-paid" style="margin-left: .5rem">Paid</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div style="display: flex; flex-direction: column; gap: 1.25rem">
                    <!-- Order Status -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-truck" style="color: #ff5a1f; margin-right: .4rem"></i>Order Status</h3>
                        </div>
                        <div class="card-body-admin">
                            <div style="text-align: center; margin-bottom: 1.25rem">
                                <span class="badge-admin badge-delivered" style="font-size: .85rem; padding: .5rem 1rem">Delivered</span>
                            </div>
                            <div class="timeline">
                                <div class="timeline-item completed">
                                    <h5>Order Placed</h5>
                                    <p>Aug 8, 2026 • 10:30 AM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Confirmed</h5>
                                    <p>Aug 8, 2026 • 10:32 AM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Preparing</h5>
                                    <p>Aug 8, 2026 • 10:35 AM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Out for Delivery</h5>
                                    <p>Aug 8, 2026 • 11:00 AM</p>
                                </div>
                                <div class="timeline-item completed">
                                    <h5>Delivered</h5>
                                    <p>Aug 8, 2026 • 11:25 AM</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Delivery Info -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3><i class="fa-solid fa-motorcycle" style="color: #0dcaf0; margin-right: .4rem"></i>Delivery Partner</h3>
                        </div>
                        <div class="card-body-admin">
                            <div style="display: flex; align-items: center; gap: .75rem">
                                <img src="https://i.pravatar.cc/48?img=52" style="width: 48px; height: 48px; border-radius: 50%">
                                <div>
                                    <div class="fw-600">Ravi Verma</div>
                                    <div class="fs-sm" style="color: #6c757d">+91 98765-11111</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="admin-card">
                        <div class="card-header-admin">
                            <h3>Quick Actions</h3>
                        </div>
                        <div class="card-body-admin" style="display: flex; flex-direction: column; gap: .5rem">
                            <button class="btn-admin btn-admin-outline" style="width: 100%; justify-content: center" onclick="showAdminToast('Invoice downloaded')"><i class="fa-solid fa-file-invoice"></i>Download Invoice</button>
                            <button class="btn-admin btn-admin-outline" style="width: 100%; justify-content: center" onclick="showAdminToast('Email sent to customer')"><i class="fa-solid fa-envelope"></i>Email Customer</button>
                            <button class="btn-admin btn-admin-danger" style="width: 100%; justify-content: center" onclick="showModal('Cancel Order','Are you sure you want to cancel this order?',()=>showAdminToast('Order cancelled','error'))"><i class="fa-solid fa-ban"></i>Cancel Order</button>
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
