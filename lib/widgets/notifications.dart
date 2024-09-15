import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationDropdownButton extends StatefulWidget {
  @override
  _NotificationDropdownButtonState createState() =>
      _NotificationDropdownButtonState();
}

class _NotificationDropdownButtonState
    extends State<NotificationDropdownButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: PopupMenuButton<String>(
        tooltip: '',
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(
          Icons.notifications,
          size: 30,
          color: _isHovered
              ? Colors.blue
              : Colors.grey[600], // Change color on hover
        ),
        offset: Offset(0, 50),
        itemBuilder: (BuildContext context) => [
          // Header
          PopupMenuItem<String>(
            enabled: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {},
                  icon: Text('Clear All',
                      style: TextStyle(color: Colors.grey[600])),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(),
          // Notifications Today
          PopupMenuItem<String>(
            enabled: false,
            child: Text('TODAY', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ..._buildNotificationItems([
            {
              'title': 'Datacorp',
              'time': '1 min ago',
              'subtitle': 'Caleb Flakelar commented on Admin',
              'icon': Icons.business, // Specify the icon
            },
            {
              'title': 'Admin',
              'time': '1 hr ago',
              'subtitle': 'New user registered',
              'icon': Icons.person_add, // Specify the icon
            },
          ]),
          const PopupMenuDivider(),
          // Notifications Yesterday
          PopupMenuItem<String>(
            enabled: false,
            child: Text('YESTERDAY',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ..._buildNotificationItems([
            {
              'title': 'Cristina Pride',
              'time': '1 day ago',
              'subtitle': 'Hi, How are you? What about our next meeting?',
              'icon': Icons.chat, // Specify the icon
            },
          ]),
          const PopupMenuDivider(),
          // View All
          PopupMenuItem<String>(
            value: 'view_all',
            child: Center(
                child: Text('View All', style: TextStyle(color: Colors.blue))),
          ),
        ],
        onSelected: (value) {
          if (value == 'view_all') {
            // Handle "View All" action
          }
        },
      ),
    );
  }

  // Helper method to build notification items
  List<PopupMenuItem<String>> _buildNotificationItems(
      List<Map<String, dynamic>> notifications) {
    return notifications.map((notification) {
      return PopupMenuItem<String>(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: CircleAvatar(
                    radius: 18,
                    child: Icon(
                      notification['icon'], // Use the specified icon
                      size: 18,
                      color: Colors.white, // Change icon color if needed
                    ),
                    backgroundColor: Colors.blue, // Background color of avatar
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(notification['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(notification['time']!,
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(notification['subtitle']!,
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      );
    }).toList();
  }
}
