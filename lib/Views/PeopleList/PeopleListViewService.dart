//API Service for PeopleListViewModel

import 'package:moovup_program_test/Models/PeopleAPIModel.dart';
import 'package:moovup_program_test/Common/Repository/PeopleRepository.dart';

class PeopleListService {

  final PeopleRepository repository = PeopleRepository();

  Future<PeopleResponseModel> fetchPeople() async {
    return repository.fetchPeople();
  }
}