import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  final User user;
  const MessagesScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CometChatMessageHeader(
            user: user,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          Expanded(
            child: CometChatMessageList(
              user: user,
              padding: EdgeInsets.zero,
            ),
          ),
          CometChatMessageComposer(
            user: user,
            padding: EdgeInsets.zero,
            onSendButtonTap: (context, basemessage, preview) {
              print(basemessage.metadata.toString());
            },
          ),
        ],
      ),
    );
  }
}
