import 'package:gpsmeter/core/model/vehicle.dart';

class User {
  int id;
  String nameAr;
  String nameEn;
  String phone;
  String email;
  String secureKey;
  int civilId;
  List<Vehicle> vehicles;

  User({
    this.id,
    this.nameAr,
    this.nameEn,
    this.phone,
    this.email,
    this.secureKey,
    this.civilId,
    this.vehicles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["Id"],
    nameAr: json["NameAr"],
    nameEn: json["NameEn"],
    phone: json["Phone"],
    email: json["Email"],
    secureKey: json["SecureKey"],
    civilId: json["CivilId"],
    vehicles: List<Vehicle>.from(json["Vehicles"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NameAr": nameAr,
    "NameEn": nameEn,
    "Phone": phone,
    "Email": email,
    "SecureKey": secureKey,
    "CivilId": civilId,
    "Vehicles": List<dynamic>.from(vehicles.map((x) => x.toJson())),
  };
}
