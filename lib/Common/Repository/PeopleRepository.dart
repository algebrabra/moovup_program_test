import 'package:moovup_program_test/Models/PeopleAPIModel.dart';

import '../Services/APIService.dart';

class PeopleRepository {

  Future<PeopleResponseModel> fetchPeople() async {
    dynamic json = await APIService.shared.fetchAPI(url: "templates/-xdNcNKYtTFG/data", requestMethod: RequestMethod.get);
    return PeopleResponseModel.fromJson(json);
  }
}