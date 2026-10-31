<%@ Page Title="Add Category | FoodieHub Admin"
    Language="C#"
    MasterPageFile="~/admin/Admin_Site2.Master"
    AutoEventWireup="true"
    CodeBehind="add-categories.aspx.cs"
    Inherits="Online_Food_Odering.admin.add_categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin.css?v=3" />
    <link rel="stylesheet" href="css/responsive.css?v=3" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="admin-main">
        <div class="admin-content">
            <div class="page-header">
                <div>
                    <h1>Add Category</h1>
                    <div class="breadcrumb-nav">
                        <a href="dashboard.aspx">Dashboard</a> / <a href="categories.aspx">Categories</a> / Add Category
                    </div>
                </div>
            </div>

            <div class="admin-form">
                <div style="display:grid;grid-template-columns:2fr 1fr;gap:1.25rem">
                    <!-- Left Column -->
                    <div style="display:flex;flex-direction:column;gap:1.25rem">
                        <!-- Basic Info Card -->
                        <div class="admin-card">
                            <div class="card-header-admin">
                                <h3><i class="fa-solid fa-layer-group" style="color:#ff5a1f;margin-right:.4rem"></i>Basic Information</h3>
                            </div>
                            <div class="card-body-admin">
                                <div style="margin-bottom:1rem">
                                    <label class="form-label">Category Name *</label>
                                    <asp:TextBox
                                        ID="txtCategoryName"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="e.g. Pizza"
                                        required="required">
                                    </asp:TextBox>
                                </div>
                                <div>
                                    <label class="form-label">Description</label>
                                    <asp:TextBox
                                        ID="txtCategoryDescription"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="MultiLine"
                                        Rows="4"
                                        placeholder="Describe this category...">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Image Card -->
                        <div class="admin-card">
                            <div class="card-header-admin">
                                <h3><i class="fa-solid fa-image" style="color:#ff5a1f;margin-right:.4rem"></i>Category Image</h3>
                            </div>
                            <div class="card-body-admin">
                                <div class="img-upload-zone" onclick="document.getElementById('<%= fuCategoryImage.ClientID %>').click()">
                                    <i class="fa-solid fa-cloud-arrow-up"></i>
                                    <p>Click to upload category image<br><span style="font-size:.75rem">JPG, JPEG, PNG up to 5MB</span></p>
                                </div>
                                <asp:FileUpload ID="fuCategoryImage" runat="server" style="display:none" onchange="previewCatImg(this)" />
                                <div id="catImgPreview" style="margin-top:1rem;display:none;align-items:center;gap:.75rem">
                                    <img id="catImgThumb" src="" alt="Preview" style="width:56px;height:56px;border-radius:.5rem;object-fit:cover" />
                                    <div>
                                        <div id="catImgName" style="font-size:.85rem;font-weight:600"></div>
                                        <div style="font-size:.72rem;color:#6c757d">Ready to upload</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div style="display:flex;flex-direction:column;gap:1.25rem">
                        <!-- Settings Card -->
                        <div class="admin-card">
                            <div class="card-header-admin">
                                <h3><i class="fa-solid fa-sliders" style="color:#6f42c1;margin-right:.4rem"></i>Settings</h3>
                            </div>
                            <div class="card-body-admin">
                                <div style="display:flex;justify-content:space-between;align-items:center">
                                    <div>
                                        <label class="form-label" style="margin:0">Available</label>
                                        <div style="font-size:.75rem;color:#6c757d">Show this category on menu</div>
                                    </div>
                                    <div class="form-switch">
                                        <asp:CheckBox ID="chkAvailable" runat="server" Checked="true" CssClass="form-check-input" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Actions Card -->
                        <div class="admin-card">
                            <div class="card-body-admin" style="display:flex;flex-direction:column;gap:.5rem">
                                <asp:Button
                                    ID="btnSaveCategory"
                                    runat="server"
                                    Text="Add Category"
                                    CssClass="btn-admin btn-admin-primary"
                                    style="width:100%;justify-content:center;padding:.7rem"
                                    OnClick="btnSaveCategory_Click" />
                                <asp:HyperLink
                                    ID="btnCancel"
                                    runat="server"
                                    NavigateUrl="categories.aspx"
                                    CssClass="btn-admin btn-admin-outline"
                                    style="width:100%;justify-content:center;padding:.7rem">
                                    <i class="fa-solid fa-times"></i>Cancel
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div id="adminToast" class="admin-toast"></div>
    <script src="js/admin.js"></script>
    <script>
        // Image preview handler
        function previewCatImg(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('catImgThumb').src = e.target.result;
                    document.getElementById('catImgName').textContent = input.files[0].name;
                    document.getElementById('catImgPreview').style.display = 'flex';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Highlight active category in sidebar
        document.addEventListener("DOMContentLoaded", function () {
            var items = document.querySelectorAll('.sidebar-nav .nav-item');
            items.forEach(function (el) {
                if (el.getAttribute('href') === 'categories.aspx') {
                    items.forEach(function (n) { n.classList.remove('active'); });
                    el.classList.add('active');
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>