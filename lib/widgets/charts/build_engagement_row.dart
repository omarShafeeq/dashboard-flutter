import 'package:flutter/material.dart';

class BuildEngagementRow extends StatelessWidget {
  const BuildEngagementRow(this.label, this.sessions, this.views);

  final String label;
  final int sessions;
  final int views;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label)),
          Expanded(child: Text(sessions.toString())),
          Expanded(child: Text(views.toString())),
        ],
      ),
    );
  }
}
