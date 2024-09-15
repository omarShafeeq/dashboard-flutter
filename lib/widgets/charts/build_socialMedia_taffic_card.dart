import 'package:flutter/material.dart';
import 'package:web_dashboard/widgets/charts/build_card_header.dart';
import 'package:web_dashboard/widgets/charts/build_progress_row.dart';
import 'package:web_dashboard/widgets/charts/build_table_header.dart';

class BuildSocialMediaTrafficCard extends StatelessWidget {
  const BuildSocialMediaTrafficCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCardHeader('Social Media Traffic'),
          BuildTableHeader(['Network', 'Visits', 'Progress']),
          BuildProgressRow('Facebook', 8000, 15000, Colors.blue),
          BuildProgressRow('Instagram', 5000, 15000, Colors.blue),
          BuildProgressRow('Twitter', 4000, 15000, Colors.blue),
          BuildProgressRow('LinkedIn', 4500, 15000, Colors.blue),
          BuildProgressRow('Other', 3000, 15000, Colors.blue),
        ],
      ),
    );
  }
}
