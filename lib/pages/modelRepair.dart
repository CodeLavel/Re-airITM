class Repair {
  final String id;
  final String rpCode;
  final String empCode;
  final String acID;
  final String rpStatus;
  final String rpDate;
  final String rpDetail;

  Repair({
    this.id,
    this.empCode,
    this.rpCode,
    this.acID,
    this.rpStatus,
    this.rpDate,
    this.rpDetail,
  });

  factory Repair.fromJson(Map<String, dynamic> json) {
    return Repair(
      id: json['rp_id'],
      rpCode: json['rp_code'],
      empCode: json['emp_code'],
      acID: json['ac_id'],
      rpStatus: json['rp_status'],
      rpDate: json['rp_date'],
      rpDetail: json['rp_detail'],
    );
  }
}
