import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


// Import your package
import 'package:info_getter/info_getter.dart';

void main() {
  // This line is now recognized
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getAppVersion test', (WidgetTester tester) async {
    // 1. Call the static method directly on the class
    final String? version = await InfoGetter.getAppVersion();

    // 2. Check that the version is not null and not empty
    // This confirms the platform channel communication worked.
    expect(version?.isNotEmpty, true);

    // 'print' statement removed to clear the lint.
    // print('Retrieved AppVersion: $version');
  });
}

