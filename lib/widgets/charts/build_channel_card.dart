import 'package:flutter/material.dart';
import 'package:web_dashboard/widgets/charts/build_card_header.dart';
import 'package:web_dashboard/widgets/charts/build_progress_row.dart';
import 'package:web_dashboard/widgets/charts/build_table_header.dart';

class BuildChannelCard extends StatelessWidget {
  const BuildChannelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildCardHeader('Channels'),
          const BuildTableHeader(['Channel', 'Visits', 'Progress']),
          BuildProgressRow('Direct', 3000, 10000, color: Colors.purple),
          BuildProgressRow('Organic Search', 4500, 10000, color: Colors.blue),
          BuildProgressRow('Referral', 3000, 10000, color: Colors.orange),
          BuildProgressRow('Social', 5000, 10000, color: Colors.red),
          BuildProgressRow('Other', 8965, 10000, color: Colors.green),
        ],
      ),
    );
  }
}
