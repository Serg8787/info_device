
import 'info_device_platform_interface.dart';

class InfoDevice {
  Future<String?> getPlatformVersion() {
    return InfoDevicePlatform.instance.getPlatformVersion();
  }
}
