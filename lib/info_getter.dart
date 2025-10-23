import 'dart:async';

import 'package:flutter/services.dart';

/// A class to get application information.
class InfoGetter {
  static const MethodChannel _channel = MethodChannel('info_getter');

  /// Returns the application version string (e.g., "1.0.0").
  ///
  /// This value is derived from the `version` key in your `pubspec.yaml` file.
  static Future<String?> getAppVersion() async {
    final String? version = await _channel.invokeMethod('getAppVersion');
    return version;
  }
}
