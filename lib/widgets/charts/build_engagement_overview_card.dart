import 'package:flutter/material.dart';
import 'package:web_dashboard/widgets/charts/build_card_header.dart';
import 'package:web_dashboard/widgets/charts/build_engagement_row.dart';
import 'package:web_dashboard/widgets/charts/build_table_header.dart';

class BuildEngagementOverviewCard extends StatelessWidget {
  const BuildEngagementOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCardHeader('Engagement Overview'),
          BuildTableHeader(['Duration (Secs)', 'Sessions', 'Views']),
          BuildEngagementRow('0-30 Secs', 2250, 4250),
          BuildEngagementRow('31-60 Secs', 1501, 2050),
          BuildEngagementRow('61-120 Secs', 750, 1600),
          BuildEngagementRow('121-240 Secs', 540, 1040),
          BuildEngagementRow('241-420 Secs', 141, 886),
        ],
      ),
    );
  }
}
