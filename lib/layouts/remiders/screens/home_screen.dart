import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/layouts/remiders/screens/add_reminder_screen.dart';
import 'package:nearme_reminder/layouts/remiders/screens/reminder_card.dart';
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
    final reminders = ref.watch(reminderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appName(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, index) {
            return ReminderCard(reminder: reminders[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Flexify.go(
            AddReminderScreen(),
            animation: FlexifyRouteAnimations.fade,
            animationDuration: Duration(milliseconds: 200),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      drawer: Drawer(
        //elevation: 2,
        child: SafeArea(
          child: Column(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.appName(context),
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.verticalSpace,
              ListTile(
                title: Text(reminders.length.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
