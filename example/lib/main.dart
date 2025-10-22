import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
// 1. Import your new package
import 'package:info_getter/info_getter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// This is your splash screen widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _appVersion = 'Loading...';

  @override
  void initState() {
    super.initState();
    // 2. Call the function to get the app version when the screen loads
    _initAppVersion();
  }

  Future<void> _initAppVersion() async {
    String appVersion;
    try {
      // 3. Use your package to get the version
      appVersion = await InfoGetter.getAppVersion() ?? 'Unknown version';
    } on PlatformException {
      appVersion = 'Failed to get version.';
    }

    if (!mounted) return;

    setState(() {
      _appVersion = appVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 24),
            const Text(
              'My Awesome App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            // 4. Display the version on your splash screen
            Text(
              'Version: $_appVersion',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
