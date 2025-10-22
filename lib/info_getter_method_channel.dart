import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'info_getter_platform_interface.dart';

/// An implementation of [InfoGetterPlatform] that uses method channels.
class MethodChannelInfoGetter extends InfoGetterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('info_getter');

  @override
  Future<String?> getAppVersion() async {
    final version = await methodChannel.invokeMethod<String>('getAppVersion');
    return version;
  }
}
