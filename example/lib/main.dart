import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:info_device/device_information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _modelPhone = "";
  String _brandPhone = 'Unknown';
  String _display = 'Unknown';
  String _baseOS = 'Unknown';
  String _hardware = 'Unknown';
  String _idDevice = 'Unknown';
  String _product = 'Unknown';
  String _timeInfo = 'Unknown';
  final _infoDevicePlugin = DeviceInformation();


  @override
  void initState() {
    super.initState();
    initDeviceState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initDeviceState() async {
    String platformVersion;
    dynamic modelPhone;
    dynamic brandPhone;
    dynamic display;
    dynamic baseOS;
    dynamic hardware;
    dynamic idDevice;
    dynamic product;
    dynamic timeInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _infoDevicePlugin.platformVersion ?? 'Unknown platform version';
      modelPhone =
          await _infoDevicePlugin.modelPhone?? 'Unknown platform version';
      brandPhone =
          await _infoDevicePlugin.brandPhone ?? 'Unknown platform version';
      display =
          await _infoDevicePlugin.display ?? 'Unknown platform version';
      baseOS =
          await _infoDevicePlugin.baseOS ?? 'Unknown platform version';
      hardware =
          await _infoDevicePlugin.hardware ?? 'Unknown platform version';
      idDevice =
          await _infoDevicePlugin.idDevice ?? 'Unknown platform version';
      product =
          await _infoDevicePlugin.product ?? 'Unknown platform version';
      timeInfo =
          await _infoDevicePlugin.timeInfo ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get data.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _modelPhone = modelPhone ;
      _brandPhone = brandPhone ;
      _baseOS = baseOS ;
      _display = display ;
      _hardware = hardware ;
      _idDevice = idDevice ;
      _product = product ;
      _timeInfo = timeInfo ;

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Plugin device info')),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox(height: 50),
            Text('$_platformVersion\n'),
            Text('$_modelPhone\n'),
            Text('$_brandPhone\n'),
            Text('$_baseOS\n'),
            Text('$_display\n'),
            Text('$_hardware\n'),
            Text('$_product\n'),
            Text('$_timeInfo\n'),
            Text('$_idDevice\n'),

          ]
          ),
        ),
      ),
    );
  }
}


