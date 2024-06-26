import '../header.dart';

class QuoteController extends ChangeNotifier {
  QuoteController() {
    getallQutos();
    // initDataBase();
  }

  List<Quote> allquotes = [];
  List<Quote> allFavQuotes = [];
  List allFavAuthor = [];

  Future<void> getallQutos() async {
    allquotes = await QuotseServices.services.getallQuotes();
  }

  Future<void> initDataBase() async {
    allFavQuotes = await QuoteDataBase.quoteDataBase.getAllData();
    Logger().i('!DB! quotes in ctr: $allFavQuotes');
    notifyListeners();
  }

  Future<void> addFavQuoteInDataBase({required Quote quote}) async {
    await QuoteDataBase.quoteDataBase.insetData(quote: quote);
    initDataBase();
  }

  Future<void> deleteQuoteInDataBase({required Quote quote}) async {
    await QuoteDataBase.quoteDataBase.deleteData(quote: quote);
    initDataBase();
  }
}
