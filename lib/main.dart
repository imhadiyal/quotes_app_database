import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quotes/controller/quotes_conroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'controller/like_conteroller.dart';
import 'controller/theme_cantroller.dart';
import 'helper/quotes_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuoteDataBase.quoteDataBase.initDataBase();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.getBool('darkMode') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuoteController(),
        ),
        ChangeNotifierProvider(
          create: (_) => LikeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeCantroller(preferences: preferences),
        )
      ],
      child: const MyApp(),
    ),
  );
}
