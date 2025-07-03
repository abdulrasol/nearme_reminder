import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme_reminder/layouts/remiders/screens/home_screen.dart';
import 'package:nearme_reminder/providers/objectbox_provider.dart';
import 'package:nearme_reminder/services/permission_handler.dart';
import 'package:nearme_reminder/services/services.dart';
import 'utils/app_constants.dart';
import 'database/objectbox.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة ObjectBox

  //final objectBox = await ObjectBox.initObjectBox(); // إنشاء قاعدة البيانات
  // بدء خدمة الخلفية

  await PermissionHandlerHelper.requestLocationPermission();
  final objectBox = await ObjectBox.create();
  await services();
  runApp(ProviderScope(
    overrides: [objectBoxProvider.overrideWithValue(objectBox)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexify(
      designWidth: 375,
      designHeight: 812,
      app: MaterialApp(
        //locale: Locale('ar'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => AppStrings.appName(context),
        theme: themeData,
        home: const HomeScreen(),
        routes: {
          //'add-reminder': (context) => AddReminderScreen(),
        },
      ),
    );
  }
}
