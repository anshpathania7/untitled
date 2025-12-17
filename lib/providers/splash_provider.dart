import 'package:cometchat_sdk/cometchat_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/services/navigator_service.dart';
import 'package:untitled/ui/chat_screen.dart';
import 'package:untitled/ui/login_screen.dart';

class SplashProvider extends ChangeNotifier {
  bool _initializing = true;

  bool get isInitializing => _initializing;
  set setInitializing(bool v) {
    _initializing = v;
    notifyListeners();
  }

  void init() async {
    await _initAndAuthorizeCometChat();
  }

  Future<void> _initAndAuthorizeCometChat() async {
    setInitializing = true;
    final appSettings = (AppSettingsBuilder()
          ..subscriptionType = CometChatSubscriptionType.allUsers
          ..region = CometChatKeys.CC_REGION
          ..autoEstablishSocketConnection = true)
        .build();
    bool successfullyInit = false;
    await CometChat.init(
      CometChatKeys.CC_APP_ID,
      appSettings,
      onSuccess: (String successMessage) {
        debugPrint("Initialization completed successfully  $successMessage");
        successfullyInit = true;
      },
      onError: (CometChatException excep) {
        debugPrint("Initialization failed with exception: ${excep.message}");
      },
    );
    if (successfullyInit) {
      await _loginIfUserAuthorized();
    } else {
      //handle on error here
      NavigationService.removeEveryAndPush(screen: LoginScreen());
    }
  }

  Future<void> _loginIfUserAuthorized() async {
    final getLoggedInUser = await CometChat.getUserAuthToken();
    if (getLoggedInUser == null) {
      NavigationService.removeEveryAndPush(screen: LoginScreen());
    } else {
      NavigationService.removeEveryAndPush(screen: ChatScreen());
    }
  }
}
