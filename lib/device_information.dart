import 'dart:async';

import 'package:flutter/services.dart';

/// This is main class that handle all the request.
class DeviceInformation {
  static const MethodChannel _channel =
  MethodChannel('info_device');

  /// Future method to get android version of the device
  Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('versionRelease');
    return version ?? "";
  }

  /// Future method to get modelPhone of device
  ///
   Future<String> get modelPhone async {
    final modelPhone = await _channel.invokeMethod("modelPhone");
    return modelPhone ?? "";
  }

  /// Future method to get brandPhone of the device
   Future<String> get brandPhone async {
    final brandPhone = await _channel.invokeMethod("brandPhone");
    return brandPhone ?? "";
  }

  /// Future method to get display
 Future<String> get display async {
    final display = await _channel.invokeMethod("display");
    return display ?? "";
  }

  /// Future method to get baseOS
  Future<String> get baseOS async {
    final baseOS = await _channel.invokeMethod("baseOS");
    return baseOS ?? "";
  }

  /// Future method to get hardware
   Future<String> get hardware async {
    final hardware = await _channel.invokeMethod("hardware");
    return hardware ?? "";
  }

  /// Future method to get idDevice
   Future<String> get idDevice async {
    final idDevice = await _channel.invokeMethod("idDevice");
    return idDevice ?? "";
  }

  /// Future method to get product
  Future<String> get product async {
    final product = await _channel.invokeMethod("product");
    return product ?? "";
  }

  /// Future method to get timeInfo
  Future<String> get timeInfo async {
    final timeInfo = await _channel.invokeMethod("timeInfo");
    return timeInfo ?? "";
  }
}