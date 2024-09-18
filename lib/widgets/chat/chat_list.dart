import 'package:flutter/material.dart';
import 'package:web_dashboard/widgets/chat/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
        ChatItem(
          name: 'Brandon Smith',
          message: 'How are you today?',
          time: '4:30am',
          status: 'online',
        ),
        ChatItem(
          name: 'James Zavel',
          message: 'typing...',
          time: '5:30am',
          status: 'offline',
        ),
        ChatItem(
          name: 'Maria C',
          message: 'Are we going to have this week\'s planning meeting today?',
          time: 'Thu',
          status: 'offline',
        ),
        ChatItem(
          name: 'Rhonda D',
          message: 'Please check these design assets...',
          time: 'Wed',
          status: 'online',
        ),
      ],
    );
  }
}
