<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ragister.aspx.cs" Inherits="Online_Food_Odering.Ragister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register | FoodieHub</title>
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!-- MAIN CONTENT START -->


    <main class="container py-5">
        <div class="row justify-content-center align-items-center g-4">
            <div class="col-lg-6 order-lg-2">
                <div class="card form-card p-4">
                    <div class="text-center mb-4">
                        <h2 class="section-title">Create your account</h2>
                        <p class="section-subtitle">Join FoodieHub for faster ordering and exclusive offers.</p>
                    </div>
                    <div class="d-flex gap-2 mb-4 flex-column">
                        <a href="#" class="btn btn-social btn-outline-secondary w-100"><i class="fa-brands fa-google"></i>Continue with Google</a>
                        <a href="#" class="btn btn-social btn-outline-secondary w-100"><i class="fa-brands fa-apple"></i>Continue with Apple</a>
                    </div>
                    <div class="text-center mb-4"><span class="text-muted">or sign up with email</span></div>
                    <div id="registerFormPanel">
                        <div class="row g-3">
                            <%--<div class="col-md-6">
                                <label class="form-label">Full name</label>
                                <input name="name" class="form-control" placeholder="Your name" required />
                                <div class="validation-error" id="registerNameError">Full name is required.</div>

                            </div>--%>

                            <div class="col-md-6">
                                <label class="form-label-custom">Full Name</label>

                                <asp:TextBox
                                    runat="server"
                                    ID="fullName"
                                    ClientIDMode="Static"
                                    TextMode="SingleLine"
                                    CssClass="form-control form-control-custom"
                                    placeholder="Your name"
                                    required="required">
                                </asp:TextBox>

                                <div class="validation-error" id="registerNameError">
                                    Full name is required.
                                </div>
                            </div>

                            <%--                            <div class="col-md-6">
                                <label class="form-label">Email</label>
                                <input name="email" type="email" class="form-control" placeholder="you@example.com" required />
                                <div class="validation-error" id="registerEmailError">Please enter a valid email.</div>
                            </div>--%>

                            <div class="col-md-6">
                                <label class="form-label-custom">Email</label>
                                <asp:TextBox
                                    runat="server"
                                    ID="email"
                                    ClientIDMode="Static"
                                    TextMode="Email"
                                    CssClass="form-control form-control-custom"
                                    placeholder="you@example.com"
                                    required="required">
                                </asp:TextBox>

                                <div class="validation-error" id="registerEmailError">
                                    Please enter a valid email.
   
                                </div>
                            </div>

                            <%-- <div class="col-md-6">
                                <label class="form-label">Mobile number</label>
                                <input name="phone" class="form-control" placeholder="(123) 456-7890" required />
                                <div class="validation-error" id="registerPhoneError">Mobile number is required.</div>
                            </div>--%>


                            <div class="col-md-6">
                                <label class="form-label-custom">Mobile number</label>
                                <asp:TextBox
                                    runat="server"
                                    ID="phone"
                                    ClientIDMode="Static"
                                    TextMode="Phone"
                                    CssClass="form-control form-control-custom"
                                    placeholder="(123) 456-7890"
                                    required="required">
                                </asp:TextBox>

                                <div class="validation-error" id="registerPhoneError">
                                    Mobile number is required.
   
                                </div>
                            </div>

                            <%--                            <div class="col-md-6">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <input id="registerPassword" name="password" type="password" class="form-control" placeholder="Create password" required />
                                    <button class="btn btn-outline-secondary" type="button" data-toggle-password="#registerPassword"><i class="fa-solid fa-eye"></i></button>
                                </div>
                                <div class="validation-error" id="registerPasswordError">Password must be at least 8 characters.</div>
                            </div>--%>


                            <div class="col-md-6">
                                <label class="form-label-custom">Password</label>

                                <div class="input-group">

                                    <asp:TextBox
                                        runat="server"
                                        ID="password"
                                        ClientIDMode="Static"
                                        TextMode="Password"
                                        CssClass="form-control form-control-custom"
                                        placeholder="Create password"
                                        required="required">
                                    </asp:TextBox>

                                    <button
                                        class="btn btn-outline-secondary"
                                        type="button"
                                        data-toggle-password="#password">

                                        <i class="fa-solid fa-eye"></i>

                                    </button>

                                </div>

                                <div class="validation-error" id="registerPasswordError">
                                    Password must be at least 8 characters.
   
                                </div>

                            </div>
                            <div class="form-text text-muted mt-2">Passwords must be at least 8 characters long.</div>

                            <div class="col-md-6">
                                <label class="form-label-custom">Gender</label>

                                <div class="mt-2">
                                    <asp:RadioButton
                                        ID="rbMale"
                                        runat="server"
                                        GroupName="Gender"
                                        Text=" Male"
                                        CssClass="me-3" />

                                    <asp:RadioButton
                                        ID="rbFemale"
                                        runat="server"
                                        GroupName="Gender"
                                        Text=" Female" OnCheckedChanged="rbFemale_CheckedChanged" />
                                </div>
                            </div>

                            <!-- Role -->
                            <div class="col-md-6">
                                <label class="form-label-custom">Role</label>

                                <asp:DropDownList
                                    ID="ddlRole"
                                    runat="server"
                                    CssClass="form-control form-control-custom">

                                    <asp:ListItem Text="Select Role" Value="" />
                                    <asp:ListItem Text="Customer" Value="Customer" />
                                    <asp:ListItem Text="Admin" Value="Admin" />

                                </asp:DropDownList>
                            </div>  

                            <%--  <button class="btn btn-orange w-100 mt-4" type="submit">Register</button>--%>
                            <%--                        <asp:ImageButton ID="ImageButton1" runat="server" />--%>
                            <%-- <asp:Button
                                ID="btnRegister"
                                runat="server"
                                Text="Register"
                                CssClass="btn btn-orange w-100 mt-4"
                                OnClick="btnRegister_Click" />--%>

                            <%--                            <asp:ImageButton ID="registerBtn" runat="server" ClientIDMode="Static" ImageUrl="images/Ragister.jpeg" CssClass="w-100" Style="height: 35px; border-radius: 99px;" OnClick="registerBtn_Click" />--%>
                            <asp:ImageButton
                                ID="registerBtn"
                                runat="server"
                                ClientIDMode="Static"
                                ImageUrl="images/Ragister.jpeg"
                                CssClass="w-100"
                                Style="height: 35px; border-radius: 99px;"
                                OnClick="registerBtn_Click" />

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="313px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobail Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Role">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>'>Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>'>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                        <p class="mt-3 text-center">Already have an account? <a href="Login.aspx" class="text-orange">Login</a></p>
                    </div>
                </div>

                <div class="col-lg-4 order-lg-1">
                    <div class="auth-aside p-4">
                        <div class="mb-4">
                            <span class="badge bg-warning text-dark rounded-pill px-3 py-2">Start ordering faster</span>
                        </div>
                        <h3 class="mb-3">Personalized dining starts here</h3>
                        <p class="text-muted">Create an account to save your delivery preferences, access deals, and check out in just a few clicks.</p>
                        <ul class="list-unstyled mt-4">
                            <li class="mb-3"><i class="fa-solid fa-check text-warning me-2"></i>Exclusive member rewards</li>
                            <li class="mb-3"><i class="fa-solid fa-check text-warning me-2"></i>Saved addresses and payment details</li>
                            <li class="mb-3"><i class="fa-solid fa-check text-warning me-2"></i>One-tap reorder</li>
                        </ul>
                        <div class="mt-4 text-muted small">
                            By creating an account, you agree to our <a href="#" class="text-orange">Terms of Service</a> and <a href="#" class="text-orange">Privacy Policy</a>.
                        </div>
                    </div>
                </div>
            </div>
    </main>

    <!-- MAIN CONTENT END -->
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

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
