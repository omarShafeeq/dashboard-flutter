import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () => _showNotificationDialog(context),
                child: IconButton(
                  onPressed: () {
                    _showNotificationDialog(context);
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: _isHovered ? Colors.blue : Colors.grey[600],
                    size: _isHovered ? 32 : 32,
                  ),
                ),
              ),
              // Badge for notification count
              Positioned(
                top: 0,
                right: 0,
                child: _isHovered
                    ? Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '2', // Dummy notification count
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 300, // Set a fixed width
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNotificationItem(
                      title: "Datacorp",
                      subtitle: "Caleb Flakelar commented on Admin",
                      time: "1 min ago",
                    ),
                    _buildNotificationItem(
                      title: "Admin",
                      subtitle: "New user registered",
                      time: "1 hr ago",
                    ),
                    _buildNotificationItem(
                      title: "Cristina Pride",
                      subtitle: "Hi, How are you? What about our next meeting?",
                      time: "1 day ago",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("View All"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(
      {required String title, required String subtitle, required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(subtitle),
          Text(
            time,
            style: const TextStyle(color: Colors.grey),
          ),
          const Divider(), // Divider between notifications
        ],
      ),
    );
  }
}
