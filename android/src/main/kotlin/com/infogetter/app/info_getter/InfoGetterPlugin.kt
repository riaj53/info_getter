package com.infogetter.app.info_getter

import android.content.Context
import android.content.pm.PackageManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** InfoGetterPlugin */
class InfoGetterPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    // Get application context to access package manager
    context = flutterPluginBinding.applicationContext
    // Setup the channel to communicate with Dart
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "info_getter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    // Handle the 'getAppVersion' method call from Dart
    if (call.method == "getAppVersion") {
      try {
        // Retrieve package info and get the versionName
        val packageInfo = context.packageManager.getPackageInfo(context.packageName, 0)
        result.success(packageInfo.versionName)
      } catch (e: PackageManager.NameNotFoundException) {
        // Handle error if the package is not found
        result.error("UNAVAILABLE", "Version name not available.", null)
      }
    } else {
      // Handle unknown methods
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    // Clean up the channel when the plugin is detached
    channel.setMethodCallHandler(null)
  }
}
