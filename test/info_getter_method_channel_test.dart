import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_getter/info_getter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInfoGetter platform = MethodChannelInfoGetter();
  const MethodChannel channel = MethodChannel('info_getter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '1.0.0'; // Return a mock version number
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getAppVersion', () async {
    expect(await platform.getAppVersion(), '1.0.0');
  });
}
