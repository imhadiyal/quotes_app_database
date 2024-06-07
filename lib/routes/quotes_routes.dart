import 'package:flutter/cupertino.dart';

import '../screen/CartPage/cartpage.dart';
import '../screen/HomePage/home_page.dart';
import '../screen/SplashScreenPage/splashscreen.dart';

class QuotesRoutes {
  QuotesRoutes._();
  static final QuotesRoutes quotesRoutes = QuotesRoutes._();
  String splashscreen = '/';
  String homePage = 'home_page';
  String cartPage = 'cart_page';
  Map<String, Widget Function(BuildContext)> route = {
    '/': (context) => const SplashScreen(),
    'home_page': (context) => const HomePage(),
    'cart_page': (context) => const CartPage(),
  };
}
