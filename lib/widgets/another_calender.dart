import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_dashboard/widgets/another_notification.dart';
import 'package:web_dashboard/widgets/notifications.dart';
import 'package:web_dashboard/widgets/side_menu.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

late Map<DateTime, List<Appointment>> _dataCollection;

class _CalenderViewState extends State<CalenderView> {
  late var _calendarDataSource;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _dataCollection = getAppointments();
    _calendarDataSource = MeetingDataSource(<Appointment>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarDrawer(
        drawer: const SideMenu(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBar(
              leading: const DrawerIcon(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 50),
                  Notifications(),
                  SizedBox(width: 30),
                ],
              ),
            ),
            SizedBox(
              height: 550,
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                ),
                dataSource: _calendarDataSource,
                loadMoreWidgetBuilder: (BuildContext context,
                    LoadMoreCallback loadMoreAppointments) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future: loadMoreAppointments(),
                      builder: (context, snapShot) {
                        return Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          ),
                        );
                      },
                    ),
                  );
                },
                onTap: (CalendarTapDetails details) {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    final DateTime dateTapped = details.date!;
                    _showDateDialog(dateTapped);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDateDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Appointment for ${date.toLocal()}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Appointment Details',
                  hintText: 'Enter appointment details here',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Add appointment logic
                String appointmentDetails = _textController.text;
                if (appointmentDetails.isNotEmpty) {
                  _addAppointment(date, appointmentDetails);
                }
                Navigator.of(context).pop();
                _textController.clear();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _addAppointment(DateTime date, String details) {
    final Appointment newAppointment = Appointment(
      subject: details,
      startTime: date,
      endTime: date.add(const Duration(hours: 1)), // Default duration
      color: Colors.blue, // You can choose a color
      isAllDay: false,
    );

    if (_dataCollection.containsKey(date)) {
      _dataCollection[date]!.add(newAppointment);
    } else {
      _dataCollection[date] = [newAppointment];
    }

    _calendarDataSource.appointments!.add(newAppointment);
    _calendarDataSource.notifyListeners(
        CalendarDataSourceAction.add, <Appointment>[newAppointment]);
  }

  Map<DateTime, List<Appointment>> getAppointments() {
    final List<String> _subjectCollection = <String>[
      'General Meeting',
      'Plan Execution',
      'Project Plan',
      'Consulting',
      'Support',
      'Development Meeting',
      'Scrum',
      'Project Completion',
      'Release updates',
      'Performance Check',
    ];

    final List<Color> _colorCollection = <Color>[
      const Color(0xFF0F8644),
      const Color(0xFF8B1FA9),
      const Color(0xFFD20100),
      const Color(0xFFFC571D),
      const Color(0xFF36B37B),
      const Color(0xFF01A1EF),
      const Color(0xFF3D4FB5),
      const Color(0xFFE47C73),
      const Color(0xFF636363),
      const Color(0xFF0A8043),
    ];

    final Random random = Random();
    var _dataCollection = <DateTime, List<Appointment>>{};
    final DateTime today = DateTime.now();
    final DateTime rangeStartDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: -1000));
    final DateTime rangeEndDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 1000));
    for (DateTime i = rangeStartDate;
        i.isBefore(rangeEndDate);
        i = i.add(Duration(days: 1 + random.nextInt(2)))) {
      final DateTime date = i;
      final int count = 1 + random.nextInt(3);
      for (int j = 0; j < count; j++) {
        final DateTime startDate = DateTime(
            date.year, date.month, date.day, 8 + random.nextInt(8), 0, 0);
        final int duration = random.nextInt(3);
        final Appointment meeting = Appointment(
            subject:
                _subjectCollection[random.nextInt(_subjectCollection.length)],
            startTime: startDate,
            endTime:
                startDate.add(Duration(hours: duration == 0 ? 1 : duration)),
            color: _colorCollection[random.nextInt(_colorCollection.length)],
            isAllDay: false);

        if (_dataCollection.containsKey(date)) {
          final List<Appointment> meetings = _dataCollection[date]!;
          meetings.add(meeting);
          _dataCollection[date] = meetings;
        } else {
          _dataCollection[date] = [meeting];
        }
      }
    }
    return _dataCollection;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
    await Future.delayed(const Duration(seconds: 1));
    final List<Appointment> meetings = <Appointment>[];
    DateTime appStartDate = startDate;
    DateTime appEndDate = endDate;

    while (appStartDate.isBefore(appEndDate)) {
      final List<Appointment>? data = _dataCollection[appStartDate];
      if (data == null) {
        appStartDate = appStartDate.add(const Duration(days: 1));
        continue;
      }
      for (final Appointment meeting in data) {
        if (appointments!.contains(meeting)) {
          continue;
        }
        meetings.add(meeting);
      }
      appStartDate = appStartDate.add(const Duration(days: 1));
    }
    appointments!.addAll(meetings);
    notifyListeners(CalendarDataSourceAction.add, meetings);
  }
}
