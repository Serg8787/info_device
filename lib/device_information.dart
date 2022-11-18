import 'dart:async';

import 'package:flutter/services.dart';

/// This is main class that handle all the request.
class DeviceInformation {
  static const MethodChannel _channel =
  const MethodChannel('info_device');

  /// Future method to get android version of the device
  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('versionRelease');
    return version == null ? "" : version;
  }

  /// Future method to get modelPhone of device
  ///
  static Future<String> get modelPhone async {
    final modelPhone = await _channel.invokeMethod("modelPhone");
    return modelPhone == null ? "" : modelPhone;
  }

  /// Future method to get brandPhone of the device
  static Future<dynamic> get brandPhone async {
    final brandPhone = await _channel.invokeMethod("brandPhone");
    return brandPhone == null ? "" : brandPhone;
  }

  /// Future method to get display
  static Future<String> get display async {
    final display = await _channel.invokeMethod("display");
    return display == null ? "" : display;
  }

  /// Future method to get baseOS
  static Future<String> get baseOS async {
    final baseOS = await _channel.invokeMethod("baseOS");
    return baseOS == null ? "" : baseOS;
  }

  /// Future method to get hardware
  static Future<String> get hardware async {
    final hardware = await _channel.invokeMethod("hardware");
    return hardware == null ? "" : hardware;
  }

  /// Future method to get idDevice
  static Future<String> get productName async {
    final idDevice = await _channel.invokeMethod("idDevice");
    return idDevice == null ? "" : idDevice;
  }

  /// Future method to get product
  static Future<String> get product async {
    final product = await _channel.invokeMethod("product");
    return product == null ? "" : product;
  }

  /// Future method to get timeInfo
  static Future<String> get timeInfo async {
    final timeInfo = await _channel.invokeMethod("timeInfo");
    return timeInfo == null ? "" : timeInfo;
  }
}