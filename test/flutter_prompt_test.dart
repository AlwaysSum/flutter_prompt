import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_prompt/flutter_prompt.dart';
import 'package:flutter_prompt/flutter_prompt_platform_interface.dart';
import 'package:flutter_prompt/flutter_prompt_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPromptPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPromptPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPromptPlatform initialPlatform = FlutterPromptPlatform.instance;

  test('$MethodChannelFlutterPrompt is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPrompt>());
  });

  test('getPlatformVersion', () async {
    Prompt flutterPromptPlugin = Prompt();
    MockFlutterPromptPlatform fakePlatform = MockFlutterPromptPlatform();
    FlutterPromptPlatform.instance = fakePlatform;

    expect(await flutterPromptPlugin.getPlatformVersion(), '42');
  });
}
