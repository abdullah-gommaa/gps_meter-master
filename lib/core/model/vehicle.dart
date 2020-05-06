class Vehicle {
  int id;
  String plateCode;
  int plateNo;
  int driverId;
  bool isActive;
  String vColor;

  Vehicle({
    this.id,
    this.plateCode,
    this.plateNo,
    this.driverId,
    this.isActive,
    this.vColor,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["Id"],
    plateCode: json["PlateCode"],
    plateNo: json["PlateNo"],
    driverId: json["DriverId"],
    isActive: json["IsActive"],
    vColor: json["VColor"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PlateCode": plateCode,
    "PlateNo": plateNo,
    "DriverId": driverId,
    "IsActive": isActive,
    "VColor": vColor,
  };
}