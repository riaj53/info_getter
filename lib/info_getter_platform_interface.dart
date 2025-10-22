import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'info_getter_method_channel.dart';

abstract class InfoGetterPlatform extends PlatformInterface {
  /// Constructs a InfoGetterPlatform.
  InfoGetterPlatform() : super(token: _token);

  static final Object _token = Object();

  static InfoGetterPlatform _instance = MethodChannelInfoGetter();

  /// The default instance of [InfoGetterPlatform] to use.
  ///
  /// Defaults to [MethodChannelInfoGetter].
  static InfoGetterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InfoGetterPlatform] when
  /// they register themselves.
  static set instance(InfoGetterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the application version string.
  Future<String?> getAppVersion() {
    throw UnimplementedError('getAppVersion() has not been implemented.');
  }
}
