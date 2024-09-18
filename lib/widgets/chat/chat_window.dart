import 'package:flutter/material.dart';
import 'package:web_dashboard/widgets/chat/chat_header.dart';
import 'package:web_dashboard/widgets/chat/message_bubble.dart';
import 'package:web_dashboard/widgets/chat/message_input.dart';

class ChatWindow extends StatelessWidget {
  const ChatWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatHeader(
          name: 'James Zavel',
          status: 'offline',
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: const [
              // Longer chat history
              MessageBubble(
                message: 'Hello!',
                isSender: true,
                time: '10:00',
              ),
              MessageBubble(
                message: 'Yeah, everything is fine.',
                isSender: true,
                time: '10:01',
              ),
              MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),
              MessageBubble(
                message: 'Sure thing! Let me know if 2pm works for you.',
                isSender: false,
                time: '10:03',
              ),
              MessageBubble(
                message: 'I wanted to discuss the new design you sent.',
                isSender: true,
                time: '10:05',
              ),
              MessageBubble(
                message: 'I will send you the updated version shortly.',
                isSender: false,
                time: '10:06',
              ),
              MessageBubble(
                message: 'Do you have time to review it now?',
                isSender: true,
                time: '10:07',
              ),
              MessageBubble(
                message: 'Yes, I can take a look at it in 10 minutes.',
                isSender: false,
                time: '10:08',
              ),
              MessageBubble(
                message: 'Great! I’ll wait for your feedback.',
                isSender: true,
                time: '10:09',
              ),
              MessageBubble(
                message: 'Thanks! Talk soon.',
                isSender: false,
                time: '10:10',
              ),
            ],
          ),
        ),
        const MessageInput(),
      ],
    );
  }
}
