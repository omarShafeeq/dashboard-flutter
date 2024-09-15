import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HoverChartView extends StatefulWidget {
  const HoverChartView({Key? key}) : super(key: key);

  @override
  _HoverChartViewState createState() => _HoverChartViewState();
}

class _HoverChartViewState extends State<HoverChartView> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Line chart with hover effect
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  // Grid customization
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    horizontalInterval: 10,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey[400]!,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey[400]!,
                        strokeWidth: 1,
                      );
                    },
                  ),

                  // Axis customization
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, _) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        getTitlesWidget: (value, _) {
                          return Text(
                            'Day ${value.toInt() + 1}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                          );
                        },
                      ),
                    ),
                  ),

                  // Line customization
                  lineBarsData: [
                    LineChartBarData(
                      spots: _buildLineChartData(),
                      isCurved: true,
                      barWidth: 5,
                      color: _hoveredIndex != null
                          ? Colors.blueAccent
                          : Colors.teal,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.teal.withOpacity(0.2),
                      ),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          final color = _hoveredIndex == index
                              ? Colors.red
                              : Colors.white;
                          return FlDotCirclePainter(
                            radius: 6,
                            color: color,
                            strokeWidth: 2,
                          );
                        },
                      ),
                    ),
                  ],

                  // Tooltip customization
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                        tooltipMargin: 8,
                        tooltipPadding: const EdgeInsets.all(8),
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((touchedSpot) {
                            return LineTooltipItem(
                              'Day: ${touchedSpot.x.toInt() + 1}\nValue: ${touchedSpot.y.toStringAsFixed(2)}',
                              const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            );
                          }).toList();
                        },
                        tooltipHorizontalOffset: -20
                        // Use the following property for tooltip background customization
                        // Set tooltip background color
                        ),
                    handleBuiltInTouches: true,
                    touchCallback: (event, response) {
                      if (event.isInterestedForInteractions &&
                          response != null &&
                          response.lineBarSpots != null) {
                        setState(() {
                          _hoveredIndex =
                              response.lineBarSpots!.first.x.toInt();
                        });
                      } else {
                        setState(() {
                          _hoveredIndex = null;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Displaying hover details
            // _hoveredIndex != null
            //     ? Text(
            //         'You are hovering over point #${_hoveredIndex!}',
            //         style:
            //             const TextStyle(fontSize: 18, color: Colors.blueAccent),
            //       )
            //     : const Text(
            //         'Hover over a point to see details',
            //         style: TextStyle(fontSize: 18, color: Colors.black),
            //       ),
          ],
        ),
      ),
    );
  }

  // Function to create line chart data points with dummy data
  List<FlSpot> _buildLineChartData() {
    return List.generate(7, (index) {
      return FlSpot(
        index.toDouble(),
        (index * 10.0) +
            (index % 2 == 0 ? 5 : 0), // Some variation for better visibility
      );
    });
  }
}
