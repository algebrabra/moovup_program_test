import 'dart:ffi';
import '../Common/Services/BaseAPIModel.dart';

class PeopleRequestModel extends BaseAPIModel {
  PeopleRequestModel();

  factory PeopleRequestModel.fromJson(Map<String, dynamic> json) {
    PeopleRequestModel response = PeopleRequestModel();
    response.fromJsonErrorHandling(json);
    return response;
  }

  Map<String, dynamic> toJson() {
    final json = toJsonErrorHandling();
    return json;
  }
}

class PeopleResponseModel extends BaseAPIModel {
  final List<PersonModel>? people;

  PeopleResponseModel({
    this.people,
  });

  factory PeopleResponseModel.fromJson(dynamic json) {
    List<PersonModel> people = [];
    if (json is List) {
      people = (json)!.map((item) => PersonModel.fromJson(item as Map<String, dynamic>)).toList();
    }
    PeopleResponseModel response = PeopleResponseModel(
      people: people,
    );
    if (json is Map<String, dynamic>) {
      response.fromJsonErrorHandling(json);
    }
    return response;
  }

  @override
  dynamic toJson() {
    List<Map<String, dynamic>> json = [];
    if (people != null) {
      json = people!.map((item) => item.toJson()).toList();
    }
    return json;
  }
}

class PersonModel extends BaseAPIModel {
  final String? id;
  final NameModel? name;
  final String? email;
  final String? picture;
  final LocationModel? location;

  PersonModel({this.id, this.name, this.email, this.picture, this.location});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    PersonModel response = PersonModel(
      id: json['_id'] as String?,
      name: json['name'] == null ? null : NameModel.fromJson(json['name']!),
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location']!),
    );
    response.fromJsonErrorHandling(json);
    return response;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJsonErrorHandling();
    json['_id'] = id;
    json['name'] = name?.toJson();
    json['email'] = email;
    json['picture'] = picture;
    json['location'] = location?.toJson();
    return json;
  }
}

class NameModel extends BaseAPIModel {
  final String? first;
  final String? last;

  NameModel({this.first, this.last});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    NameModel response = NameModel(
      first: json['first'] as String?,
      last: json['last'] as String?,
    );
    response.fromJsonErrorHandling(json);
    return response;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJsonErrorHandling();
    json['first'] = first;
    json['last'] = last;
    return json;
  }
}

class LocationModel extends BaseAPIModel {
  final double? latitude;
  final double? longitude;

  LocationModel({this.latitude, this.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    LocationModel response = LocationModel(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
    response.fromJsonErrorHandling(json);
    return response;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJsonErrorHandling();
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    return json;
  }
}
