import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_device/info_device_method_channel.dart';

void main() {
  MethodChannelInfoDevice platform = MethodChannelInfoDevice();
  const MethodChannel channel = MethodChannel('info_device');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getInfoDevice(), '42');
  });
}
