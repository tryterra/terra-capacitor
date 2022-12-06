#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(TerraPlugin, "TerraCapacitor",
    CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(initTerra, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(initConnection, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getUserId, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getBody, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getActivity, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getDaily, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getNutrition, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getSleep, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(getAthlete, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(activateSensor, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setUpBackgroundDelivery, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(readGlucoseData, CAPPluginReturnPromise);
)