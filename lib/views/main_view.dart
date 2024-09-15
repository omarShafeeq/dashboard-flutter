import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:web_dashboard/responsive.dart';
import 'package:web_dashboard/widgets/another_notification.dart';
import 'package:web_dashboard/widgets/app_bar.dart';
import 'package:web_dashboard/widgets/charts_flutter.dart';
import 'package:web_dashboard/widgets/fullScreen_example.dart';
import 'package:web_dashboard/widgets/grid_cards.dart';
import 'package:web_dashboard/widgets/notifications.dart';
import 'package:web_dashboard/widgets/product_table.dart';
import 'package:web_dashboard/widgets/three_charts.dart';

import '../widgets/cards.dart';
import '../widgets/hover_charts.dart';
import '../widgets/side_menu.dart';

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
              // Determine the screen size
              bool isMobile = constraints.maxWidth < 650;
              bool isTablet =
                  constraints.maxWidth >= 650 && constraints.maxWidth < 1200;
              bool isDesktop = constraints.maxWidth >= 1200;

              return Column(
                children: [
                  AppBar(
                    leading: const DrawerIcon(),
                    actions: const [
                      AppBarWidget(),
                    ],
                  ),

                  Responsive(
                    mobile: GridCards(
                      crossAxisCount: 1,
                      childAspectRatio: 3.5,
                    ),
                    tablet: GridCards(
                      crossAxisCount: 2,
                      childAspectRatio: 2.4,
                    ),
                    desktop: GridCards(
                      crossAxisCount: 4,
                      childAspectRatio: constraints.maxWidth < 1400 ? 1.6 : 1.5,
                    ),
                  ),
                  const SizedBox(height: 20), // Add spacing
                  const HoverChartView(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Stack vertically on mobile, horizontally on larger screens
                        Responsive(
                          mobile: Column(
                            children: [
                              RevenueLocationCard(),
                              ProductTable(),
                            ],
                          ),
                          tablet: Column(
                            children: [
                              RevenueLocationCard(),
                              ProductTable(),
                            ],
                          ),
                          desktop: Row(
                            children: [
                              Expanded(
                                child: RevenueLocationCard(),
                              ),
                              const SizedBox(width: 16), // Spacing on desktop
                              Expanded(
                                child: ProductTable(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20), // Add spacing
                        DashboardCharts(), // Always stack ProductTable below RevenueLocationCard
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
