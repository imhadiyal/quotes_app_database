import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/controller/like_conteroller.dart';
import 'package:quotes/controller/quotes_conroller.dart';

import '../../controller/theme_cantroller.dart';
import '../../routes/quotes_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController mutabal = Provider.of<QuoteController>(context);
    QuoteController unmutabale =
        Provider.of<QuoteController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, QuotesRoutes.quotesRoutes.cartPage);
            },
            icon: const Icon(Icons.favorite_rounded),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeCantroller>(context, listen: false)
                  .toggleTheme();
            },
            icon: Icon(
              Provider.of<ThemeCantroller>(context).isDark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          )
        ],
      ),
      body: Center(
        child: (mutabal.allquotes.isEmpty)
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: mutabal.allquotes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mutabal.allquotes[index].quote),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('-${mutabal.allquotes[index].author}'),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                unmutabale.addFavQuoteInDataBase(
                                    quote: mutabal.allquotes[index]);
                                Provider.of<LikeController>(context,
                                        listen: false)
                                    .ChangeLike();
                              },
                              icon: Icon(
                                (Provider.of<LikeController>(context).like)
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
