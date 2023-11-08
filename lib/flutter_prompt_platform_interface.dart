import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_prompt_method_channel.dart';

abstract class FlutterPromptPlatform extends PlatformInterface {
  /// Constructs a FlutterPromptPlatform.
  FlutterPromptPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPromptPlatform _instance = MethodChannelFlutterPrompt();

  /// The default instance of [FlutterPromptPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPrompt].
  static FlutterPromptPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPromptPlatform] when
  /// they register themselves.
  static set instance(FlutterPromptPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
