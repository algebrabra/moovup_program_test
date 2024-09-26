//Basic ViewModel, all model should extends this class

import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  int? errorCode;

}