import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:web_dashboard/widgets/app_bar.dart';
import 'package:web_dashboard/widgets/chat/chat_list.dart';
import 'package:web_dashboard/widgets/chat/chat_window.dart';
import 'package:web_dashboard/widgets/chat/user_profile.dart';
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
                    child: const Column(
                      children: [
                        UserProfile(),
                        Divider(),
                        Expanded(
                          child: ChatList(),
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
