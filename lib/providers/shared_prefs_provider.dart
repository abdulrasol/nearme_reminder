import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/database/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final appSettingsProvider = Provider<AppSettings>((ref) {
  final prefs = ref.watch(sharedProvider).asData?.value;
  assert(prefs != null, 'SharedPreferences not initialized');
  return AppSettings(prefs!);
});
