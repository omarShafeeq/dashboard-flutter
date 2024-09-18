import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:web_dashboard/widgets/app_bar.dart';
import 'package:web_dashboard/widgets/charts_flutter.dart';
import 'package:web_dashboard/widgets/grid_cards.dart';
import 'package:web_dashboard/widgets/hover_charts.dart';
import 'package:web_dashboard/widgets/side_menu.dart';
import 'package:web_dashboard/widgets/product_table.dart';
import 'package:web_dashboard/widgets/three_charts.dart';
import 'package:web_dashboard/widgets/total_sales.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarDrawer(
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;

              // Determine the number of columns based on the width
              if (constraints.maxWidth < 600) {
                crossAxisCount = 1; // Mobile
              } else if (constraints.maxWidth < 1100) {
                crossAxisCount = 2; // Tablet
              } else {
                crossAxisCount = 4; // Desktop
              }

              // Calculate the aspect ratio dynamically
              double aspectRatio = constraints.maxWidth / crossAxisCount / 150;

              return Column(
                children: [
                  AppBar(
                    leading: const DrawerIcon(),
                    actions: const [AppBarWidget()],
                  ),
                  GridCards(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: aspectRatio,
                  ),
                  const SizedBox(height: 20),
                  constraints.maxWidth < 1100
                      ? Column(
                          children: [
                            SalesDashboard(),
                            const HoverChartView(),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: SalesDashboard()),
                            const SizedBox(width: 16),
                            const Expanded(
                                flex: 2,
                                child:
                                    HoverChartView()), // Ensure it uses Expanded
                          ],
                        ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        constraints.maxWidth < 1100
                            ? Column(
                                children: [
                                  RevenueLocationCard(),
                                  ProductTable(),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(child: RevenueLocationCard()),
                                  const SizedBox(width: 16),
                                  Expanded(child: ProductTable()),
                                ],
                              ),
                        const SizedBox(height: 20),
                        DashboardCharts(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
