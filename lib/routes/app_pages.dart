import '../pages/product_detail_page.dart';
import '../pages/product_list_page.dart';
import '../pages/cart_page.dart';
import '../splashscreen.dart';
import 'package:get/get.dart';

class Routes {
  static const splash = '/';
  // static const login = '/login';
  static const home = '/home';
  static const prodetail = '/productdetail';
  static const prolist = '/productlist';
  static const cartlist = '/cart';
}

class UserRoutes {
  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    // GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.home, page: () => ProductListPage()),
    GetPage(name: Routes.prodetail, page: () => ProductDetailPage()),
    GetPage(name: Routes.prolist, page: () => ProductListPage()),
    GetPage(name: Routes.cartlist, page: () => CartPage()),
  ];
}
