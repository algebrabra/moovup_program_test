//ViewModel of PeopleListView

import 'package:moovup_program_test/Common/Services/BaseViewModel.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';
import 'package:moovup_program_test/Views/PeopleList/PeopleListViewService.dart';

class PeopleListViewModel extends BaseViewModel {
  List<PersonModel> people = [];
  final PeopleListService service = PeopleListService();

  Future<void> refresh() async { //Request people from API and refresh PeopleListView

    isLoading = true;
    errorCode = null;
    errorMessage = null;
    notifyListeners();

    PeopleResponseModel response = await service.fetchPeople();
    isLoading = false;
    if (response.errorCode != null) {
      errorCode = response.errorCode;
      errorMessage = response.errorMessage;
    } else if (response.people != null) {
      people = response.people!;
    }
    notifyListeners();
  }
}