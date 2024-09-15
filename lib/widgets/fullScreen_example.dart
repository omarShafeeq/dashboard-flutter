import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:html' as html;

class FullScreenExample extends StatefulWidget {
  @override
  _FullScreenExampleState createState() => _FullScreenExampleState();
}

class _FullScreenExampleState extends State<FullScreenExample> {
  bool _isFullScreen = false;

  void _toggleFullScreen() {
    if (_isFullScreen) {
      // Exit full screen
      html.document.exitFullscreen();
    } else {
      // Request full screen
      html.document.documentElement?.requestFullscreen();
    }

    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
        size: 32,
        color: Colors.grey[600],
      ),
      onPressed: _toggleFullScreen,
    );
  }
}
