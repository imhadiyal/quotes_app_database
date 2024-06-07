import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/quotes_conroller.dart';
import '../../modals/quotes_modals.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController mutable = Provider.of<QuoteController>(context);
    QuoteController unmutable =
        Provider.of<QuoteController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: mutable.allFavQuotes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(mutable.allFavQuotes[index].quote),
                subtitle: Text(mutable.allFavQuotes[index].author),
                trailing: IconButton(
                  onPressed: () {
                    unmutable.deleteQuoteInDataBase(
                        quote: mutable.allFavQuotes[index]);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            }),
      ),
    );
  }
}
