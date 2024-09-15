import 'package:flutter/material.dart';

class BuildTableHeader extends StatelessWidget {
  const BuildTableHeader(this.headers);

  final List<String> headers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: headers
            .map((header) => Expanded(
                  child: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
