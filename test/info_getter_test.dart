import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_getter/info_getter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('info_getter');

  setUp(() {
    // This function runs before each test.
    // Here, we intercept calls on our channel and return a mock value.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'getAppVersion') {
            return '1.0.0-mock';
          }
          return null;
        });
  });

  tearDown(() {
    // This function runs after each test, cleaning up the mock.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getAppVersion returns mock version from method channel', () async {
    // We call the static method and expect our mock value.
    expect(await InfoGetter.getAppVersion(), '1.0.0-mock');
  });
}
