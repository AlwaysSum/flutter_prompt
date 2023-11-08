#ifndef FLUTTER_PLUGIN_FLUTTER_PROMPT_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_PROMPT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_prompt {

class FlutterPromptPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterPromptPlugin();

  virtual ~FlutterPromptPlugin();

  // Disallow copy and assign.
  FlutterPromptPlugin(const FlutterPromptPlugin&) = delete;
  FlutterPromptPlugin& operator=(const FlutterPromptPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_prompt

#endif  // FLUTTER_PLUGIN_FLUTTER_PROMPT_PLUGIN_H_
