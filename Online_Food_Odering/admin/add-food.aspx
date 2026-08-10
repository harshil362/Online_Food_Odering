<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_Site2.Master" AutoEventWireup="true" CodeBehind="add-food.aspx.cs" Inherits="Online_Food_Odering.admin.add_food" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Food | FoodieHub Admin</title>
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
      <div class="nav-label">Management</div><a href="orders.html" class="nav-item"><i class="fa-solid fa-bag-shopping"></i>Orders</a><a href="menu.html" class="nav-item active"><i class="fa-solid fa-utensils"></i>Menu</a><a href="categories.html" class="nav-item"><i class="fa-solid fa-layer-group"></i>Categories</a>
      <div class="nav-label">Users</div><a href="customers.html" class="nav-item"><i class="fa-solid fa-users"></i>Customers</a>
      <div class="nav-label">Business</div><a href="coupons.html" class="nav-item"><i class="fa-solid fa-ticket"></i>Coupons</a><a href="payments.html" class="nav-item"><i class="fa-solid fa-credit-card"></i>Payments</a><a href="delivery.html" class="nav-item"><i class="fa-solid fa-truck"></i>Delivery</a>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <main class="admin-main">
    <div class="admin-content">
      <div class="page-header">
        <div><h1>Add Food Item</h1><div class="breadcrumb-nav"><a href="dashboard.html">Dashboard</a> / <a href="menu.html">Menu</a> / Add Food</div></div>
      </div>

      <form class="admin-form" onsubmit="event.preventDefault();showAdminToast('Food item added successfully!');setTimeout(()=>window.location.href='menu.html',1200)">
        <div style="display:grid;grid-template-columns:2fr 1fr;gap:1.25rem">
          <div style="display:flex;flex-direction:column;gap:1.25rem">
            <!-- Basic Info -->
            <div class="admin-card">
              <div class="card-header-admin"><h3><i class="fa-solid fa-info-circle" style="color:#0d6efd;margin-right:.4rem"></i>Basic Information</h3></div>
              <div class="card-body-admin">
                <div style="margin-bottom:1rem"><label class="form-label">Food Name *</label><input type="text" class="form-control" placeholder="e.g. Pepperoni Pizza" required></div>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-bottom:1rem">
                  <div><label class="form-label">Category *</label>
                    <select class="form-select" required><option value="">Select category</option><option>Pizza</option><option>Burger</option><option>Biryani</option><option>Chinese</option><option>Sandwich</option><option>Drinks</option><option>Desserts</option></select>
                  </div>
                  <div><label class="form-label">Food Type *</label>
                    <select class="form-select" required><option value="">Select type</option><option>Veg</option><option>Non-Veg</option></select>
                  </div>
                </div>
                <div><label class="form-label">Description</label><textarea class="form-control" placeholder="Describe this food item..." rows="4"></textarea></div>
              </div>
            </div>

            <!-- Pricing -->
            <div class="admin-card">
              <div class="card-header-admin"><h3><i class="fa-solid fa-indian-rupee-sign" style="color:#198754;margin-right:.4rem"></i>Pricing</h3></div>
              <div class="card-body-admin">
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem">
                  <div><label class="form-label">Regular Price (₹) *</label><input type="number" class="form-control" placeholder="e.g. 349" required></div>
                  <div><label class="form-label">Discount Price (₹)</label><input type="number" class="form-control" placeholder="e.g. 299"></div>
                </div>
              </div>
            </div>

            <!-- Ingredients -->
            <div class="admin-card">
              <div class="card-header-admin"><h3><i class="fa-solid fa-leaf" style="color:#198754;margin-right:.4rem"></i>Ingredients</h3></div>
              <div class="card-body-admin">
                <label class="form-label">Ingredients (comma separated)</label>
                <input type="text" class="form-control" placeholder="e.g. Mozzarella, Pepperoni, Tomato Sauce, Basil">
              </div>
            </div>
          </div>

          <!-- Right Column -->
          <div style="display:flex;flex-direction:column;gap:1.25rem">
            <!-- Image -->
            <div class="admin-card">
              <div class="card-header-admin"><h3><i class="fa-solid fa-image" style="color:#ff5a1f;margin-right:.4rem"></i>Food Image</h3></div>
              <div class="card-body-admin">
                <div class="img-upload-zone" onclick="document.getElementById('foodImageInput').click()">
                  <i class="fa-solid fa-cloud-arrow-up"></i>
                  <p>Click to upload image<br><span style="font-size:.75rem">JPG, PNG up to 5MB</span></p>
                </div>
                <input type="file" id="foodImageInput" accept="image/*" style="display:none">
              </div>
            </div>

            <!-- Settings -->
            <div class="admin-card">
              <div class="card-header-admin"><h3><i class="fa-solid fa-sliders" style="color:#6f42c1;margin-right:.4rem"></i>Settings</h3></div>
              <div class="card-body-admin">
                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem">
                  <label class="form-label" style="margin:0">Available</label>
                  <div class="form-switch"><input class="form-check-input" type="checkbox" checked></div>
                </div>
                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem">
                  <label class="form-label" style="margin:0">Featured</label>
                  <div class="form-switch"><input class="form-check-input" type="checkbox"></div>
                </div>
                <div><label class="form-label">Rating</label>
                  <select class="form-select"><option>5.0</option><option>4.5</option><option>4.0</option><option>3.5</option><option>3.0</option></select>
                </div>
              </div>
            </div>

            <!-- Actions -->
            <div class="admin-card">
              <div class="card-body-admin" style="display:flex;flex-direction:column;gap:.5rem">
                <button type="submit" class="btn-admin btn-admin-primary" style="width:100%;justify-content:center;padding:.7rem"><i class="fa-solid fa-plus"></i>Add Food Item</button>
                <a href="menu.html" class="btn-admin btn-admin-outline" style="width:100%;justify-content:center;padding:.7rem"><i class="fa-solid fa-times"></i>Cancel</a>
              </div>
            </div>
          </div>
        </div>
      </form>
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
