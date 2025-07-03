import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/database/objectbox.dart';

//import '../objectbox.g.dart';

final objectBoxProvider =
    Provider<ObjectBox>((ref) => throw UnimplementedError());

final reminderProvider = StateNotifierProvider<ReminderNotifer, List<Reminder>>(
    (ref) => ReminderNotifer(ref.watch(objectBoxProvider)));

class ReminderNotifer extends StateNotifier<List<Reminder>> {
  final ObjectBox objectBox;

  ReminderNotifer(this.objectBox) : super(objectBox.box.getAll());

  void addReminder(Reminder reminder) {
    objectBox.box.put(reminder);
    //var f = objectBox.box.query().order(Reminder_.radius);

    state = [...objectBox.box.getAll()];
  }

  void removeReminder(int reminderId) {
    objectBox.box.remove(reminderId);
    state = [...objectBox.box.getAll()];
  }
}
