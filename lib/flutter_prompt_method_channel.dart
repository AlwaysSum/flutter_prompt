import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_prompt_platform_interface.dart';

/// An implementation of [FlutterPromptPlatform] that uses method channels.
class MethodChannelFlutterPrompt extends FlutterPromptPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_prompt');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
