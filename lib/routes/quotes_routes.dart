import 'package:flutter/cupertino.dart';

import '../screen/CartPage/cartpage.dart';
import '../screen/DetailPage/detail_page.dart';
import '../screen/HomePage/home_page.dart';

class QuotesRoutes {
  QuotesRoutes._();
  static final QuotesRoutes quotesRoutes = QuotesRoutes._();
  String homePage = '/';
  String cartPage = 'cart_page';
  String detailpage = 'detail_page';
  Map<String, Widget Function(BuildContext)> route = {
    '/': (context) => const HomePage(),
    'cart_page': (context) => const CartPage(),
    'detail_page': (context) => const DetailPage(),
  };
}
