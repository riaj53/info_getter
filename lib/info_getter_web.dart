// Imports are corrected
import 'dart:async';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// The unused 'package:web/web.dart' import has been removed.
// import 'package:web/web.dart' as web;

import 'info_getter_platform_interface.dart';

/// A web implementation of the InfoGetterPlatform.
///
/// This class is used to register the web-specific implementation
/// of the platform interface.
class InfoGetterWeb extends InfoGetterPlatform {
  /// Registers this class as the default instance of [InfoGetterPlatform].
  static void registerWith(Registrar registrar) {
    InfoGetterPlatform.instance = InfoGetterWeb();
  }

  /// Returns a placeholder version for the web platform.
  ///
  /// The `pubspec.yaml` version is not directly accessible on the web
  /// in the same way it is on mobile.
  @override
  Future<String?> getAppVersion() async {
    // The unused 'location' variable has been removed to clear the lint.
    // final location = web.window.location;

    // 'print' statement removed to clear the lint.
    // print('Web platform detected at: ${location.href}');

    // Return a placeholder string
    return '1.0.0-web';
  }
}

