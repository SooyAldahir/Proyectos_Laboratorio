import 'package:all_app/src/pages/tasks/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskController _controller = TaskController();

  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final List<String> _categories = [
    'Sport App',
    'Medical App',
    'Rent App',
    'Notes',
    'Gaming Platform App'
  ];
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            Stack(
              children: [
                Positioned(
                  child: _rectangle(),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: _iconReturn(),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: _titleText(),
                ),
                Positioned(
                  top: 150,
                  left: 20,
                  right: 20,
                  child: _addText(),
                ),
                Positioned(
                  top: 230,
                  left: 20,
                  right: 20,
                  child: _datePicker(),
                )
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            _timePickers(),
            _descriptionField(),
            _categorySelection(),
            _createTaskButton()
          ],
        ),
      ),
    );
  }

  Widget _rectangle() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color.fromRGBO(238, 182, 78, 0.612),
      ),
    );
  }

  Widget _iconReturn() {
    return IconButton(
      onPressed: _controller.goToCalendarPage,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }

  Widget _titleText() {
    return const Text(
      'Create a new task',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  Widget _addText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black38),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _datePicker() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDate != null
                  ? "${_selectedDate!.toLocal()}".split(' ')[0]
                  : 'Select a Date',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const Icon(Icons.calendar_today, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _timePickers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _timePicker("Start Time", _startTime, (time) {
          setState(() {
            _startTime = time;
          });
        }),
        _timePicker("End Time", _endTime, (time) {
          setState(() {
            _endTime = time;
          });
        }),
      ],
    );
  }

  Widget _timePicker(
      String label, TimeOfDay? time, Function(TimeOfDay) onTimePicked) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          onTimePicked(pickedTime);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 16, color: Colors.black)),
            const SizedBox(height: 5),
            Text(
              time != null ? time.format(context) : 'Select time',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descriptionField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Description',
          hintStyle: TextStyle(color: Colors.black38),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _categorySelection() {
    return Wrap(
      spacing: 10,
      children: _categories.map((category) {
        bool isSelected = _selectedCategory == category;
        return ChoiceChip(
          label: Text(category),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              _selectedCategory = selected ? category : null;
            });
          },
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        );
      }).toList(),
    );
  }

  Widget _createTaskButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        iconColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text('Create Task', style: TextStyle(fontSize: 18)),
    );
  }
}
