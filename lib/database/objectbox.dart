import 'package:nearme_reminder/objectbox.g.dart';
import 'models/reminder_model.dart';

class ObjectBox {
  late final Store store;
  late final Box<Reminder> box;

  ObjectBox._create(this.store) {
    box = Box<Reminder>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
