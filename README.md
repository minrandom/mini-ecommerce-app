# 📱 Mini E-Commerce App (Flutter + GetX + Dio + JWT)

This Flutter app is the frontend for a mini e-commerce platform, connecting to a Laravel API backend with JWT authentication. It includes product listing, cart management, and secure token-based API calls.

---

## 🟢 Features:
- JWT Auth (Login/Register)
- Splash Screen with auto-redirect
- Product List Grid + Detail Page
- Cart Page: add, view, remove, checkout
- **Cart Badge** on AppBar globally
- **Bottom Navigation Bar** reusable widget
- Home screen with cart warning logic
- Auto token storage via **GetStorage**
- Secure API calls using **Dio interceptor**

---

## ⚙️ Setup Instructions:

### 🗂️ If you downloaded ZIP manually:
1. Unzip the project folder.
2. Inside project folder, run:
```bash
flutter pub get
flutter run
```

---

### OR Clone via Git:
```bash
git clone https://github.com/minrandom/mini-ecommerce-app.git
cd mini-ecommerce-app
flutter pub get
flutter run
```

---

## 📦 Dependencies:

```yaml
get: ^4.6.5
dio: ^5.3.2
get_storage: ^2.0.3
```

---

## 📌 App Screens

| Screen             | Route            | Functionality                                 |
|--------------------|------------------|----------------------------------------------|
| SplashScreen       | `/`              | Auto-redirect based on JWT token              |
| Login              | `/login`         | Login user & save token                      |
| Register           | `/register`      | Create new user                              |
| Home               | `/home`          | User info + cart warning + navigation buttons |
| Product List       | `/home`          | Grid view of products                        |
| Product Detail     | `/productdetail` | Product info + Add to Cart                   |
| Cart Page          | `/cart`          | View cart items + remove + checkout          |

---

## 🧠 App Architecture:
- **Controllers:** AuthController, ProductController, CartController
- **Models:** Product, CartItem
- **Services:** Global Dio instance + JWT interceptor
- **Widgets:** CartBadgeIcon, BottomNavBar, LogoutButton, HomeButton
- **Routing:** GetX Pages (`routes/app_pages.dart`)
- **State Management:** GetX + Obx()

---

## 🔐 Auth:
- JWT token is saved in **GetStorage**
- Automatically attached via **Dio Interceptor** on all API calls
- Splash screen redirects based on token status

---

## 🔗 Backend API (Laravel):
- Base URL: `http://127.0.0.1:8000/api`
- Uses `/register`, `/login`, `/products`, `/cart` APIs

---

## 🚀 Next Steps:
- Add Checkout History Page
- Add Logout confirmation
- CI/CD + Web Deployment (Vercel/Netlify)

---
