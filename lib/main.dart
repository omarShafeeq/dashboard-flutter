import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_dashboard/cubit/cubit.dart';
import 'package:web_dashboard/cubit/states.dart';
import 'package:web_dashboard/views/main_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                theme: state is DarkThemeState
                    ? ThemeData.dark()
                    : ThemeData.light(),
                title: 'Dashboard',
                debugShowCheckedModeBanner: false,
                home: const MainView(),
              );
            });
      },
    );
  }
}
