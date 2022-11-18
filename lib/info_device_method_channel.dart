// import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'info_device_platform_interface.dart';

/// An implementation of [InfoDevicePlatform] that uses method channels.
class MethodChannelInfoDevice extends InfoDevicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('info_device');

  @override
  Future<String?> getInfoDevice() async {
    final data = await methodChannel.invokeMethod<String>('getInfoDevice');
    return data;
  }

  @override
  Future<String?> getBrand() async {
    final data = await methodChannel.invokeMethod<String>('brandModel');
    return data;
  }
  @override
  Future<String?> getModel() async {
    final data = await methodChannel.invokeMethod<String>('getModel');
    return data;
  }



}
