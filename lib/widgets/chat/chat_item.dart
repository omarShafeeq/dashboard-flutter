import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String status; // status can be 'online' or 'offline'

  const ChatItem({
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
          backgroundImage: const NetworkImage(
              'https://via.placeholder.com/50'), // Placeholder for profile image
          child: status == 'online'
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
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
