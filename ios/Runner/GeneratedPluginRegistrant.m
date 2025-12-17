//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<cometchat_chat_uikit/CometchatChatUikitPlugin.h>)
#import <cometchat_chat_uikit/CometchatChatUikitPlugin.h>
#else
@import cometchat_chat_uikit;
#endif

#if __has_include(<cometchat_sdk/CometchatPlugin.h>)
#import <cometchat_sdk/CometchatPlugin.h>
#else
@import cometchat_sdk;
#endif

#if __has_include(<cometchat_uikit_shared/CometchatUikitSharedPlugin.h>)
#import <cometchat_uikit_shared/CometchatUikitSharedPlugin.h>
#else
@import cometchat_uikit_shared;
#endif

#if __has_include(<image_picker_ios/FLTImagePickerPlugin.h>)
#import <image_picker_ios/FLTImagePickerPlugin.h>
#else
@import image_picker_ios;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<url_launcher_ios/URLLauncherPlugin.h>)
#import <url_launcher_ios/URLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

#if __has_include(<video_player_avfoundation/FVPVideoPlayerPlugin.h>)
#import <video_player_avfoundation/FVPVideoPlayerPlugin.h>
#else
@import video_player_avfoundation;
#endif

#if __has_include(<webview_flutter_wkwebview/WebViewFlutterPlugin.h>)
#import <webview_flutter_wkwebview/WebViewFlutterPlugin.h>
#else
@import webview_flutter_wkwebview;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CometchatChatUikitPlugin registerWithRegistrar:[registry registrarForPlugin:@"CometchatChatUikitPlugin"]];
  [CometchatPlugin registerWithRegistrar:[registry registrarForPlugin:@"CometchatPlugin"]];
  [CometchatUikitSharedPlugin registerWithRegistrar:[registry registrarForPlugin:@"CometchatUikitSharedPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [URLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"URLLauncherPlugin"]];
  [FVPVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FVPVideoPlayerPlugin"]];
  [WebViewFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"WebViewFlutterPlugin"]];
}

@end
