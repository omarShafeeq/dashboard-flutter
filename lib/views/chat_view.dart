import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:web_dashboard/widgets/app_bar.dart';
import 'package:web_dashboard/widgets/side_menu.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 850;

    return Scaffold(
      body: SidebarDrawer(
        drawer: const SideMenu(),
        body: Column(
          children: [
            AppBar(
              leading: const DrawerIcon(),
              actions: const [
                AppBarWidget(),
              ],
            ),
            const SizedBox(height: 20), // Space above the content
            Expanded(
              child: Row(
                children: [
                  // Sidebar for mobile/tablet

                  Container(
                    width: 300,
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        const UserProfile(),
                        const Divider(),
                        Expanded(
                          child: const ChatList(),
                        ),
                      ],
                    ),
                  ),
                  // Chat window
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: const ChatWindow(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Placeholder image
          ),
          const SizedBox(width: 10),
          const Text(
            'Doris Larson',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.notifications),
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        _ChatItem(
          name: 'Brandon Smith',
          message: 'How are you today?',
          time: '4:30am',
          status: 'online',
        ),
        _ChatItem(
          name: 'James Zavel',
          message: 'typing...',
          time: '5:30am',
          status: 'offline',
        ),
        _ChatItem(
          name: 'Maria C',
          message: 'Are we going to have this week\'s planning meeting today?',
          time: 'Thu',
          status: 'offline',
        ),
        _ChatItem(
          name: 'Rhonda D',
          message: 'Please check these design assets...',
          time: 'Wed',
          status: 'online',
        ),
      ],
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String status; // status can be 'online' or 'offline'

  const _ChatItem({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://via.placeholder.com/50'), // Placeholder for profile image
          child: status == 'online'
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : null,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        trailing: Text(time, style: const TextStyle(color: Colors.grey)),
        onTap: () {
          // Handle chat item tap
        },
      ),
    );
  }
}

class ChatWindow extends StatelessWidget {
  const ChatWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ChatHeader(
          name: 'James Zavel',
          status: 'offline',
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: [
              // Longer chat history
              _MessageBubble(
                message: 'Hello!',
                isSender: true,
                time: '10:00',
              ),
              _MessageBubble(
                message: 'Yeah, everything is fine.',
                isSender: true,
                time: '10:01',
              ),
              _MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),
              _MessageBubble(
                message: 'Sure thing! Let me know if 2pm works for you.',
                isSender: false,
                time: '10:03',
              ),
              _MessageBubble(
                message: 'I wanted to discuss the new design you sent.',
                isSender: true,
                time: '10:05',
              ),
              _MessageBubble(
                message: 'I will send you the updated version shortly.',
                isSender: false,
                time: '10:06',
              ),
              _MessageBubble(
                message: 'Do you have time to review it now?',
                isSender: true,
                time: '10:07',
              ),
              _MessageBubble(
                message: 'Yes, I can take a look at it in 10 minutes.',
                isSender: false,
                time: '10:08',
              ),
              _MessageBubble(
                message: 'Great! I’ll wait for your feedback.',
                isSender: true,
                time: '10:09',
              ),
              _MessageBubble(
                message: 'Thanks! Talk soon.',
                isSender: false,
                time: '10:10',
              ),
            ],
          ),
        ),
        _MessageInput(),
      ],
    );
  }
}

class _ChatHeader extends StatelessWidget {
  final String name;
  final String status; // Can be 'online' or 'offline'

  const _ChatHeader({
    Key? key,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://via.placeholder.com/50'), // Placeholder for profile image
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                status,
                style: TextStyle(
                  color: status == 'online' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
        // Wrap icon buttons in a Row with MainAxisSize.min
        Row(
          mainAxisSize: MainAxisSize.min, // Prevents excess width
          children: [
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Handle call action
              },
            ),
            IconButton(
              icon: const Icon(Icons.video_call),
              onPressed: () {
                // Handle video call action
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                // Handle more options action
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  final String time;

  const _MessageBubble({
    Key? key,
    required this.message,
    required this.isSender,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 4),
            Text(time,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  const _MessageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle send message action
            },
          ),
        ],
      ),
    );
  }
}
