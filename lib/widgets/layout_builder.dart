import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_dashboard/widgets/hover_charts.dart';
import 'package:web_dashboard/widgets/total_sales.dart';

class LayOutBuilder extends StatelessWidget {
  const LayOutBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 650) {
        return Column(
          children: [
            SalesDashboard(),
            const HoverChartView(),
          ],
        );
      } else if (constraints.maxWidth <= 850) {
        return Column(
          children: [
            SalesDashboard(),
            const HoverChartView(),
          ],
        );
      } else {
        return Row(
          children: [
            SalesDashboard(),
            const HoverChartView(),
          ],
        );
      }
    });
  }
}
