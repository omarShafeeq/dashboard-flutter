import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cards extends StatefulWidget {
  const Cards({
    required this.title,
    required this.colorForIcon,
    required this.iconData,
    required this.number,
    required this.colorofContainer,
    required this.iconofContainer,
    required this.textofContainer,
    required this.subTitle,
  });

  final String title;
  final Color colorForIcon;
  final IconData iconData;
  final String number;
  final Color colorofContainer;
  final IconData iconofContainer;
  final String textofContainer;
  final String subTitle;

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                    ),
                    // Rotate slightly on hover
                    Stack(
                      children: [
                        Transform.rotate(
                          // origin: Offset(1, 1),
                          angle: _isHovered ? 0.0 : 0.8,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: widget.colorForIcon,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 4,
                          child: Center(
                            // Center the icon in the container
                            child: Icon(
                              widget.iconData,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  widget.number,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 40,
                      color: widget.colorofContainer,
                      child: Row(
                        children: [
                          Icon(
                            widget.iconofContainer,
                            color: Colors.white,
                            size: 10,
                          ),
                          const SizedBox(
                              width: 4), // Add spacing between icon and text
                          Text(
                            widget.textofContainer,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        widget.subTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
