import 'dart:async';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        autoStartOnBoot: true,
        isForegroundMode: true,
      ));
}

void onStart(ServiceInstance ser) async {
  //DartPluginRegistrant.ensureInitialized();
  final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);

  await localNotificationsPlugin.initialize(initializationSettings);
  // إعداد المؤقت لتشغيل الكود كل دقيقة (يمكن تعديل الفترة حسب الحاجة)
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    // تأكد من صلاحية الحصول على الموقع: يمكنك إضافة طلب إذن أو التأكد من تفعيل GPS
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("خدمة الموقع غير مفعلة");

    if (!serviceEnabled) {
      print("خدمة الموقع غير مفعلة");
      return;
    }

    // الحصول على الموقع الحالي
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    } catch (e) {
      print("خطأ في الحصول على الموقع: $e");
      return;
    }

    double currentLat = position.latitude;
    double currentLon = position.longitude;
    print("الموقع الحالي: $currentLat , $currentLon");

    // هنا نضع الموقع المخزن مسبقًا (يمكن أن يكون من قاعدة بيانات أو إعدادات)
    // على سبيل المثال: موقع مقر معين
    const double storedLat = 44.3568181;
    const double storedLon = 32.0360329;
    // حساب المسافة بالمتر بين الموقع الحالي والموقع المخزن
    double distance = Geolocator.distanceBetween(
        currentLat, currentLon, storedLat, storedLon);
    print("المسافة بين الموقعين: $distance متر");

    // إذا كانت المسافة أقل من 100 متر، نرسل إشعار
    if (distance < 100) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'location_channel', // معرف القناة
        'تنبيهات الموقع', // اسم القناة
        channelDescription: 'تنبيه عند الاقتراب من الموقع المخزن',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidDetails);

      await localNotificationsPlugin.show(
        0,
        'تنبيه الموقع',
        'أنت بالقرب من الموقع المحدد',
        notificationDetails,
      );
    }

    // يمكنك أيضاً تحديث بيانات الخدمة باستخدام service.invoke("update", {...});
  });
}

/**
 <!-- أذونات الموقع الأساسية -->
	<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
	<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
	<!-- إذن الموقع في الخلفية (يجب أن يكون بعد الأذونات الأساسية) -->
	<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
	<!-- إذن تشغيل الخدمات في الخلفية (مهم لأجهزة Android 10+) -->
	<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
	<!-- إذن تشغيل خدمة الموقع في المقدمة -->
	<uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" /> 



 */
