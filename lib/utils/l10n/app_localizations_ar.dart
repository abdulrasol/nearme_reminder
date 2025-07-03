// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get app_name => 'ذكرني بهذا المكان';

  @override
  String times_reached(String count) {
    return '$count وصلت اليه!';
  }

  @override
  String get new_reminder_title => 'تذكير جديد';

  @override
  String get add_from_title => ' \'العنوان';

  @override
  String get add_from_desc => 'الوصف';

  @override
  String get add_from_distance => 'المسافة الابعد للتذكير';

  @override
  String get add_repated_reminder => 'تكرار التذكير؟';

  @override
  String get add__location_not_setted_yet => 'Location not setted yet!';

  @override
  String get add__click_to_edit => 'click to edit';

  @override
  String get add__this_record_is_required => 'this record is required!';
}
