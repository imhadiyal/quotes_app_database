import 'package:flutter/material.dart';
import 'package:quotes/modals/quotes_modals.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Quote data = ModalRoute.of(context)!.settings.arguments as Quote;
    return Scaffold(
      appBar: AppBar(
        title: const Text("detailpag"),
      ),
      body: Center(
        child: Text(data.quote),
      ),
    );
  }
}
