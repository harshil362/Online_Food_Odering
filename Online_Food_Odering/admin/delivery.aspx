<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="delivery.aspx.cs" Inherits="Online_Food_Odering.admin.delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delivery | FoodieHub Admin</title>
  <link rel="icon" type="image/png" href="../images/favicon.png" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
  <link rel="stylesheet" href="css/admin.css">
  <link rel="stylesheet" href="css/responsive.css">
</head>
<body class="admin-body">
  <div class="sidebar-overlay" onclick="toggleSidebar()"></div>  <!-- SIDEBAR START -->

  <aside class="admin-sidebar">
    <div class="sidebar-brand"><img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" alt="FoodieHub"><span>FoodieHub</span></div>
    <nav class="sidebar-nav">
      <div class="nav-label">Main</div><a href="dashboard.html" class="nav-item"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
      <div class="nav-label">Management</div><a href="orders.html" class="nav-item"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.html" class="nav-item"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.html" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
      <div class="nav-label">Users</div><a href="customers.html" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
      <div class="nav-label">Business</div><a href="coupons.html" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a><a href="payments.html" class="nav-item"><i class="fa-solid fa-credit-card"></i>Payments</a><a href="delivery.html" class="nav-item active"><i class="fa-solid fa-truck"></i>Delivery</a>
      <div class="nav-label">Insights</div><a href="reviews.html" class="nav-item"><i class="fa-solid fa-star"></i>Reviews</a><a href="reports.html" class="nav-item"><i class="fa-solid fa-chart-line"></i>Reports</a>
      <div class="nav-label">System</div><a href="settings.html" class="nav-item"><i class="fa-solid fa-gear"></i>Settings</a>
    </nav>
    <div class="sidebar-footer"><a href="#" onclick="adminLogout()" class="nav-item"><i class="fa-solid fa-right-from-bracket"></i>Logout</a></div>
  </aside>
  <!-- SIDEBAR END -->
  <!-- TOPBAR START -->


  <header class="admin-topbar">
    <div class="topbar-left"><button class="menu-toggle" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button><div class="topbar-search"><i class="fa-solid fa-search"></i><input type="text" placeholder="Search anything..."></div></div>
    <div class="topbar-right">
      <div class="topbar-icon"><i class="fa-solid fa-bell"></i><span class="topbar-badge">3</span></div>
      <div style="position:relative"><div class="admin-profile" onclick="toggleProfileDropdown()"><img src="https://i.pravatar.cc/40?img=68" alt="Admin"><span>Admin</span><i class="fa-solid fa-chevron-down" style="font-size:.65rem;color:#6c757d"></i></div>
        <div class="profile-dropdown"><a href="settings.html"><i class="fa-solid fa-user"></i>My Profile</a><a href="settings.html"><i class="fa-solid fa-gear"></i>Settings</a><div class="divider"></div><button onclick="adminLogout()" class="text-danger"><i class="fa-solid fa-right-from-bracket"></i>Logout</button></div>
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
        <div><h1>Delivery Management</h1><div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / Delivery</div></div>
        <button class="btn-admin btn-admin-primary" onclick="showAdminToast('Add partner modal would open')"><i class="fa-solid fa-plus"></i>Add Partner</button>
      </div>

      <div class="gap-grid grid-4" style="margin-bottom:1.5rem">
        <div class="admin-card stat-card"><div class="stat-icon info"><i class="fa-solid fa-motorcycle"></i></div><div class="stat-info"><h4>6</h4><p>Total Partners</p></div></div>
        <div class="admin-card stat-card"><div class="stat-icon success"><i class="fa-solid fa-circle-check"></i></div><div class="stat-info"><h4>3</h4><p>Available</p></div></div>
        <div class="admin-card stat-card"><div class="stat-icon warning"><i class="fa-solid fa-spinner"></i></div><div class="stat-info"><h4>2</h4><p>Busy</p></div></div>
        <div class="admin-card stat-card"><div class="stat-icon danger"><i class="fa-solid fa-power-off"></i></div><div class="stat-info"><h4>1</h4><p>Offline</p></div></div>
      </div>

      <div class="gap-grid grid-3" id="partnerGrid"></div>
    </div>
  </main>
  <!-- MAIN CONTENT END -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div id="adminToast" class="admin-toast"></div>
  <script src="js/admin.js"></script>
  <script>
    document.getElementById('partnerGrid').innerHTML=demoDeliveryPartners.map(p=>`
      <div class="admin-card">
        <div class="card-body-admin">
          <div style="display:flex;align-items:center;gap:1rem;margin-bottom:1rem">
            <img src="${p.avatar}" style="width:56px;height:56px;border-radius:50%;object-fit:cover;border:3px solid ${p.status==='Available'?'#198754':p.status==='Busy'?'#ffc107':'#6c757d'}">
            <div style="flex:1">
              <div class="fw-600">${p.name}</div>
              <div class="fs-sm" style="color:#6c757d">${p.phone}</div>
            </div>
            ${statusBadge(p.status)}
          </div>
          <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:.5rem;margin-bottom:1rem">
            <div style="text-align:center;padding:.5rem;background:var(--admin-bg);border-radius:.5rem">
              <div style="font-size:1.1rem;font-weight:700;color:#0d6efd">${p.assigned}</div>
              <div style="font-size:.68rem;color:#6c757d">Assigned</div>
            </div>
            <div style="text-align:center;padding:.5rem;background:var(--admin-bg);border-radius:.5rem">
              <div style="font-size:1.1rem;font-weight:700;color:#198754">${p.completed}</div>
              <div style="font-size:.68rem;color:#6c757d">Completed</div>
            </div>
            <div style="text-align:center;padding:.5rem;background:var(--admin-bg);border-radius:.5rem">
              <div style="font-size:1.1rem;font-weight:700;color:#ff5a1f">${p.earnings}</div>
              <div style="font-size:.68rem;color:#6c757d">Earnings</div>
            </div>
          </div>
          <div class="btn-group-admin">
            <button class="btn-admin btn-admin-outline btn-admin-sm" style="flex:1;justify-content:center" onclick="showAdminToast('View details')"><i class="fa-solid fa-eye"></i> View</button>
            <button class="btn-admin btn-admin-info btn-admin-sm" style="flex:1;justify-content:center" onclick="showAdminToast('Edit partner')"><i class="fa-solid fa-pen"></i> Edit</button>
          </div>
        </div>
      </div>
    `).join('');
  </script>
</body>
</html>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
