import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
