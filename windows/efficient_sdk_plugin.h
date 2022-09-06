#ifndef FLUTTER_PLUGIN_EFFICIENT_SDK_PLUGIN_H_
#define FLUTTER_PLUGIN_EFFICIENT_SDK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace efficient_sdk {

class EfficientSdkPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EfficientSdkPlugin();

  virtual ~EfficientSdkPlugin();

  // Disallow copy and assign.
  EfficientSdkPlugin(const EfficientSdkPlugin&) = delete;
  EfficientSdkPlugin& operator=(const EfficientSdkPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace efficient_sdk

#endif  // FLUTTER_PLUGIN_EFFICIENT_SDK_PLUGIN_H_
