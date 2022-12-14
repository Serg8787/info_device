package com.tsybulnik.info_device

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** InfoDevicePlugin */
class InfoDevicePlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel



    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "info_device")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
//    if (call.method == "getPlatformVersion") {
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
//    } else {
//      result.notImplemented()
//    }
        when (call.method) {
            "versionRelease" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            "modelPhone" -> result.success("Model ${android.os.Build.MODEL}")
            "brandPhone" -> result.success("Brand ${android.os.Build.BRAND}")
            "device" -> result.success("Device ${android.os.Build.DEVICE}")
            "display" -> result.success("Display ${android.os.Build.DISPLAY}")
            "baseOS" -> result.success("Base OS ${android.os.Build.VERSION.BASE_OS}")
            "hardware" -> result.success("HArdware ${android.os.Build.HARDWARE}")
            "idDevice" -> result.success("ID ${android.os.Build.ID}")
            "product" -> result.success("Product ${android.os.Build.PRODUCT}")
            "timeInfo" -> result.success("TimeInfo ${android.os.Build.TIME}")
            else -> result.notImplemented()
        }
    }

        override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
            channel.setMethodCallHandler(null)
        }
    }

