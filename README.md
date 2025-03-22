
# 📱 Mini E-Commerce App (Flutter + GetX + Dio)

This Flutter app is the frontend for a mini e-commerce platform, displaying **products**, handling **cart operations**, and connecting to a Laravel API backend.

## 🟢 Features:
- Product List Grid
- Product Detail Page (with Add to Cart)
- Cart Page: view, remove items, total amount
- Uses **GetX** for state management
- Uses **Dio** for API communication

## ⚙️ Setup Instructions:

## 🗂️ If you downloaded the ZIP file manually:

1. Unzip the project folder.
2. Open terminal inside the project directory.
3. Run the following:

```bash
flutter pub get
flutter run
```

## or you can clone the project


1. **Clone the project**
```bash
git clone https://github.com/minrandom/mini-ecommerce-app.git
cd mini-ecommerce-app
flutter pub get
```

2. **Run the app**
```bash
flutter run
```

## 📦 Dependencies:

```yaml
get: ^4.6.5
dio: ^5.3.2
```

## 📌 App Screens

| Screen             | Route            | Functionality                      |
|--------------------|------------------|-----------------------------------|
| SplashScreen       | `/`              | Initial screen (optional)         |
| Product List       | `/home`          | View products in grid view        |
| Product Detail     | `/productdetail` | View product info + Add to Cart   |
| Cart Page          | `/cart`          | View cart items + remove + total  |

## 🧠 App Architecture:
- **Controllers:** ProductController, CartController
- **Models:** Product, CartItem
- **Services:** Global Dio instance
- **Routing:** GetX Pages (`routes/app_pages.dart`)
- **State Management:** GetX + Obx()

## 🔗 Backend API (Laravel):
- Base URL: `http://127.0.0.1:8000/api`
- All API calls handled via **Dio**

## 🚀 Next Steps:
- Add Login/Register UI
- Save JWT token using GetStorage
- Protect cart routes (auth)
- Flutter Web deployment (Vercel/Netlify)




