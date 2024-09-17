import 'package:flutter/material.dart';

class BuildCardHeader extends StatelessWidget {
  const BuildCardHeader(this.title);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement export functionality here
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Export',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.white,
                  size: 12,
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 4.0), // Adjust padding
              minimumSize: const Size(0, 36),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              backgroundColor: const Color(0xff159488),
            ),
          ),
        ],
      ),
    );
  }
}
