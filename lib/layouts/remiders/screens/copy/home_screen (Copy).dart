/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/providers/objectbox_provider.dart';
import 'package:nearme_reminder/utils/app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //final reminders = ref.watch(reminderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appName(context),
        ),
      //  actions: [Text('${reminders.length}')],
      ),
      body: ListView.builder(
       // itemCount: reminders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(reminders[index].title),
                  IconButton(
                      onPressed: () async {
                        ref
                            .read(reminderProvider.notifier)
                            .removeReminder(reminders[index].id);
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed('add-reminder');
      }),
    );
  }
}
*/
