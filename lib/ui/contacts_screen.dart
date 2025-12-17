import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:untitled/services/navigator_service.dart';

import 'messages_screen.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CometChatListBase(
              container: CometChatUsers(
                onItemTap: (context, user) => NavigationService.push(
                    screen: MessagesScreen(
                  user: user,
                )),
              ),
              hideAppBar: true,
              hideSearch: true,
            ),
          ),
        ],
      ),
    );
  }
}
