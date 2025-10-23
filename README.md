
## Info Getter 📦

A simple, lightweight Flutter plugin to get the application version from pubspec.yaml on both Android and iOS. No frills, just the version.

## ✨ Features

 ✅ Minimalist API: Get the app version with a single line of code.

 📱 Cross-Platform: Works seamlessly on both Android and iOS.

 🚀 Lightweight: No unnecessary dependencies or code bloat.

 🔧 Easy to Integrate: Add to your project and start using in seconds.

 ## 🏁 Getting Started

To use this plugin in your project, add `info_getter` as a dependency in your `pubspec.yaml` file.

``` dependencies:
  info_getter: ^1.0.0 

  ```

Then, run flutter pub get in your terminal to install the package.

## Usage
Using the package is straightforward. Import the library and call the static method `InfoGetter.getAppVersion()` wherever you need it. It returns a `Future<String?>`, so you'll need to use `async/await` or `.then()`.

Here is a typical example of fetching the version in a StatefulWidget and displaying it.

``` dart
import 'package:flutter/material.dart';
// 1. Import the package
import 'package:info_getter/info_getter.dart';

class VersionDisplayWidget extends StatefulWidget {
  const VersionDisplayWidget({super.key});

  @override
  State<VersionDisplayWidget> createState() => _VersionDisplayWidgetState();
}

class _VersionDisplayWidgetState extends State<VersionDisplayWidget> {
  String _appVersion = 'Loading version...';

  @override
  void initState() {
    super.initState();
    _fetchAppVersion();
  }

  Future<void> _fetchAppVersion() async {
    // 2. Call the static method
    final String? version = await InfoGetter.getAppVersion();

    // 3. Update the state to display the version
    if (mounted) {
      setState(() {
        _appVersion = version ?? 'Unknown';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'App Version: $_appVersion',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

```

## 🤝 Contributing & Suggestions

Contributions are welcome! If you have a suggestion, find a bug, or want to improve the code, please feel free to open an issue or submit a pull request on the GitHub repository.

## 📜 License
MIT License

Copyright (c) 2025 Riazul Islam <mdriajakh@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions
