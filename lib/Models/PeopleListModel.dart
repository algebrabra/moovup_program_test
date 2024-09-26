import 'package:flutter/cupertino.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';

class PeopleListModel extends ChangeNotifier {
  List<PersonModel> people = [];

  void setPeople(List<PersonModel> newPeople) {
    people = newPeople;
    notifyListeners();
  }
}