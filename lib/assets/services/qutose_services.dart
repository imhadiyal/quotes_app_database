import 'package:quotes/header.dart';

import 'package:http/http.dart' as http;

class QuotseServices {
  QuotseServices._();
  static final QuotseServices services = QuotseServices._();

  String quotes = "https://dummyjson.com/quotes";
  Future<List<Quote>> getallQuotes() async {
    List<Quote> allquotes = [];

    http.Response response = await http.get(Uri.parse(quotes));

    if (response.statusCode == 200) {
      List data = await jsonDecode(response.body)["quotes"];

      allquotes = data.map((e) => Quote.fromJson(e)).toList();
    }
    return allquotes;
  }
}
