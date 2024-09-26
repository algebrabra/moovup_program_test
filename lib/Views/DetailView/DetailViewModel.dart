import '../../Common/Services/BaseViewModel.dart';
import '../../Models/PeopleAPIModel.dart';

class DetailViewModel extends BaseViewModel {
  final PersonModel person;
  DetailViewModel({required this.person});
}