import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/models/reminder_model.dart';
import 'package:nearme_reminder/providers/objectbox_provider.dart';
//import 'package:nearme_reminder/providers/objectbox_provider.dart';

class AddReminderScreen extends ConsumerWidget {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  AddReminderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final store = ref.watch(objectboxStoreProvider);

    return Scaffold(
      appBar: AppBar(title: Text('إضافة تذكير')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'العنوان')),
            TextField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'الوصف')),
            ElevatedButton(
              onPressed: () {
                final reminder = Reminder(
                  title: _titleController.text,
                  description: _descController.text,
                  latitude: 31.0412, // إحداثيات الموقع
                  longitude: 46.2381,
                  radius: 100, reached: 0,
                );
                print(reminder);
                ref.read(reminderProvider.notifier).addReminder(reminder);
                // store.box<Reminder>().put(reminder);
                Navigator.pop(context);
              },
              child: Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }
}
