import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerHelper {
  static Future<bool> requestLocationPermission() async {
    // طلب إذن الموقع في المقدمة
    PermissionStatus status = await Permission.location.request();

    if (status.isDenied) {
      //print("❌ تم رفض إذن الموقع");
      return false;
    }

    if (status.isPermanentlyDenied) {
      // print("⚠️ الإذن مرفوض بشكل دائم، يجب فتح الإعدادات");
      openAppSettings();
      return false;
    }

    // طلب إذن الموقع في الخلفية إذا كان الإصدار >= Android 10
    if (await Permission.locationAlways.isGranted == false) {
      PermissionStatus backgroundStatus =
          await Permission.locationAlways.request();
      if (backgroundStatus.isDenied) {
        print("❌ تم رفض إذن الموقع في الخلفية");
        return false;
      }
    }

    return true;
  }
}
