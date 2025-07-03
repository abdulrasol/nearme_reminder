/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/database/objectbox.dart';

final objectBoxProvider =
    Provider<ObjectBox>((ref) => throw UnimplementedError());
final reminderProvider = StateNotifierProvider<ReminderNotifer, List<Reminder>>(
  (ref) => ReminderNotifer(
    ref.watch(objectBoxProvider),
  ),
);

class ReminderNotifer extends StateNotifier<List<Reminder>> {
  final ObjectBox objectBox;
  ReminderNotifer(this.objectBox) : super(objectBox.reminderBox.getAll());

  void addReminder(Reminder reminder) async {
    await objectBox.reminderBox.putAsync(reminder);
    state = [
      ...objectBox.reminderBox.getAll()
    ]; // تحديث الحالة ليتعرف Riverpod على التغيير
  }

  void removeReminder(int reminderId) async {
    await objectBox.reminderBox.remove(reminderId);
    state = [
      ...objectBox.reminderBox.getAll()
    ]; // تحديث الحالة ليتعرف Riverpod على التغيير
  }
}
*/
