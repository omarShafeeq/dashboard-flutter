import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalesDashboard extends StatelessWidget {
  final double returningCustomerPercentage = 0.67;
  final List<Map<String, dynamic>> locations = [
    {"name": "Brooklyn, New York", "sales": 72000},
    {"name": "The Castro, San Francisco", "sales": 39000},
    {"name": "Kovan, Singapore", "sales": 61000},
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Define responsive width and height
    double containerHeight = screenSize.height * 0.6; // 50% of screen height
    double containerWidth = screenSize.width < 600
        ? screenSize.width * 0.9
        : 400; // 90% width for small screens, fixed for larger

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: containerHeight,
        width: containerWidth,
        child: Column(
          children: [
            // Custom Circular Indicator
            CustomCircularIndicator(
              percentage: returningCustomerPercentage,
              size: containerWidth * 0.5, // Responsive size
            ),
            const SizedBox(height: 20),
            const Text(
              'Returning Customer',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            const SizedBox(height: 30),
            // Sales Data
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locations[index]['name'],
                        style: const TextStyle(
                            fontSize: 14), // Responsive font size
                      ),
                      LinearProgressIndicator(
                        value: locations[index]['sales'] / 100000,
                        backgroundColor: Colors.grey[300],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircularIndicator extends StatefulWidget {
  final double percentage;
  final double size;

  CustomCircularIndicator({required this.percentage, required this.size});

  @override
  _CustomCircularIndicatorState createState() =>
      _CustomCircularIndicatorState();
}

class _CustomCircularIndicatorState extends State<CustomCircularIndicator> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: CircularIndicatorPainter(widget.percentage, _isHovered),
          ),
          Text(
            '${(widget.percentage * 100).toInt()}%',
            style: TextStyle(
              fontSize: widget.size * 0.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIndicatorPainter extends CustomPainter {
  final double percentage;
  final bool isHovered;

  CircularIndicatorPainter(this.percentage, this.isHovered);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color =
          isHovered ? Colors.blueAccent : Colors.blue // Change color on hover
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final double startAngle = -280 * (3.14 / 180);
    final double sweepAngle = 360 * percentage * (3.14 / 360);
    final double radius = size.width / 2;

    // Draw the circular segments
    for (int i = 0; i < 30; i++) {
      final double angle = startAngle + (i * (1.5 * 3.14 / 30));
      final double nextAngle = angle + (1 * 3.14 / 50);

      paint.color = i < (percentage * 40)
          ? (isHovered ? Colors.lightBlueAccent : Colors.blue)
          : Colors.grey[100]!;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        angle,
        (2 * 3.14 / 70),
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
