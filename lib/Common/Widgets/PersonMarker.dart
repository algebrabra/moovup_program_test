//Marker on map

import 'package:flutter_map/flutter_map.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';

class PersonMarker extends Marker {
  final PersonModel person;

  PersonMarker({super.key, required this.person, required super.point, required super.child});

}
