import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HoverChartView extends StatefulWidget {
  const HoverChartView({Key? key}) : super(key: key);

  @override
  _HoverChartViewState createState() => _HoverChartViewState();
}

class _HoverChartViewState extends State<HoverChartView> {
  int? _hoveredIndex;
  double? _hoveredValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double chartWidth = constraints.maxWidth; // Use the max width available
        double chartHeight = 400; // Fixed height for consistency

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Area chart with hover effect
              Card(
                child: SizedBox(
                  height: chartHeight,
                  width: chartWidth, // Set the width dynamically
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: true,
                        horizontalInterval: 10,
                        verticalInterval: 500,
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
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, _) {
                              return Text(
                                '\$${value.toInt()}',
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
                      lineBarsData: [
                        LineChartBarData(
                          spots: _buildRevenueData(),
                          isCurved: true,
                          curveSmoothness: 0.2,
                          color: Colors.teal,
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.teal.withOpacity(0.3),
                          ),
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 6,
                                color: Colors.white,
                                strokeWidth: 2,
                              );
                            },
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          tooltipMargin: 8,
                          tooltipPadding: const EdgeInsets.all(8),
                          getTooltipItems: (touchedSpots) {
                            if (_hoveredIndex != null &&
                                _hoveredValue != null) {
                              return [
                                LineTooltipItem(
                                  'Day: ${_hoveredIndex! + 2}\nRevenue: \$${_hoveredValue!.toStringAsFixed(2)}',
                                  const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ];
                            }
                            return [];
                          },
                        ),
                        handleBuiltInTouches: true,
                        touchCallback: (event, response) {
                          if (event.isInterestedForInteractions) {
                            final touchX = event.localPosition!.dx;
                            final index = (touchX /
                                    (chartWidth /
                                        (_buildRevenueData().length - 1)))
                                .clamp(0, _buildRevenueData().length - 1)
                                .toInt();

                            // Update hovered index and value
                            setState(() {
                              _hoveredIndex = index;
                              _hoveredValue = _buildRevenueData()[index].y;
                            });
                          } else {
                            setState(() {
                              _hoveredIndex = null;
                              _hoveredValue = null;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to create revenue data points for a week
  List<FlSpot> _buildRevenueData() {
    return [
      const FlSpot(0, 1500), // Day 1
      const FlSpot(1, 2500), // Day 2
      const FlSpot(2, 1800), // Day 3
      const FlSpot(3, 3000), // Day 4
      const FlSpot(4, 2500), // Day 5
      const FlSpot(5, 2700), // Day 6
      const FlSpot(6, 3200), // Day 7
    ];
  }
}
