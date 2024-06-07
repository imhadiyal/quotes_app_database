import 'package:quotes/header.dart';

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
