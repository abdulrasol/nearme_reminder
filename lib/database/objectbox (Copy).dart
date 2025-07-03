/*
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<Reminder> reminderBox;

  ObjectBox._create(this.store) {
    reminderBox = Box<Reminder>(store);
  }
  static Future<ObjectBox> initObjectBox() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
*/
