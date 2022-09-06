#include "include/efficient_sdk/efficient_sdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "efficient_sdk_plugin.h"

void EfficientSdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  efficient_sdk::EfficientSdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
