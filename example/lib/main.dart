import 'package:flutter/material.dart';
import 'dart:async';
import 'package:info_getter/info_getter.dart'; // Import your package

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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _appVersion = 'loading...';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    // Simulate a short delay for the splash screen
    await Future.delayed(const Duration(seconds: 2));

    String? version;
    try {
      // Call your package's method
      version = await InfoGetter.getAppVersion();
    } catch (e) {
      // Handle any potential errors
      version = 'Error';
    }

    if (mounted) {
      setState(() {
        _appVersion = version ?? 'Unknown';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A nice deep blue, similar to the Flutter logo
      backgroundColor: const Color(0xFF0D47A1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A simple app icon placeholder
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                // The color `0xFF0D47A1` is R: 13, G: 71, B: 161
                color: const Color.fromRGBO(13, 71, 161, 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 60,
              ),
            ),
            const SizedBox(height: 24),
            // Your App Title
            const Text(
              'Info Getter Example',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 80),
            // The version number from your package
            Text(
              'Version: $_appVersion',
              style: const TextStyle(
                fontSize: 16,
                // This is the fix for the lint on line 98.
                // Colors.white is R:255, G:255, B:255. 0.7 is the opacity.
                color: Color.fromRGBO(255, 255, 255, 0.7),
              ),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

