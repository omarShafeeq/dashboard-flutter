import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          // Notification Icon
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle notification selection if needed
              print(value);
            },
            offset: const Offset(0, 60), // Adjust offset to position dropdown
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  enabled: false,
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const PopupMenuDivider(),
                _buildNotificationItem(
                  title: 'Datacorp',
                  time: '1 min ago',
                  description: 'Caleb Flakelar commented on Admin',
                ),
                _buildNotificationItem(
                  title: 'Admin',
                  time: '1 hr ago',
                  description: 'New user registered',
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  enabled: false,
                  child: Text('Yesterday:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                _buildNotificationItem(
                  title: 'Cristina Pride',
                  time: '1 day ago',
                  description: 'Hi, How are you? What about our next meeting?',
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'view_all',
                  child: Text('View All'),
                ),
              ];
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250,
            color: Colors.grey[200],
            child: Column(
              children: [
                _SidebarItem(title: 'Inbox'),
                _SidebarItem(title: 'Starred'),
                _SidebarItem(title: 'Snoozed'),
                _SidebarItem(title: 'Draft'),
                _SidebarItem(title: 'Sent Mail'),
                _SidebarItem(title: 'Trash'),
                _SidebarItem(title: 'Important'),
                _SidebarItem(title: 'Spam'),
              ],
            ),
          ),
          // Email List
          Expanded(
            child: Column(
              children: [
                // Compose Button
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle compose email action
                        },
                        child: const Text('Compose'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Button color
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check_box_outline_blank),
                            onPressed: () {
                              // Handle select all action
                            },
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              // Handle the selected option
                              print(value);
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem<String>(
                                  value: 'header',
                                  enabled: false,
                                  child: Text(
                                    'More Options:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Mark as Unread',
                                  child: Text('Mark as Unread'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Add to Tasks',
                                  child: Text('Add to Tasks'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Add Star',
                                  child: Text('Add Star'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Mute',
                                  child: Text('Mute'),
                                ),
                              ];
                            },
                            icon: const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Action Buttons Above Email List
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.star_border),
                        onPressed: () {
                          // Handle star action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Handle delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.archive),
                        onPressed: () {
                          // Handle archive action
                        },
                      ),
                    ],
                  ),
                ),
                // Email List
                Expanded(
                  child: ListView(
                    children: [
                      _EmailItem(
                        sender: 'Lucas Kriebel (via Twitter)',
                        subject: 'You have a new message!',
                        time: '11:49 am',
                      ),
                      _EmailItem(
                        sender: 'Randy, me (5)',
                        subject: 'Let’s catch up!',
                        time: '5:01 am',
                      ),
                      _EmailItem(
                        sender: 'Andrew Zimmer',
                        subject: 'Meeting Confirmation',
                        time: 'Mar 8',
                      ),
                      _EmailItem(
                        sender: 'Infinity HR',
                        subject: 'Job Application Status',
                        time: 'Mar 8',
                      ),
                      // Add more email items here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static PopupMenuItem<String> _buildNotificationItem({
    required String title,
    required String time,
    required String description,
  }) {
    return PopupMenuItem<String>(
      enabled: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(time, style: const TextStyle(color: Colors.grey)),
          Text(description),
          const SizedBox(height: 8), // Space between notifications
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final String title;

  const _SidebarItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Handle sidebar item tap
      },
    );
  }
}

class _EmailItem extends StatelessWidget {
  final String sender;
  final String subject;
  final String time;

  const _EmailItem({
    Key? key,
    required this.sender,
    required this.subject,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sender, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subject),
      trailing: Text(time, style: const TextStyle(color: Colors.grey)),
      onTap: () {
        // Handle email item tap
      },
    );
  }
}
