class RegistredUser {
  final String name;
  final String bloodGroup;
  final String state;
  final String pinCode;
  final String mobileNumber;

  RegistredUser({
    required this.name,
    required this.bloodGroup,
    required this.state,
    required this.pinCode,
    required this.mobileNumber,
  });
  // RegistredUser.customConstructor({
  //   required this.name,
  //   required this.bloodGroup,
  //   required this.state,
  //   required this.pinCode,
  // });
  factory RegistredUser.fromJson(Map<String, dynamic> json) {
    return RegistredUser(
      name: json['name'],
      bloodGroup: json['bloodGroup'],
      state: json['state'],
      pinCode: json['pinCode'],
      mobileNumber: json['mobileNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bloodGroup': bloodGroup,
      'state': state,
      'pin': pinCode,
      'mobile': mobileNumber,
    };
  }

  List<RegistredUser> parseJsonData(List<dynamic> jsonData) {
    return jsonData.map((json) => RegistredUser.fromJson(json)).toList();
  }
}
