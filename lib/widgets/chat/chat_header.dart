import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final String name;
  final String status; // Can be 'online' or 'offline'

  const ChatHeader({
    Key? key,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
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
