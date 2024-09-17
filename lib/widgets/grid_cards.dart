import 'package:flutter/material.dart';
import 'package:web_dashboard/widgets/cards.dart';

class GridCards extends StatelessWidget {
  GridCards({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  List<Cards> cards = [
    const Cards(
      title: 'CUSTOMERS',
      colorForIcon: Colors.red,
      iconData: Icons.people_sharp,
      number: '8,326',
      colorofContainer: Colors.red,
      iconofContainer: Icons.arrow_upward,
      textofContainer: '2,371',
      subTitle: 'Since line',
    ),
    const Cards(
      title: 'REVENUE',
      colorForIcon: Colors.blue,
      iconData: Icons.attach_money_rounded,
      number: r'$6,548',
      colorofContainer: Colors.green,
      iconofContainer: Icons.arrow_downward,
      textofContainer: '5,351',
      subTitle: 'Since line',
    ),
    const Cards(
      title: 'ORDERS',
      colorForIcon: Colors.green,
      iconData: Icons.online_prediction_rounded,
      number: '56,578',
      colorofContainer: Colors.green,
      iconofContainer: Icons.arrow_downward,
      textofContainer: '5,321',
      subTitle: 'Since line',
    ),
    const Cards(
      title: 'GROWTH',
      colorForIcon: Colors.yellow,
      iconData: Icons.swap_vert_circle,
      number: '+ 863,159',
      colorofContainer: Colors.green,
      iconofContainer: Icons.arrow_upward,
      textofContainer: '3,854',
      subTitle: 'Since line',
    ),
    const Cards(
      title: 'BALANCE',
      colorForIcon: Colors.black54,
      iconData: Icons.account_balance_wallet_outlined,
      number: r'$3,741',
      colorofContainer: Colors.red,
      iconofContainer: Icons.arrow_downward,
      textofContainer: '2,963',
      subTitle: 'Since line',
    ),
    const Cards(
      title: 'BALANCE',
      colorForIcon: Colors.black54,
      iconData: Icons.account_balance_wallet_outlined,
      number: r'$3,741',
      colorofContainer: Colors.red,
      iconofContainer: Icons.arrow_downward,
      textofContainer: '2,963',
      subTitle: 'Since line',
    ),
    const Cards(
      title: 'BALANCE',
      colorForIcon: Colors.black54,
      iconData: Icons.account_balance_wallet_outlined,
      number: r'$3,741',
      colorofContainer: Colors.red,
      iconofContainer: Icons.arrow_downward,
      textofContainer: '2,963',
      subTitle: 'Since line',
    ),
  ];

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 0, // Set crossAxisSpacing to 0
        mainAxisSpacing: 0, // Set mainAxisSpacing to 0
      ),
      itemBuilder: (context, index) {
        return cards[index];
      },
    );
  }
}
