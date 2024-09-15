import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  const Responsive(
      {required this.mobile, required this.desktop, required this.tablet});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1200) {
      return desktop;
    } else if (_size.width >= 650 && _size.width < 1200) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
