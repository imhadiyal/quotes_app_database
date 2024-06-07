import 'package:quotes/header.dart';

class LikeController extends ChangeNotifier {
  LikeController() {
    ChangeLike();
  }

  bool like = true;

  void ChangeLike() {
    like = !like;
    notifyListeners();
  }
}
