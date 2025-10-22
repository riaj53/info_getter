// In order to *not* need this ignore, consider extracting the web platform logic
// into a separate package, depended on only by the main package package.
// ignore: unused_import
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'info_getter_platform_interface.dart';

/// A web implementation of the InfoGetterPlatform of the InfoGetter plugin.
class InfoGetterWeb extends InfoGetterPlatform {
  /// Constructs a InfoGetterWeb object.
  InfoGetterWeb();

  static void registerWith(Registrar registrar) {
    InfoGetterPlatform.instance = InfoGetterWeb();
  }

  /// Returns a fake version number for the web platform.
  @override
  Future<String?> getAppVersion() async {
    return '1.0.0-web';
  }
}
