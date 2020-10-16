class Access {
  final String code;
  final String acName;
  final String acZone;

  Access({this.acName, this.acZone, this.code});

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      code: json['ac_id'],
      acName: json['ac_name'],
      acZone: json['ac_zone'],
    );
  }
}
