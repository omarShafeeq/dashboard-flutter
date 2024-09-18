import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashboard/cubit/cubit.dart';
import 'package:web_dashboard/cubit/states.dart';
import 'package:web_dashboard/widgets/fullScreen_example.dart';
import 'package:web_dashboard/widgets/notifications.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  // Map to track hover states for each icon
  final Map<String, bool> _isHovered = {
    'grid': false,
    'settings': false,
    'bedtime': false,
    'avatar': false,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NotificationDropdownButton(),
        const SizedBox(width: 5),
        const SizedBox(width: 5),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MouseRegion(
              onEnter: (_) => setState(() => _isHovered['bedtime'] = true),
              onExit: (_) => setState(() => _isHovered['bedtime'] = false),
              child: IconButton(
                icon: Icon(
                  state is DarkThemeState ? Icons.sunny : Icons.bedtime,
                  size: 27,
                  color:
                      _isHovered['bedtime']! ? Colors.blue : Colors.grey[600],
                ),
                onPressed: () {
                  // Trigger theme toggle event
                  BlocProvider.of<ThemeCubit>(context).toggleTheme();
                },
              ),
            );
          },
        ),
        const SizedBox(width: 5),
        FullScreenExample(),
        const SizedBox(width: 5),
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered['avatar'] = true),
          onExit: (_) => setState(() => _isHovered['avatar'] = false),
          child: PopupMenuButton<String>(
            tooltip: '',
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://avatar.iran.liara.run/public/5.png'),
                ),
                const SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doris Larson',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Founder',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            offset: const Offset(0, 55),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                enabled: false,
                child: Text('Welcome !',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const PopupMenuItem<String>(
                value: 'My Account',
                child: Row(
                  children: [
                    Icon(Icons.person, size: 16),
                    SizedBox(width: 8),
                    Text('My Account'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 16),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Support',
                child: Row(
                  children: [
                    Icon(Icons.support, size: 16),
                    SizedBox(width: 8),
                    Text('Support'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Lock Screen',
                child: Row(
                  children: [
                    Icon(Icons.lock, size: 16),
                    SizedBox(width: 8),
                    Text('Lock Screen'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 16),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'My Account':
                  // Navigate to My Account page
                  break;
                case 'Settings':
                  // Navigate to Settings page
                  break;
                case 'Support':
                  // Navigate to Support page
                  break;
                case 'Lock Screen':
                  // Handle Lock Screen
                  break;
                case 'Logout':
                  // Handle logout
                  break;
              }
            },
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
