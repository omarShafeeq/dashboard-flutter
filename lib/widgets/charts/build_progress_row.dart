import 'package:flutter/material.dart';

class BuildProgressRow extends StatelessWidget {
  BuildProgressRow(this.label, this.value, this.total, {required this.color});

  final String label;
  final int value;
  final int total;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label)),
          Expanded(child: Text(value.toString())),
          Expanded(
            child: LinearProgressIndicator(
              value: value / total,
              backgroundColor: Colors.grey[300],
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
