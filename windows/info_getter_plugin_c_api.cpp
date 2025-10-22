#include "include/info_getter/info_getter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "info_getter_plugin.h"

void InfoGetterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  info_getter::InfoGetterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
