abstract class BaseAPIModel {

  int? errorCode;
  String? errorMessage;

  /*APIModel({this.errorCode, this.errorMessage});

  factory APIModel.fromJson(Map<String, dynamic> json) {
    return APIModel(
      errorCode: json['error_code'] as int?,
      errorMessage: json['error_message'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      if (errorCode != null) 'error_code': errorCode,
      if (errorMessage != null) 'error_message': errorMessage,
    };
  }*/

  dynamic toJson();

  void fromJsonErrorHandling(Map<String, dynamic> json) {
    errorCode = json['error_code'] as int?;
    errorMessage = json['error_message'] as String?;
  }

  Map<String, dynamic> toJsonErrorHandling() {
    return {
      'error_code': errorCode,
      'errorMessage': errorMessage,
    };
  }
}