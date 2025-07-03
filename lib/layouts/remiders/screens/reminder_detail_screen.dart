import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/providers/objectbox_provider.dart';
import 'package:nearme_reminder/utils/app_constants.dart';

class ReminderDetailScreen extends ConsumerWidget {
  const ReminderDetailScreen({super.key, required this.reminder});
  final Reminder reminder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reminder.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit_notifications)),
          IconButton(
              onPressed: () {
                ref.read(reminderProvider.notifier).removeReminder(reminder.id);
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(reminder.description),
              10.verticalSpace,
              Text(reminder.address ?? ''),
              10.verticalSpace,
              Text(
                  ' ${AppStrings.reminderCardReachedCount(context, reminder.reached)}'),
              10.verticalSpace,
              Text(reminder.address ?? ''),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                //child: Open(onPicked: (PickedData pickedData) {  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
