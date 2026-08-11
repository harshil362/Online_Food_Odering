<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Online_Food_Odering.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cart | FoodieHub</title>
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <!-- HEADER END -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="index.html">
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
                    <li class="nav-item"><a class="nav-link active" href="menu.aspx">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.aspx">Contact</a></li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <a class="nav-link position-relative" href="cart.html">
                        <i class="fa-solid fa-shopping-cart fa-lg"></i>
                        <span class="cart-badge">0</span>
                    </a>
                    <div id="authAction"></div>
                </div>
            </div>
        </div>
    </nav>
    <!-- HEADER END -->
    <!-- MAIN CONTENT START -->


    <main class="container py-5">
        <div class="row g-4">
            <div class="col-lg-8">
                <div class="card form-card p-4">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-4">
                        <div>
                            <h2 class="section-title mb-1">Your Cart</h2>
                            <p class="cart-summary-note mb-0">Review your items and adjust quantities before checkout.</p>
                        </div>
                        <a href="menu.html" class="btn btn-outline-orange">Continue Shopping</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table cart-table align-middle">
                            <thead>
                                <tr>
                                    <th scope="col">Item</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Subtotal</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="cartItems"></tbody>
                        </table>
                    </div>
                    <div class="alert alert-info mt-4 mb-0 rounded-4" role="alert">
                        <strong>Tip:</strong> Add items worth $30.00 more for free delivery.
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card form-card p-4 sticky-top" style="top: 1rem;">
                    <h4 class="fw-bold">Order Summary</h4>
                    <p class="cart-summary-note mb-3">Update your cart and proceed when ready.</p>
                    <div class="d-flex justify-content-between align-items-center mb-2"><span>Subtotal</span><span id="subtotal">$0.00</span></div>
                    <div class="d-flex justify-content-between align-items-center mb-2"><span>Delivery fee</span><span id="deliveryFee">$2.50</span></div>
                    <div class="d-flex justify-content-between align-items-center mb-3"><span>Service fee</span><span>$0.00</span></div>
                    <hr />
                    <div class="d-flex justify-content-between fw-bold fs-5 mb-3"><span>Total</span><span id="total">$0.00</span></div>
                    <div id="deliveryNote" class="text-center text-warning small mb-3">Add items worth $30.00 more for free delivery.</div>
                    <a href="checkout.html" class="btn btn-orange w-100 mb-3">Proceed to Checkout</a>
                    <div class="text-center text-muted small">Secure payment and fast delivery on every order.</div>
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
                        <a href="index.html">Home</a>
                        <a href="menu.html">Our Menu</a>
                        <a href="about.html">About Us</a>
                        <a href="contact.html">Contact</a>
                        <a href="cart.html">My Cart</a>
                        <a href="account.html">My Account</a>
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
