import Flutter
import UIKit

public class InfoGetterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Setup the channel to communicate with Dart
    let channel = FlutterMethodChannel(name: "info_getter", binaryMessenger: registrar.messenger())
    let instance = InfoGetterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // Handle the 'getAppVersion' method call from Dart
    if call.method == "getAppVersion" {
        // Retrieve the version string from the app's main bundle
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            result(version)
        } else {
            // Handle error if the version string is not found
            result(FlutterError(code: "UNAVAILABLE", message: "Version not available", details: nil))
        }
    } else {
        // Handle unknown methods
        result(FlutterMethodNotImplemented)
    }
  }
}
