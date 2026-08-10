const foodItems = [
  {
    id: 1,
    name: 'Pepperoni Pizza',
    category: 'Pizza',
    price: 12.99,
    rating: 4.8,
    description: 'Classic pizza topped with spicy pepperoni and mozzarella.',
    ingredients: ['Mozzarella', 'Pepperoni', 'Tomato Sauce', 'Basil'],
    image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 2,
    name: 'Smoky Burger',
    category: 'Burger',
    price: 8.49,
    rating: 4.6,
    description: 'Double patty burger with smoky sauce and crunchy lettuce.',
    ingredients: ['Beef Patty', 'Cheese', 'Lettuce', 'Bun'],
    image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 3,
    name: 'Hyderabadi Biryani',
    category: 'Biryani',
    price: 10.99,
    rating: 4.9,
    description: 'Fragrant rice layered with spiced vegetables and herbs.',
    ingredients: ['Basmati Rice', 'Spices', 'Coriander', 'Onion'],
    image: 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 4,
    name: 'Hot Noodles',
    category: 'Chinese',
    price: 7.99,
    rating: 4.5,
    description: 'Wok-tossed noodles with crisp veggies and rich sauce.',
    ingredients: ['Noodles', 'Capsicum', 'Soy Sauce', 'Garlic'],
    image: 'https://images.unsplash.com/photo-1526318896980-cf78c088247c?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 5,
    name: 'Club Sandwich',
    category: 'Sandwich',
    price: 6.99,
    rating: 4.4,
    description: 'Layered sandwich with chicken, lettuce and tomato.',
    ingredients: ['Bread', 'Chicken', 'Tomato', 'Lettuce'],
    image: 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 6,
    name: 'Berry Smoothie',
    category: 'Drinks',
    price: 4.49,
    rating: 4.7,
    description: 'Refreshing smoothie with sweet berries and yogurt.',
    ingredients: ['Berries', 'Yogurt', 'Honey', 'Ice'],
    image: 'https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 7,
    name: 'Chocolate Lava',
    category: 'Desserts',
    price: 5.49,
    rating: 4.8,
    description: 'Warm chocolate cake with a gooey molten center.',
    ingredients: ['Chocolate', 'Butter', 'Sugar', 'Cream'],
    image: 'https://images.unsplash.com/photo-1621303837174-89787a7d4729?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 8,
    name: 'Mango Lassi',
    category: 'Drinks',
    price: 3.99,
    rating: 4.7,
    description: 'Smooth mango yogurt drink with honey and cardamom.',
    ingredients: ['Mango', 'Yogurt', 'Honey', 'Cardamom'],
    image: 'https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 9,
    name: 'Veggie Wrap',
    category: 'Sandwich',
    price: 6.49,
    rating: 4.5,
    description: 'Grilled veggies wrapped in a soft tortilla with fresh greens.',
    ingredients: ['Tortilla', 'Avocado', 'Bell Pepper', 'Spinach'],
    image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 10,
    name: 'Garlic Noodles',
    category: 'Chinese',
    price: 7.99,
    rating: 4.6,
    description: 'Savory noodles tossed with garlic, soy sauce, and fresh scallions.',
    ingredients: ['Noodles', 'Garlic', 'Soy Sauce', 'Scallions'],
    image: 'https://images.unsplash.com/photo-1553621042-f6e147245754?auto=format&fit=crop&w=900&q=80'
  },
  {
    id: 11,
    name: 'Margherita Pizza',
    category: 'Pizza',
    price: 11.49,
    rating: 4.7,
    description: 'Classic pizza with fresh basil, mozzarella, and tomato sauce.',
    ingredients: ['Mozzarella', 'Basil', 'Tomato Sauce', 'Olive Oil'],
    image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=900&q=80'
  },

];

let cart = JSON.parse(localStorage.getItem('foodCart') || '[]');

function saveCart() {
  localStorage.setItem('foodCart', JSON.stringify(cart));
}

function getCartCount() {
  return cart.reduce((sum, item) => sum + item.quantity, 0);
}

function updateCartBadge() {
  const badge = document.querySelector('.cart-badge');
  if (badge) {
    badge.textContent = getCartCount();
  }
}

function addToCart(id) {
  const item = foodItems.find((food) => food.id === id);
  if (!item) return;
  const existing = cart.find((entry) => entry.id === id);
  if (existing) {
    existing.quantity += 1;
  } else {
    cart.push({ ...item, quantity: 1 });
  }
  saveCart();
  updateCartBadge();
  showToast(`${item.name} added to cart`);
}

function removeFromCart(id) {
  cart = cart.filter((entry) => entry.id !== id);
  saveCart();
  renderCart();
  updateCartBadge();
}

function changeQuantity(id, delta) {
  const entry = cart.find((item) => item.id === id);
  if (!entry) return;
  entry.quantity = Math.max(1, entry.quantity + delta);
  saveCart();
  renderCart();
  updateCartBadge();
}

function getSubtotal() {
  return cart.reduce((sum, item) => sum + item.price * item.quantity, 0);
}

function renderMenu() {
  const grid = document.querySelector('#menuGrid');
  const searchInput = document.querySelector('#menuSearch');
  const categorySelect = document.querySelector('#categoryFilter');
  if (!grid) return;

  const search = (searchInput?.value || '').trim().toLowerCase();
  const category = categorySelect?.value || 'All';

  const filtered = foodItems.filter((item) => {
    const matchesSearch = item.name.toLowerCase().includes(search) || item.description.toLowerCase().includes(search);
    const matchesCategory = category === 'All' || item.category === category;
    return matchesSearch && matchesCategory;
  });

  grid.innerHTML = filtered.map((item) => `
    <div class="col-lg-4 col-md-6">
      <div class="card food-card h-100">
        <img src="${item.image}" class="card-img-top" alt="${item.name}" onerror="this.onerror=null;this.src='https://via.placeholder.com/900x600?text=Food+Image';">
        <div class="card-body d-flex flex-column">
          <div class="d-flex justify-content-between align-items-start gap-2">
            <h5 class="card-title mb-1">${item.name}</h5>
            <span class="badge badge-soft rounded-pill">★ ${item.rating}</span>
          </div>
          <p class="card-text text-muted small">${item.description}</p>
          <div class="d-flex justify-content-between align-items-center mt-auto">
            <span class="price-pill">$${item.price.toFixed(2)}</span>
            <div class="d-flex gap-2">
              <a href="food-details.html?id=${item.id}" class="btn btn-outline-orange btn-sm">View</a>
              <button class="btn btn-orange btn-sm" onclick="addToCart(${item.id})">Add</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  `).join('');
}

function renderCart() {
  const container = document.querySelector('#cartItems');
  const subtotalEl = document.querySelector('#subtotal');
  const totalEl = document.querySelector('#total');
  if (!container || !subtotalEl || !totalEl) return;

  if (!cart.length) {
    container.innerHTML = `
      <tr>
        <td colspan="5" class="text-center py-5">
          <div class="empty-cart-message">
            <p class="h5 mb-3">Your cart is empty</p>
            <p class="text-muted mb-3">Browse the menu and add something delicious to your order.</p>
            <a href="menu.html" class="btn btn-orange">Browse menu</a>
          </div>
        </td>
      </tr>
    `;
    subtotalEl.textContent = '$0.00';
    totalEl.textContent = '$0.00';
    return;
  }

  container.innerHTML = cart.map((item) => `
    <tr>
      <td>
        <div class="d-flex align-items-center gap-3">
          <img src="${item.image}" alt="${item.name}">
          <div>
            <h6 class="mb-1">${item.name}</h6>
            <p class="text-muted small mb-0">${item.category}</p>
          </div>
        </div>
      </td>
      <td>$${item.price.toFixed(2)}</td>
      <td>
        <div class="d-flex align-items-center gap-2">
          <button class="btn btn-outline-orange btn-sm qty-btn" onclick="changeQuantity(${item.id}, -1)">-</button>
          <span>${item.quantity}</span>
          <button class="btn btn-orange btn-sm qty-btn" onclick="changeQuantity(${item.id}, 1)">+</button>
        </div>
      </td>
      <td>$${(item.price * item.quantity).toFixed(2)}</td>
      <td><button class="btn btn-outline-danger btn-sm" onclick="removeFromCart(${item.id})">Remove</button></td>
    </tr>
  `).join('');

  const subtotal = getSubtotal();
  const delivery = subtotal >= 30 ? 0 : 2.5;
  const total = subtotal + delivery;
  const deliveryEl = document.querySelector('#deliveryFee');
  const deliveryNote = document.querySelector('#deliveryNote');

  subtotalEl.textContent = `$${subtotal.toFixed(2)}`;
  if (deliveryEl) deliveryEl.textContent = `$${delivery.toFixed(2)}`;
  totalEl.textContent = `$${total.toFixed(2)}`;

  if (deliveryNote) {
    if (subtotal >= 30 && subtotal > 0) {
      deliveryNote.textContent = 'Great news! You qualify for free delivery.';
      deliveryNote.classList.remove('text-warning');
      deliveryNote.classList.add('text-success');
    } else if (subtotal > 0) {
      const remaining = (30 - subtotal).toFixed(2);
      deliveryNote.textContent = `Add $${remaining} more for free delivery.`;
      deliveryNote.classList.remove('text-success');
      deliveryNote.classList.add('text-warning');
    } else {
      deliveryNote.textContent = 'Add items to your cart to see delivery savings.';
      deliveryNote.classList.remove('text-success', 'text-warning');
    }
  }
}

function showFoodDetails() {
  const details = document.querySelector('#foodDetails');
  const params = new URLSearchParams(window.location.search);
  const id = Number(params.get('id'));
  const item = foodItems.find((food) => food.id === id);
  if (!details || !item) return;

  details.innerHTML = `
    <div class="row g-4 align-items-center">
      <div class="col-lg-6">
        <img src="${item.image}" class="img-fluid rounded-4 hero-image" alt="${item.name}">
      </div>
      <div class="col-lg-6">
        <span class="badge badge-soft rounded-pill mb-3">${item.category}</span>
        <h1 class="display-6 fw-bold">${item.name}</h1>
        <p class="text-muted">${item.description}</p>
        <p><strong>Ingredients:</strong> ${item.ingredients.join(', ')}</p>
        <p class="price-pill fs-4">$${item.price.toFixed(2)}</p>
        <div class="qty-selector mb-4">
          <button class="qty-selector-btn qty-decrease" onclick="adjustQty(-1)" aria-label="Decrease quantity">
            <i class="fa-solid fa-minus"></i>
          </button>
          <span id="qtyValue" class="qty-selector-value">1</span>
          <button class="qty-selector-btn qty-increase" onclick="adjustQty(1)" aria-label="Increase quantity">
            <i class="fa-solid fa-plus"></i>
          </button>
        </div>
        <button class="btn btn-orange btn-lg" onclick="addQtyToCart(${item.id})"><i class="fa-solid fa-cart-plus me-2"></i>Add to Cart</button>
      </div>
    </div>
  `;
}

let qty = 1;
function adjustQty(delta) {
  qty = Math.max(1, qty + delta);
  const value = document.querySelector('#qtyValue');
  if (value) value.textContent = qty;
}

function addQtyToCart(id) {
  const item = foodItems.find((food) => food.id === id);
  if (!item) return;
  const existing = cart.find((entry) => entry.id === id);
  if (existing) {
    existing.quantity += qty;
  } else {
    cart.push({ ...item, quantity: qty });
  }
  saveCart();
  updateCartBadge();
  showToast(`${item.name} added to cart`);
  qty = 1;
  const value = document.querySelector('#qtyValue');
  if (value) value.textContent = qty;
}

function showToast(message) {
  const toast = document.querySelector('#toastMessage');
  if (!toast) return;
  toast.textContent = message;
  toast.classList.add('show');
  setTimeout(() => toast.classList.remove('show'), 1800);
}

function getUsers() {
  return JSON.parse(localStorage.getItem('foodieHubUsers') || '[]');
}

function saveUsers(users) {
  localStorage.setItem('foodieHubUsers', JSON.stringify(users));
}

function getCurrentUser() {
  return JSON.parse(localStorage.getItem('foodieHubUser') || 'null');
}

function setCurrentUser(user) {
  localStorage.setItem('foodieHubUser', JSON.stringify(user));
}

function logoutUser() {
  localStorage.removeItem('foodieHubUser');
  window.location.href = 'login.html';
}

function renderAuthHeader() {
  const authAction = document.querySelector('#authAction');
  if (!authAction) return;

  const user = getCurrentUser();
  if (!user) {
    authAction.innerHTML = `<a class="btn btn-outline-orange" href="login.html">Login</a>`;
    return;
  }

  authAction.innerHTML = `
    <div class="dropdown">
      <button class="btn btn-outline-orange dropdown-toggle" type="button" id="profileMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        ${user.name || 'Profile'}
      </button>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileMenuButton">
        <li><a class="dropdown-item" href="account.html">Profile</a></li>
        <li><a class="dropdown-item" href="cart.html">My Cart</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><button class="dropdown-item text-danger" type="button" id="logoutButton">Logout</button></li>
      </ul>
    </div>
  `;

  const logoutBtn = authAction.querySelector('#logoutButton');
  if (logoutBtn) {
    logoutBtn.addEventListener('click', logoutUser);
  }
}

/* ── Real-time field validation helper ── */
function validateField(input, customRule) {
  const value = input.value.trim();
  let isValid = true;

  if (customRule) {
    isValid = customRule(value);
  } else if (input.hasAttribute('required')) {
    isValid = value.length > 0;
  }

  // Also check email format
  if (isValid && input.type === 'email' && value.length > 0) {
    isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }

  const errorDiv = input.closest('.mb-3, .col-md-6, .col-12')?.querySelector('.validation-error');

  if (!isValid) {
    input.classList.add('is-invalid');
    input.classList.remove('is-valid');
    if (errorDiv) errorDiv.classList.add('show');
  } else {
    input.classList.remove('is-invalid');
    input.classList.add('is-valid');
    if (errorDiv) errorDiv.classList.remove('show');
  }

  return isValid;
}

function attachLiveValidation(form, rules) {
  const fields = form.querySelectorAll('input[required], textarea[required], select[required]');
  fields.forEach((field) => {
    const rule = rules?.[field.name] || null;
    field.addEventListener('input', () => validateField(field, rule));
    field.addEventListener('blur', () => validateField(field, rule));
  });
}

function setupLoginForm() {
  const form = document.querySelector('#loginForm');
  if (!form) return;

  // Attach real-time validation
  attachLiveValidation(form);

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const emailInput = form.querySelector('input[name="email"]');
    const passwordInput = form.querySelector('input[name="password"]');
    const requiredInputs = [emailInput, passwordInput];
    let valid = true;

    requiredInputs.forEach((input) => {
      if (!validateField(input)) {
        valid = false;
      }
    });

    if (!valid) {
      showToast('Please fill in your email and password.');
      return;
    }

    const email = emailInput.value.trim();
    const password = passwordInput.value.trim();
    const users = getUsers();
    const user = users.find((item) => item.email.toLowerCase() === email.toLowerCase() && item.password === password);
    if (!user) {
      showToast('Invalid email or password.');
      return;
    }

    setCurrentUser({
      name: user.name,
      email: user.email,
      phone: user.phone,
      registeredAt: user.registeredAt || new Date().toISOString()
    });
    showToast('Login successful! Redirecting...');
    setTimeout(() => {
      window.location.href = 'account.html';
    }, 1100);
  });
}

function setupRegisterForm() {
  const form = document.querySelector('#registerForm');
  if (!form) return;

  // Attach real-time validation with custom password rule
  attachLiveValidation(form, {
    password: (value) => value.length >= 8
  });

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const nameInput = form.querySelector('input[name="name"]');
    const emailInput = form.querySelector('input[name="email"]');
    const phoneInput = form.querySelector('input[name="phone"]');
    const passwordInput = form.querySelector('input[name="password"]');

    const requiredInputs = [nameInput, emailInput, phoneInput];
    let valid = true;

    requiredInputs.forEach((input) => {
      if (!validateField(input)) {
        valid = false;
      }
    });

    // Password custom check: at least 8 characters
    if (!validateField(passwordInput, (v) => v.length >= 8)) {
      valid = false;
    }

    if (!valid) {
      showToast('Please complete all required fields.');
      return;
    }

    const name = nameInput.value.trim();
    const email = emailInput.value.trim();
    const phone = phoneInput.value.trim();
    const password = passwordInput.value.trim();
    const users = getUsers();

    if (users.some((user) => user.email.toLowerCase() === email.toLowerCase())) {
      showToast('An account with this email already exists.');
      return;
    }

    users.push({ name, email, phone, password, registeredAt: new Date().toISOString() });
    saveUsers(users);
    showToast('Registration successful! Redirecting to login...');
    setTimeout(() => {
      window.location.href = 'login.html';
    }, 1100);
  });
}

function renderAccountPage() {
  const user = getCurrentUser();
  const accountNameHeading = document.querySelector('#accountNameHeading');
  const accountNameProfile = document.querySelector('#accountNameProfile');
  if (!accountNameHeading || !accountNameProfile) return;

  if (!user) {
    window.location.href = 'login.html';
    return;
  }

  const emailEl = document.querySelector('#accountEmail');
  const phoneEl = document.querySelector('#accountPhone');
  const memberSinceEl = document.querySelector('#accountMemberSince');
  const memberSinceSmallEl = document.querySelector('#accountMemberSinceSmall');
  const orderCountEl = document.querySelector('#orderCount');
  const addressEl = document.querySelector('#accountAddress');
  const paymentMethodEl = document.querySelector('#paymentMethod');
  const ordersEl = document.querySelector('#recentOrders');
  const logoutBtn = document.querySelector('#logoutButton');

  const accountDisplayName = user.name || 'FoodieHub member';
  accountNameHeading.textContent = accountDisplayName;
  accountNameProfile.textContent = accountDisplayName;
  if (emailEl) emailEl.textContent = user.email || 'No email available';
  if (phoneEl) phoneEl.textContent = user.phone || 'No phone number';

  const memberSinceText = user.memberSince || (user.registeredAt ? new Date(user.registeredAt).toLocaleDateString() : 'Just joined');
  if (memberSinceEl) memberSinceEl.textContent = memberSinceText;
  if (memberSinceSmallEl) memberSinceSmallEl.textContent = memberSinceText;

  if (addressEl) {
    addressEl.textContent = user.address || 'No saved address yet.';
  }

  if (orderCountEl) {
    const orderCount = JSON.parse(localStorage.getItem('lastOrder') || 'null') ? 1 : 0;
    orderCountEl.textContent = orderCount;
  }

  if (paymentMethodEl) {
    paymentMethodEl.textContent = user.paymentMethod || 'No saved payment method yet.';
  }

  if (ordersEl) {
    const lastOrder = JSON.parse(localStorage.getItem('lastOrder') || 'null');
    if (lastOrder) {
      ordersEl.innerHTML = `
        <div class="order-card p-3 mb-3 rounded-3 bg-light border">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <div>
              <h6 class="mb-1">Order ${lastOrder.id}</h6>
              <p class="text-muted mb-0">${lastOrder.date}</p>
            </div>
            <span class="badge badge-soft rounded-pill">${lastOrder.items} item${lastOrder.items === 1 ? '' : 's'}</span>
          </div>
          <div class="d-flex justify-content-between text-muted mb-1"><span>Payment</span><span>${lastOrder.paymentMethod}</span></div>
          <div class="d-flex justify-content-between text-muted mb-3"><span>Total</span><span>$${lastOrder.total}</span></div>
          <a href="order-success.html" class="text-orange small">View receipt</a>
        </div>
      `;
    } else {
      ordersEl.innerHTML = `
        <div class="empty-order-card p-4 rounded-3 text-center">
          <p class="mb-2">No recent orders yet.</p>
          <a href="menu.html" class="btn btn-outline-orange btn-sm">Start ordering</a>
        </div>
      `;
    }
  }

  if (logoutBtn) {
    logoutBtn.addEventListener('click', logoutUser);
  }
}

function validateForm(formId, options = {}) {
  const form = document.querySelector(formId);
  if (!form) return;

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const elements = form.querySelectorAll('input, select, textarea');
    let valid = true;
    elements.forEach((element) => {
      if (element.hasAttribute('required') && !element.value.trim()) {
        valid = false;
        element.classList.add('is-invalid');
      } else {
        element.classList.remove('is-invalid');
      }
    });
    if (valid) {
      const successMessage = options.successMessage || 'Form submitted successfully';
      showToast(successMessage);
      form.reset();
    }
  });
}

function setupPasswordToggle() {
  document.querySelectorAll('[data-toggle-password]').forEach((button) => {
    button.addEventListener('click', () => {
      const selector = button.getAttribute('data-toggle-password');
      const input = selector ? document.querySelector(selector) : null;
      if (!input) return;
      const isPassword = input.getAttribute('type') === 'password';
      input.setAttribute('type', isPassword ? 'text' : 'password');
      const icon = button.querySelector('i');
      if (icon) {
        icon.classList.toggle('fa-eye');
        icon.classList.toggle('fa-eye-slash');
      }
    });
  });
}

function setupCheckoutFlow() {
  const form = document.querySelector('#checkoutForm');
  if (!form) return;

  const summarySubtotal = document.querySelector('#checkoutSubtotal');
  const summaryDelivery = document.querySelector('#checkoutDelivery');
  const summaryService = document.querySelector('#checkoutServiceFee');
  const summaryTotal = document.querySelector('#checkoutTotal');
  const summaryNote = document.querySelector('#checkoutNote');
  const summaryItems = document.querySelector('#checkoutItemCount');

  const refreshCheckoutSummary = () => {
    const subtotal = getSubtotal();
    const delivery = subtotal >= 30 && subtotal > 0 ? 0 : (subtotal > 0 ? 2.5 : 0);
    const total = subtotal + delivery;
    const itemCount = cart.reduce((sum, item) => sum + item.quantity, 0);

    if (summarySubtotal) summarySubtotal.textContent = `$${subtotal.toFixed(2)}`;
    if (summaryDelivery) summaryDelivery.textContent = `$${delivery.toFixed(2)}`;
    if (summaryService) summaryService.textContent = `$0.00`;
    if (summaryTotal) summaryTotal.textContent = `$${total.toFixed(2)}`;
    if (summaryItems) summaryItems.textContent = `${itemCount} item${itemCount === 1 ? '' : 's'}`;

    if (summaryNote) {
      if (subtotal >= 30 && subtotal > 0) {
        summaryNote.textContent = 'Great news! You qualify for free delivery.';
        summaryNote.classList.remove('text-warning');
        summaryNote.classList.add('text-success');
      } else if (subtotal > 0) {
        const remaining = (30 - subtotal).toFixed(2);
        summaryNote.textContent = `Add $${remaining} more for free delivery.`;
        summaryNote.classList.remove('text-success');
        summaryNote.classList.add('text-warning');
      } else {
        summaryNote.textContent = 'Add items to your cart to see delivery savings.';
        summaryNote.classList.remove('text-success', 'text-warning');
      }
    }
  };

  refreshCheckoutSummary();

  // Attach real-time validation for checkout form
  attachLiveValidation(form);

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const requiredFields = form.querySelectorAll('[required]');
    let valid = true;

    requiredFields.forEach((field) => {
      if (!validateField(field)) {
        valid = false;
      }
    });

    if (!valid) {
      showToast('Please fill in the required details.');
      return;
    }

    const selectedOption = document.querySelector('.payment-option input:checked');
    const paymentMethod = selectedOption ? selectedOption.value : 'Cash on Delivery';
    const subtotal = getSubtotal();
    const delivery = subtotal > 0 ? (subtotal >= 30 ? 0 : 2.5) : 0;
    const total = subtotal + delivery;
    const order = {
      id: `FH${Date.now()}`,
      date: new Date().toLocaleString(),
      items: cart.reduce((sum, item) => sum + item.quantity, 0),
      paymentMethod,
      subtotal: subtotal.toFixed(2),
      delivery: delivery.toFixed(2),
      total: total.toFixed(2)
    };

    localStorage.setItem('lastOrder', JSON.stringify(order));
    cart = [];
    saveCart();
    updateCartBadge();
    renderCart();
    form.reset();
    refreshCheckoutSummary();
    window.location.href = 'order-success.html';
  });

  document.querySelectorAll('.payment-option').forEach((option) => {
    option.addEventListener('click', () => {
      refreshCheckoutSummary();
      const input = option.querySelector('input');
      if (input) input.checked = true;
      document.querySelectorAll('.payment-option').forEach((item) => item.classList.remove('active'));
      option.classList.add('active');
    });
  });
}

function showOrderSuccess() {
  const container = document.querySelector('#orderSuccess');
  if (!container) return;

  const order = JSON.parse(localStorage.getItem('lastOrder') || 'null');
  if (!order) {
    container.innerHTML = `
      <div class="alert alert-warning">No recent order was found. <a href="index.html" class="alert-link">Return home</a>.</div>
    `;
    return;
  }

  container.innerHTML = `
    <div class="row justify-content-center">
      <div class="col-md-10">
        <div class="card p-4 mb-4">
          <div class="d-flex flex-column flex-sm-row justify-content-between align-items-start align-items-sm-center gap-3">
            <div>
              <p class="text-muted mb-1">Order ID</p>
              <h5 class="mb-2">${order.id}</h5>
            </div>
            <div>
              <p class="text-muted mb-1">Order Date</p>
              <h5 class="mb-2">${order.date}</h5>
            </div>
            <div>
              <p class="text-muted mb-1">Payment</p>
              <h5 class="mb-2">${order.paymentMethod}</h5>
            </div>
          </div>
          <div class="row text-start mt-4 g-3">
            <div class="col-md-4">
              <div class="order-success-card p-3 rounded-3 bg-light h-100">
                <p class="text-muted mb-1">Items</p>
                <h5>${order.items}</h5>
              </div>
            </div>
            <div class="col-md-4">
              <div class="order-success-card p-3 rounded-3 bg-light h-100">
                <p class="text-muted mb-1">Subtotal</p>
                <h5>$${order.subtotal}</h5>
              </div>
            </div>
            <div class="col-md-4">
              <div class="order-success-card p-3 rounded-3 bg-light h-100">
                <p class="text-muted mb-1">Total</p>
                <h5>$${order.total}</h5>
              </div>
            </div>
          </div>
          <div class="row text-start mt-4 g-3">
            <div class="col-md-6">
              <div class="p-4 rounded-3 bg-primary bg-opacity-10">
                <p class="text-muted mb-1">Estimated delivery</p>
                <h5>25-35 minutes</h5>
              </div>
            </div>
            <div class="col-md-6">
              <div class="p-4 rounded-3 bg-success bg-opacity-10">
                <p class="text-muted mb-1">Delivery partner</p>
                <h5>Kitchen Express</h5>
              </div>
            </div>
          </div>
          <div class="mt-4 p-4 rounded-3 bg-light border">
            <h6 class="mb-3">What happens next?</h6>
            <ul class="mb-0 ps-3">
              <li class="mb-2">Your order is now being prepared.</li>
              <li class="mb-2">We will send an SMS when the driver is on the way.</li>
              <li class="mb-0">Need help? Contact support at <a href="mailto:support@foodiehub.com">support@foodiehub.com</a>.</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  `;
}

function setupMobileNavigation() {
  const toggle = document.querySelector('.navbar-toggler');
  const nav = document.querySelector('.navbar-collapse');
  if (!toggle || !nav) return;
  toggle.addEventListener('click', () => {
    nav.classList.toggle('show');
  });
}

function setupPaymentToggle() {
  const paymentOptions = document.querySelectorAll('.payment-option');
  if (!paymentOptions.length) return;
  paymentOptions.forEach((option) => {
    option.addEventListener('click', () => {
      paymentOptions.forEach((item) => item.classList.remove('active'));
      option.classList.add('active');
      const input = option.querySelector('input');
      if (input) input.checked = true;
    });
  });
}

function initCommon() {
  updateCartBadge();
  renderAuthHeader();
  setupMobileNavigation();
  setupPasswordToggle();
  setupCheckoutFlow();
  setupPaymentToggle();
  validateForm('#contactForm', { successMessage: 'Message sent successfully!' });
  setupRegisterForm();
  setupLoginForm();
}

document.addEventListener('DOMContentLoaded', () => {
  initCommon();
  renderMenu();
  renderCart();
  showFoodDetails();
  showOrderSuccess();
  renderAccountPage();
  const menuSearch = document.querySelector('#menuSearch');
  const categoryFilter = document.querySelector('#categoryFilter');
  const categoryButtons = document.querySelectorAll('.btn-filter');

  // Pre-fill search from URL parameter (when redirected from home page)
  if (menuSearch) {
    const urlParams = new URLSearchParams(window.location.search);
    const searchQuery = urlParams.get('search');
    if (searchQuery) {
      menuSearch.value = searchQuery;
      renderMenu();
    }
  }

  if (menuSearch) menuSearch.addEventListener('input', renderMenu);
  if (categoryFilter) categoryFilter.addEventListener('change', renderMenu);

  categoryButtons.forEach((button) => {
    button.addEventListener('click', () => {
      const category = button.dataset.category || 'All';
      if (categoryFilter) categoryFilter.value = category;
      document.querySelectorAll('.btn-filter.active').forEach((btn) => btn.classList.remove('active'));
      button.classList.add('active');
      renderMenu();
    });
  });
});
