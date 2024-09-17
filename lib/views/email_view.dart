import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:web_dashboard/widgets/app_bar.dart';
import 'package:web_dashboard/widgets/side_menu.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Row(
                children: [
                  // Sidebar
                  Container(
                    width: 250,
                    color: Colors.grey[200],
                    child: const Column(
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
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
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
                              const SizedBox(
                                width: 10,
                              ),
                              // Icon Buttons Row
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    _IconButton(
                                      icon: Icons.picture_as_pdf,
                                      onPressed: () {
                                        // Handle action
                                      },
                                    ),
                                    _IconButton(
                                      icon: Icons.warning,
                                      onPressed: () {
                                        // Handle action
                                      },
                                    ),
                                    _IconButton(
                                      icon: Icons.delete,
                                      onPressed: () {
                                        // Handle delete action
                                      },
                                    ),
                                    _IconButton(
                                      icon: Icons.folder,
                                      onPressed: () {
                                        // Handle folder action
                                      },
                                    ),
                                    PopupMenuButton<String>(
                                      onSelected: (value) {
                                        // Handle selected option
                                      },
                                      offset: const Offset(0, 40),
                                      itemBuilder: (BuildContext context) {
                                        return {
                                          'Mark as Unread',
                                          'Add to Tasks',
                                          'Add Star',
                                          'Mute',
                                        }.map((String choice) {
                                          return PopupMenuItem<String>(
                                            value: choice,
                                            child: Text(choice),
                                          );
                                        }).toList();
                                      },
                                      icon: const Icon(Icons.more_horiz),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Action Buttons Above Email List
                        Expanded(
                          child: ListView(
                            children: const [
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
            ),
          ],
        ),
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
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
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

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _IconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(),
      iconSize: 20,
      color: Colors.black54,
    );
  }
}
