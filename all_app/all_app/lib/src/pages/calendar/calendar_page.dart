import 'package:all_app/src/pages/calendar/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _controller = CalendarController();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: height * 0.05,
                left: width * 0.05,
                child: _iconReturn(),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: height * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _myTasks(context, width),
                    SizedBox(height: height * 0.02),
                    _text("Productive Day, Sourav", width),
                    SizedBox(height: height * 0.03),
                    _calendarView(width),
                    SizedBox(height: height * 0.02),
                    _timelineWithHours(width),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myTasks(BuildContext context, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: TextStyle(
              fontSize: width * 0.09,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: _controller.goToTaskPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 49, 147, 152),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Text(
                'Add task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconReturn() {
    return IconButton(
      onPressed: _controller.goToHomePage,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }

  Widget _text(String texto, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.black38,
          fontSize: width * 0.045,
        ),
      ),
    );
  }

  Widget _calendarView(double width) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        weekendTextStyle: TextStyle(color: Colors.red),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        headerPadding: EdgeInsets.symmetric(vertical: width * 0.02),
        titleTextStyle: TextStyle(
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      calendarFormat: CalendarFormat.week,
    );
  }

  Widget _timelineWithHours(double width) {
    List<String> hours = [
      "9 PM",
      "10 PM",
      "11 PM",
      "12 AM",
      "1 AM",
      "2 AM",
      "3 AM"
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hours.length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _timeLabel(hours[index], width), // Muestra las horas
            SizedBox(width: width * 0.03),
            Expanded(
              child: _eventCard(
                index == 0
                    ? 'Project Research'
                    : index == 1
                        ? 'Work on Medical App'
                        : index == 2
                            ? 'Call Client'
                            : 'Available',
                index == 0
                    ? 'Discuss with colleagues'
                    : index == 1
                        ? 'Add medicine tab'
                        : index == 2
                            ? 'Discuss final requirements'
                            : 'Free time',
                index == 0
                    ? Colors.orangeAccent
                    : index == 1
                        ? Colors.blueAccent
                        : index == 2
                            ? Colors.redAccent
                            : Colors.greenAccent,
                width,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _eventCard(
      String title, String description, Color color, double width) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: width * 0.02),
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: width * 0.01),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeLabel(String time, double width) {
    return Container(
      width: width * 0.12,
      alignment: Alignment.centerRight,
      child: Text(
        time,
        style: TextStyle(
          fontSize: width * 0.035,
          color: Colors.black54,
        ),
      ),
    );
  }
}
