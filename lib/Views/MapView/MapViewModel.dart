//ViewModel for MapView
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:moovup_program_test/Common/Config/Environment.dart';
import 'package:moovup_program_test/Common/Services/BaseViewModel.dart';

import '../../Models/PeopleAPIModel.dart';

class MapViewModel extends BaseViewModel {
  List<PersonModel> people = [];

  LatLng getInitialCenter() {
    if (people.length == 1) {
      return LatLng(people[0].location?.latitude ?? 0, people[0].location?.longitude ?? 0);
    } else if (people.isNotEmpty && people[0].location?.latitude != null && people[0].location?.longitude != null) {
      return LatLng(people[0].location!.latitude!, people[0].location!.longitude!);
    } else {
      return Environment.getInitialCenter();
    }
  }
}