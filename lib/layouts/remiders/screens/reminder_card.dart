import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/layouts/remiders/screens/reminder_detail_screen.dart';
import 'package:nearme_reminder/providers/objectbox_provider.dart';
import 'package:nearme_reminder/utils/app_constants.dart';

class ReminderCard extends ConsumerWidget {
  const ReminderCard({super.key, required this.reminder});
  final Reminder reminder;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(2),
      child: ListTile(
        onTap: () => Flexify.go(ReminderDetailScreen(reminder: reminder)),
        isThreeLine: true,
        title: Text(reminder.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reminder.address ?? reminder.description),
            Row(
              children: [
                Text(AppStrings.reminderCardReachedCount(
                    context, reminder.reached)),
                8.horizontalSpace,
                reminder.repeated
                    ? Icon(Icons.access_alarm_outlined)
                    : 10.verticalSpace,
                10.horizontalSpace,
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            ref.read(reminderProvider.notifier).removeReminder(reminder.id);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
