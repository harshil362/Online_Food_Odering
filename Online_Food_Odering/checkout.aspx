<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Online_Food_Odering.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Checkout | FoodieHub</title>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main class="container py-5">
        <div class="page-hero-card mb-4">
            <div class="row align-items-center gy-4">
                <div class="col-lg-8">
                    <h1 class="section-title mb-1">Secure Checkout</h1>
                    <p class="section-subtitle">Complete your order with confidence. We keep your information safe and your delivery fast.</p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <span class="badge badge-soft rounded-pill px-3 py-2">Secure Checkout</span>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-lg-7">
                <div class="card form-card p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="section-title mb-1">Billing Details</h2>
                            <p class="section-subtitle mb-0">Enter the delivery information and choose a payment option.</p>
                        </div>
                        <span class="text-orange">Step 1 of 2</span>
                    </div>
                    <form id="checkoutForm" novalidate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Customer Name</label>
                                <input class="form-control" placeholder="John Doe" required />
                                <div class="validation-error">Customer name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Mobile Number</label>
                                <input class="form-control" placeholder="+1 234 567 890" required />
                                <div class="validation-error">Mobile number is required.</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Delivery Address</label>
                                <textarea class="form-control" rows="3" placeholder="Street, building, apartment" required></textarea>
                                <div class="validation-error">Delivery address is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">City</label>
                                <input class="form-control" placeholder="New York" required />
                                <div class="validation-error">City is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Pincode</label>
                                <input class="form-control" placeholder="10001" required />
                                <div class="validation-error">Pincode is required.</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Payment Method</label>
                                <div class="d-flex flex-wrap gap-2">
                                    <label class="payment-option btn btn-outline-orange w-100 w-md-auto active">
                                        <input type="radio" name="paymentMethod" value="Cash on Delivery" checked hidden />
                                        <i class="fa-solid fa-money-bill-wave me-2"></i>Cash on Delivery
                                    </label>
                                    <label class="payment-option btn btn-outline-orange w-100 w-md-auto">
                                        <input type="radio" name="paymentMethod" value="Credit Card" hidden />
                                        <i class="fa-solid fa-credit-card me-2"></i>Credit Card
                                    </label>
                                    <label class="payment-option btn btn-outline-orange w-100 w-md-auto">
                                        <input type="radio" name="paymentMethod" value="UPI" hidden />
                                        <i class="fa-solid fa-mobile-screen-button me-2"></i>UPI
                                    </label>
                                </div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Promo Code</label>
                                <div class="input-group">
                                    <input class="form-control" placeholder="FOODIE10" />
                                    <button class="btn btn-outline-orange" type="button">Apply</button>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-orange mt-4" type="submit">Place Order</button>
                    </form>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="card form-card p-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <h4 class="fw-bold mb-1">Order Summary</h4>
                            <p class="cart-summary-note mb-0">Review the order and delivery cost before placing your order.</p>
                        </div>
                        <span id="checkoutItemCount" class="badge badge-soft rounded-pill">0 items</span>
                    </div>
                    <div class="order-summary-item d-flex justify-content-between py-3 border-bottom">
                        <span>Subtotal</span>
                        <span id="checkoutSubtotal">$0.00</span>
                    </div>
                    <div class="order-summary-item d-flex justify-content-between py-3 border-bottom">
                        <span>Delivery</span>
                        <span id="checkoutDelivery">$0.00</span>
                    </div>
                    <div class="order-summary-item d-flex justify-content-between py-3 border-bottom">
                        <span>Service fee</span>
                        <span id="checkoutServiceFee">$0.00</span>
                    </div>
                    <div class="d-flex justify-content-between fw-bold fs-5 pt-3">
                        <span>Total</span>
                        <span id="checkoutTotal">$0.00</span>
                    </div>
                    <div id="checkoutNote" class="text-center text-warning small mb-3">Add items to your cart to see delivery savings.</div>
                    <div class="secure-note mt-4 p-3 rounded-3 bg-light text-muted">
                        <i class="fa-solid fa-lock text-success me-2"></i>Secure payment confirmed with SSL encryption.
                    </div>
                    <div class="mt-4">
                        <h6 class="mb-3">Need help?</h6>
                        <p class="small text-muted mb-1"><i class="fa-solid fa-headset me-2"></i>Support available 24/7</p>
                        <p class="small text-muted mb-0"><i class="fa-solid fa-clock me-2"></i>Typical delivery in 25-30 minutes</p>
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
