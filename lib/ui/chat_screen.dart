import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/services/navigator_service.dart';
import 'package:untitled/ui/contacts_screen.dart';
import 'package:untitled/ui/login_screen.dart';
import 'package:untitled/ui/messages_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _initCometChatUiKit();
  }

  void _initCometChatUiKit() async {
    UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
          ..subscriptionType = CometChatSubscriptionType.allUsers
          ..autoEstablishSocketConnection = true
          ..region = CometChatKeys.CC_REGION
          ..appId = CometChatKeys.CC_APP_ID
          ..authKey = CometChatKeys.CC_AUTH_KEY
          //Should provide inbuilt empty option
          ..extensions = CometChatUIKitChatExtensions
              .getDefaultExtensions() //Replace this with empty array, if you want to disable all extensions

        )
        .build();

    CometChatUIKit.init(
      uiKitSettings: uiKitSettings,
      onSuccess: (successMessage) async {
        debugPrint('CometChat Initialized');
        isLoading = false;
        setState(() {});
      },
      onError: (error) {
        debugPrint('CometChat Initialization error');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.contacts),
        onPressed: () => NavigationService.push(
          screen: ContactsScreen(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CometChatConversations(
              showBackButton: false,
              title: "Demo Chat",
              appBarOptions: [
                IconButton(
                  onPressed: () async {
                    bool successfullyLoggedOut = false;
                    await CometChat.logout(
                      onSuccess: (success) {
                        successfullyLoggedOut = true;
                      },
                      onError: (error) {},
                    );
                    if (successfullyLoggedOut) {
                      NavigationService.removeEveryAndPush(
                          screen: LoginScreen());
                    }
                  },
                  icon: Icon(
                    Icons.logout,
                  ),
                )
              ],
              onItemTap: (convo) {
                //this whole part is confusing
                if (convo.conversationWith is User) {
                  NavigationService.push(
                      screen:
                          MessagesScreen(user: convo.conversationWith as User));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
