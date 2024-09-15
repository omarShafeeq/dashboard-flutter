import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_dashboard/widgets/another_notification.dart';
import 'package:web_dashboard/widgets/app_bar.dart';
import 'package:web_dashboard/widgets/fullScreen_example.dart';
import 'package:web_dashboard/widgets/side_menu.dart';
import 'package:intl/intl.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

late Map<DateTime, List<Appointment>> _dataCollection;

class _CalenderViewState extends State<CalenderView> {
  late var _calendarDataSource;
  TextEditingController _textController = TextEditingController();
  CustomAppoinment? _selectedAppointment;
  String? _selectedCategory;
  final List<String> categories = [
    'Danger',
    'Success',
    'Primary',
    'Info',
    'Dark',
    'Warning',
  ];

  @override
  void initState() {
    super.initState();
    _dataCollection = {};
    _calendarDataSource = MeetingDataSource(<Appointment>[]);
    _textController = TextEditingController();
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
              actions: const [
                AppBarWidget(),
              ],
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
                onTap: (CalendarTapDetails details) {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    final DateTime dateTapped = details.date!;
                    _showDateDialog(dateTapped, null);
                  } else if (details.targetElement ==
                      CalendarElement.appointment) {
                    _selectedAppointment = details.appointments!.first;
                    _showDateDialog(
                        _selectedAppointment!.startTime, _selectedAppointment);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Import the intl package

  void _showDateDialog(DateTime date, CustomAppoinment? appointment) {
    // Format the date to include hours and minutes
    String formattedDate = DateFormat.yMMMd().add_jm().format(date);

    if (appointment != null) {
      _textController.text = appointment.subject;
      _selectedCategory = appointment.category;
    } else {
      _textController.clear();
      _selectedCategory = null;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(appointment == null ? 'Add New Event' : 'Update Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Event Details',
                  hintText: 'Enter event details here',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Category'),
                value: _selectedCategory,
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String appointmentDetails = _textController.text;
                if (appointmentDetails.isNotEmpty &&
                    _selectedCategory != null) {
                  if (appointment == null) {
                    _addAppointment(
                        date, appointmentDetails, _selectedCategory);
                  } else {
                    _updateAppointment(
                        appointment, appointmentDetails, _selectedCategory);
                  }
                }
                Navigator.of(context).pop();
              },
              child: Text(appointment == null ? 'Add' : 'Update'),
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

  void _addAppointment(DateTime date, String details, String? category) {
    final CustomAppoinment newAppointment = CustomAppoinment(
      subject: details,
      startTime: date,
      endTime: date.add(const Duration(hours: 1)),
      color: Colors.blue,
      isAllDay: false,
      category: category,
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

  void _updateAppointment(
      CustomAppoinment appointment, String details, String? category) {
    // Remove the old appointment
    DateTime keyDate = appointment.startTime;

    // Find the index of the appointment to remove it
    if (_dataCollection[keyDate] != null) {
      int index = _dataCollection[keyDate]!.indexOf(appointment);
      if (index != -1) {
        _dataCollection[keyDate]!.removeAt(index); // Remove the old appointment
      }
    }

    // Create a new appointment with updated details
    final updatedAppointment = CustomAppoinment(
      subject: details,
      startTime: appointment.startTime,
      endTime: appointment.endTime,
      color: appointment.color,
      isAllDay: appointment.isAllDay,
      category: appointment.category,
    );

    // Add the updated appointment to the data collection
    if (_dataCollection.containsKey(keyDate)) {
      _dataCollection[keyDate]!.add(updatedAppointment);
    } else {
      _dataCollection[keyDate] = [updatedAppointment];
    }

    // Update the calendar data source
    _calendarDataSource.appointments!.remove(appointment);
    _calendarDataSource.appointments!.add(updatedAppointment);
    _calendarDataSource.notifyListeners(
        CalendarDataSourceAction.add, <Appointment>[updatedAppointment]);
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

class CustomAppoinment extends Appointment {
  final String? category;

  CustomAppoinment({
    required String subject,
    required DateTime startTime,
    required DateTime endTime,
    required Color color,
    bool isAllDay = false,
    this.category,
  }) : super(
          subject: subject,
          startTime: startTime,
          endTime: endTime,
          color: color,
          isAllDay: isAllDay,
        );
}
