import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:info_getter/info_getter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getAppVersion test', (WidgetTester tester) async {
    // Correctly call the static method 'getAppVersion' directly on the class
    final String? version = await InfoGetter.getAppVersion();

    // Verify that a version string was successfully returned
    expect(version, isNotNull);
    expect(version?.isNotEmpty, true);

    // Optional: Print the version to see it in the test logs
    print('Retrieved App Version: $version');
  });
}

