import 'package:objectbox/objectbox.dart';

@Entity()
class Reminder {
  @Id()
  int id = 0;
  String title;
  String description;
  bool repeated; // is reminder is repeated, defualt false
  int reached; // how many times user reach location
  String? address;
  double latitude;
  double longitude;
  double radius; // المسافة المطلوبة للإشعار

  Reminder({
    required this.title,
    required this.description,
    this.repeated = false,
    this.reached = 0,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });
}
