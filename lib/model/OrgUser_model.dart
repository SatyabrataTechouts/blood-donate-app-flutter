class OrgModel {
  final String name;
  final String mobile;
  final String State;
  final String pin;
  OrgModel({
    required this.name,
    required this.mobile,
    required this.State,
    required this.pin,
  });

  // const OrgModel({
  //   required this.name,
  //   required this.mobile,
  //   required this.State,
  //   required this.pin,
  // });
  factory OrgModel.fromJson(Map<String, dynamic> json) {
    return OrgModel(
      name: json['name'],
      mobile: json['mobile'],
      State: json['State'],
      pin: json['pin'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      'State': State,
      'pin': pin,
    };
  }

  List<OrgModel> parseJsonData(List<dynamic> jsonData) {
    return jsonData.map((json) => OrgModel.fromJson(json)).toList();
  }
}
