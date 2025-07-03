// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'NearMe Reminder';

  @override
  String times_reached(String count) {
    return '$count times reached!';
  }

  @override
  String get new_reminder_title => 'new reminder';

  @override
  String get add_from_title => 'title';

  @override
  String get add_from_desc => 'description';

  @override
  String get add_from_distance => 'distance to alert';

  @override
  String get add_repated_reminder => 'repated reminder?';

  @override
  String get add__location_not_setted_yet => 'Location not setted yet!';

  @override
  String get add__click_to_edit => 'click to edit';

  @override
  String get add__this_record_is_required => 'this record is required!';
}
