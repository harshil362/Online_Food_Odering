<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Food_Odering.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | FoodieHub</title>
  <link rel="icon" type="image/png" href="images/favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
  <!-- HEADER START -->

    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
      <div class="container">
        <a class="navbar-brand d-flex align-items-center gap-2" href="index.aspx">
          <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" alt="FoodieHub logo" class="brand-logo" />
          <div class="brand-text">
            <span class="brand-name">FoodieHub</span>
            <span class="brand-tagline">Fresh meals, fast delivery</span>
          </div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarMenu">
          <ul class="navbar-nav mx-auto mb-2 mb-lg-0 gap-lg-3">
            <li class="nav-item"><a class="nav-link" href="index.aspx">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="menu.aspx">Menu</a></li>
            <li class="nav-item"><a class="nav-link" href="about.aspx">About</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.aspx">Contact</a></li>
          </ul>
            <div id="authAction"></div>
        </div>
      </div>
    </nav>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <main class="container py-5">
      <div class="row justify-content-center align-items-center g-4">
        <div class="col-lg-5 order-lg-2">
          <div class="card form-card p-4">
            <div class="text-center mb-4">
              <h2 class="section-title">Welcome back</h2>
              <p class="section-subtitle">Sign in to continue your FoodieHub experience.</p>
            </div>
            <div class="d-flex gap-2 mb-4 flex-column">
              <a href="#" class="btn btn-social btn-outline-secondary w-100"><i class="fa-brands fa-google"></i>Continue with Google</a>
              <a href="#" class="btn btn-social btn-outline-secondary w-100"><i class="fa-brands fa-apple"></i>Continue with Apple</a>
            </div>
            <div class="text-center mb-4"><span class="text-muted">or sign in with email</span></div>
            <form id="loginForm" novalidate>
              <div class="mb-3">
                <label class="form-label">Email address</label>
                <input name="email" type="email" class="form-control" placeholder="you@example.com" required />
                <div class="validation-error" id="loginEmailError">Please enter a valid email.</div>
              </div>
              <div class="mb-3">
                <label class="form-label">Password</label>
                <div class="input-group">
                  <input id="loginPassword" name="password" type="password" class="form-control" placeholder="Enter password" required />
                  <button class="btn btn-outline-secondary" type="button" data-toggle-password="#loginPassword"><i class="fa-solid fa-eye"></i></button>
                </div>
                <div class="validation-error" id="loginPasswordError">Password is required.</div>
              </div>
              <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="rememberMe" />
                  <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>
                <a href="#" class="text-orange">Forgot password?</a>
              </div>
              <button class="btn btn-orange w-100" type="submit">Login</button>
            </form>
            <p class="mt-3 text-center">New here? <a href="register.aspx" class="text-orange">Create an account</a></p>
            <p class="mt-2 text-center" style="font-size:.82rem;color:#6c757d">
              <i class="fa-solid fa-shield-halved" style="margin-right:.3rem"></i>Are you an administrator?
              <a href="admin/login.aspx" class="text-orange" style="font-weight:600">Admin Login</a>
            </p>
          </div>
        </div>
        <div class="col-lg-5 order-lg-1">
          <div class="auth-aside p-4">
            <div class="mb-4">
              <span class="badge bg-warning text-dark rounded-pill px-3 py-2">Welcome back</span>
            </div>
            <h3 class="mb-3">Get back to your favorites</h3>
            <p class="text-muted">Login to access saved orders, exclusive deals, and lightning-fast checkout across our menu.</p>
            <ul class="list-unstyled mt-4">
              <li class="mb-3"><i class="fa-solid fa-check text-warning me-2"></i>Saved favorites and order history</li>
              <li class="mb-3"><i class="fa-solid fa-check text-warning me-2"></i>Secure payment and easy checkout</li>
              <li class="mb-3"><i class="fa-solid fa-check text-warning me-2"></i>Personalized meal recommendations</li>
            </ul>
            <div class="mt-4">
              <p class="text-muted small mb-2">Need help?</p>
              <p class="mb-0"><i class="fa-solid fa-envelope me-2"></i>support@foodiehub.com</p>
            </div>
          </div>
        </div>
      </div>
    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <footer class="footer">
    <div class="container footer-main">
      <div class="row g-4 g-lg-5">
        <div class="col-lg-4 col-md-6">
          <div class="d-flex align-items-center gap-2 mb-2">
            <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=150&q=80" alt="FoodieHub" class="footer-brand-logo" />
            <span class="footer-brand-name">FoodieHub</span>
          </div>
          <p class="footer-brand-desc">Delivering happiness one meal at a time. Fresh ingredients, handcrafted recipes, and lightning-fast delivery to your doorstep.</p>
          <div class="footer-social">
            <a href="#" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
            <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
            <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
            <a href="#" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
          </div>
        </div>
        <div class="col-lg-2 col-md-6 col-6">
          <h5>Quick Links</h5>
          <div class="footer-links">
            <a href="index.aspx">Home</a>
            <a href="admin/menu.aspx">Our Menu</a>
            <a href="about.aspx">About Us</a>
            <a href="contact.aspx">Contact</a>
            <a href="cart.aspx">My Cart</a>
            <a href="account.aspx">My Account</a>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-6">
          <h5>Contact Us</h5>
          <div class="footer-contact-item">
            <span class="footer-contact-icon"><i class="fa-solid fa-location-dot"></i></span>
            <div class="footer-contact-text"><span>Address</span>123 Food Street, New York, NY 10001</div>
          </div>
          <div class="footer-contact-item">
            <span class="footer-contact-icon"><i class="fa-solid fa-phone"></i></span>
            <div class="footer-contact-text"><span>Phone</span>+1 234 567 890</div>
          </div>
          <div class="footer-contact-item">
            <span class="footer-contact-icon"><i class="fa-solid fa-envelope"></i></span>
            <div class="footer-contact-text"><span>Email</span>support@foodiehub.com</div>
          </div>
          <div class="footer-contact-item">
            <span class="footer-contact-icon"><i class="fa-solid fa-clock"></i></span>
            <div class="footer-contact-text"><span>Hours</span>Daily 8:00 AM – 11:00 PM</div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <h5>Newsletter</h5>
          <div class="footer-newsletter">
            <p>Subscribe for new menu items, exclusive offers, and seasonal specials.</p>
            <form class="d-flex flex-column gap-2" onsubmit="event.preventDefault(); showToast('Thanks for subscribing!');">
              <input type="email" class="form-control" placeholder="Your email address" required />
              <button class="btn btn-orange w-100" type="submit"><i class="fa-solid fa-paper-plane me-2"></i>Subscribe</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <hr class="footer-divider" />
    <div class="footer-bottom">
      <div class="container d-flex flex-wrap justify-content-between align-items-center">
        <p class="mb-0">© 2026 FoodieHub. All rights reserved.</p>
        <div class="d-flex align-items-center gap-3">
          <a href="#">Privacy Policy</a>
          <a href="#">Terms of Service</a>
        </div>
        <div class="footer-payment-methods">
          <i class="fa-brands fa-cc-visa"></i>
          <i class="fa-brands fa-cc-mastercard"></i>
          <i class="fa-brands fa-cc-paypal"></i>
          <i class="fa-brands fa-cc-apple-pay"></i>
          <i class="fa-brands fa-google-pay"></i>
        </div>
      </div>
    </div>
    </footer>
  <!-- FOOTER END -->

    <div id="toastMessage" class="toast align-items-center text-bg-dark border-0 position-fixed bottom-0 end-0 m-3" role="status"></div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
