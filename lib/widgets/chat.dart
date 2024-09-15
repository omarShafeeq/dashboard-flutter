import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:web_dashboard/widgets/side_menu.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarDrawer(
        drawer: const SideMenu(),
        body: Column(
          children: [
            AppBar(
              leading: const DrawerIcon(),
            ),
            const SizedBox(height: 20), // Space above the content
            Expanded(
              child: Row(
                children: [
                  // Sidebar
                  Container(
                    width: 250,
                    color: Colors.blue[50],
                    child: Column(
                      children: const [
                        UserProfile(),
                        Divider(),
                        Expanded(
                          child: ChatList(), // Make ChatList expandable
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
        children: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Placeholder image
          ),
          SizedBox(width: 10),
          Text(
            'Doris Larson',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.notifications),
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
      children: const [
        _ChatItem(
            name: 'Brandon Smith',
            message: 'How are you today?',
            time: '4:30am'),
        _ChatItem(name: 'James Zavel', message: 'typing...', time: '5:30am'),
        _ChatItem(
            name: 'Maria C',
            message:
                'Are we going to have this week\'s planning meeting today?',
            time: 'Thu'),
        _ChatItem(
            name: 'Rhonda D',
            message: 'Please check these design assets...',
            time: 'Wed'),
        // Add more chat items as needed
        _ChatItem(
            name: 'Alice Johnson',
            message: 'Let\'s catch up later.',
            time: 'Mon'),
        _ChatItem(
            name: 'Mike Brown',
            message: 'Looking forward to our meeting.',
            time: 'Sun'),
        _ChatItem(
            name: 'Sophie Turner', message: 'Happy birthday!', time: 'Fri'),
        // Add more items for testing scroll
      ],
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const _ChatItem({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
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
        Expanded(
          child: ListView(
            children: const [
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
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),
              _MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),
              _MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),

              _MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),
              _MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
                time: '10:01',
              ),
              _MessageBubble(
                message: 'Hi, how are you? What about our next meeting?',
                isSender: false,
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
              // Add more message bubbles as needed
              _MessageBubble(
                message: 'What do you think about the project?',
                isSender: true,
                time: '10:05',
              ),
              _MessageBubble(
                message: 'I think it’s going well.',
                isSender: false,
                time: '10:06',
              ),
              // Add more items for testing scroll
            ],
          ),
        ),
        _MessageInput(),
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
