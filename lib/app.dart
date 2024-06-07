import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/routes/quotes_routes.dart';

import 'controller/theme_cantroller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: Provider.of<ThemeCantroller>(context).themeMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.cyanAccent,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        routes: QuotesRoutes.quotesRoutes.route);
  }
}
