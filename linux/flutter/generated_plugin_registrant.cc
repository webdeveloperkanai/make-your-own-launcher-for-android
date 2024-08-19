//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dsi_pro/d_s_i_pro_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) dsi_pro_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DSIProPlugin");
  d_s_i_pro_plugin_register_with_registrar(dsi_pro_registrar);
}
