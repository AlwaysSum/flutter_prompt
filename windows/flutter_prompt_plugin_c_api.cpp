#include "include/flutter_prompt/flutter_prompt_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_prompt_plugin.h"

void FlutterPromptPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_prompt::FlutterPromptPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
