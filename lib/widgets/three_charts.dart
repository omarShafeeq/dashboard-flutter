import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_dashboard/responsive.dart';
import 'package:web_dashboard/widgets/charts/build_channel_card.dart';
import 'package:web_dashboard/widgets/charts/build_engagement_overview_card.dart';
import 'package:web_dashboard/widgets/charts/build_socialMedia_taffic_card.dart';

class DashboardCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0.0),
      child: Responsive(
        desktop: Row(
          children: [
            Expanded(child: BuildChannelCard()),
            SizedBox(width: 10), // Space between cards
            Expanded(child: BuildSocialMediaTrafficCard()),
            SizedBox(width: 10), // Space between cards
            Expanded(child: BuildEngagementOverviewCard()),
          ],
        ),
        tablet: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: BuildChannelCard()),
                SizedBox(width: 16), // Space between cards
                Expanded(child: BuildSocialMediaTrafficCard()),
              ],
            ),
            SizedBox(height: 16), // Space between cards
            BuildEngagementOverviewCard(),
          ],
        ),
        mobile: Expanded(
          child: Column(
            children: [
              BuildChannelCard(),
              SizedBox(width: 16), // Space between cards
              BuildSocialMediaTrafficCard(),
              SizedBox(width: 16), // Space between cards
              BuildEngagementOverviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
