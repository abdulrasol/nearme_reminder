import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppStrings {
  static String appName(BuildContext context) {
    return AppLocalizations.of(context)!.app_name;
  }

  static String reminderCardReachedCount(BuildContext context, count) {
    return AppLocalizations.of(context)!.times_reached(count.toString());
  }

  static String addReminderTitle(BuildContext context) {
    return AppLocalizations.of(context)!.new_reminder_title;
  }

  static String addFromTitle(BuildContext context) {
    return AppLocalizations.of(context)!.add_from_title;
  }

  static String addRFromDesc(BuildContext context) {
    return AppLocalizations.of(context)!.add_from_desc;
  }

  static String addFromDistane(BuildContext context) {
    return AppLocalizations.of(context)!.add_from_distance;
  }

  static String addReminderCheckBox(BuildContext context) {
    return AppLocalizations.of(context)!.add_repated_reminder;
  }

  static String addLocationNotSelected(BuildContext context) {
    return AppLocalizations.of(context)!.add__location_not_setted_yet;
  }
  static String addClickToEdit(BuildContext context) {
    return AppLocalizations.of(context)!.add__click_to_edit;
  }

   static String addRequiredRecord(BuildContext context) {
    return AppLocalizations.of(context)!.add__this_record_is_required;
  }
}

var themeData = ThemeData(
  // This is the theme of your application.
  //
  // TRY THIS: Try running your application with "flutter run". You'll see
  // the application has a purple toolbar. Then, without quitting the app,
  // try changing the seedColor in the colorScheme below to Colors.green
  // and then invoke "hot reload" (save your changes or press the "hot
  // reload" button in a Flutter-supported IDE, or press "r" if you used
  // the command line to start the app).
  //
  // Notice that the counter didn't reset back to zero; the application
  // state is not lost during the reload. To reset the state, use hot
  // restart instead.
  //
  // This works for code too, not just values: Most code changes can be
  // tested with just a hot reload.
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

// add reminder page

final inputDecoration = InputDecoration();
