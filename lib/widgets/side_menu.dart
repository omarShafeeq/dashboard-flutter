import 'package:flutter/material.dart';
import 'package:web_dashboard/views/calender.dart';
import 'package:web_dashboard/views/chat_view.dart';
import 'package:web_dashboard/views/email_view.dart';
import 'package:web_dashboard/views/main_view.dart';
import 'package:web_dashboard/widgets/animated_expansion_tile.dart';
import 'package:web_dashboard/widgets/dashboard_list_tile.dart';
import 'package:web_dashboard/widgets/total_sales.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

bool customIcon = false;

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: 200,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dashboard,
                      color: Colors.black,
                    ),
                    Text(
                      'OS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Omar Shafeeq',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Programmer',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                'MAIN',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 5,
              ),
              DashboardListTile(
                title: "Main",
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainView(),
                    ),
                  );
                },
                icon: Icons.home_filled,
              ),
              DashboardListTile(
                title: "Calender",
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const CalenderView(),
                    ),
                  );
                },
                icon: Icons.calendar_month,
              ),
              DashboardListTile(
                title: "Chat",
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                icon: Icons.chat,
              ),
              DashboardListTile(
                title: "Email",
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const EmailScreen(),
                    ),
                  );
                },
                icon: Icons.email,
              ),
              DashboardListTile(
                title: "Charts",
                press: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SalesDashboard(),
                    ),
                  );
                },
                icon: Icons.email,
              ),
              ExpansionTile(
                trailing: Icon(
                  customIcon
                      ? Icons.arrow_drop_down_circle
                      : Icons.arrow_drop_down,
                ),
                onExpansionChanged: (value) {
                  setState(() => customIcon = value);
                },
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                title: const Text(
                  'Tasks',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Icons.task,
                  color: Colors.black,
                ),
                children: [
                  // Second Level
                  OnHoverButton(
                    child: ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: const Text(
                        'List',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onTap: () {
                        // Handle your logic here
                      },
                    ),
                  ),
                  OnHoverButton(
                    child: ListTile(
                      title: const Text(
                        'Details',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onTap: () {
                        // Handle your logic here
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
