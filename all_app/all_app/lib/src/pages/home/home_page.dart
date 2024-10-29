import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:all_app/src/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

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
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: _rectangle(),
                  ),
                  Positioned(
                    top: size.height * 0.05,
                    left: size.width * 0.05,
                    child: _menuIcon(),
                  ),
                  Positioned(
                    top: size.height * 0.05,
                    right: size.width * 0.05,
                    child: _searchIcon(),
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    child: Row(
                      children: [
                        _circleAvatar(),
                        const SizedBox(width: 20),
                        _textUser(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _myTasks(context),
              const SizedBox(height: 20),
              _listCardToDo(),
              _listCardInProgress(),
              _listCardDone(),
              const SizedBox(height: 20),
              _progressCardsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rectangle() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color.fromRGBO(238, 182, 78, 0.612),
      ),
    );
  }

  Widget _menuIcon() {
    return const Icon(
      Icons.menu,
      color: Colors.black,
      size: 30,
    );
  }

  Widget _searchIcon() {
    return const Icon(Icons.search, color: Colors.black, size: 30);
  }

  Widget _circleAvatar() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color.fromRGBO(49, 49, 49, 0),
      backgroundImage: AssetImage(
        'assets/img/programmer-line-gradient-icon-vector-removebg-preview.png',
      ),
    );
  }

  Widget _textUser() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Sourav Suman',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          'App Developer',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _myTasks(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'My tasks',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: _controller.goToCalendarPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 49, 147, 152),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listCardToDo() {
    return _buildTaskCard(
      icon: Icons.alarm,
      color: Colors.redAccent,
      title: 'To Do',
      subtitle: '5 tasks now. 1 started',
    );
  }

  Widget _listCardInProgress() {
    return _buildTaskCard(
      icon: Icons.restart_alt,
      color: const Color(0xFFF4B266),
      title: 'In Progress',
      subtitle: '1 task now. 1 started',
    );
  }

  Widget _listCardDone() {
    return _buildTaskCard(
      icon: Icons.check,
      color: const Color.fromARGB(255, 100, 153, 222),
      title: 'Done',
      subtitle: '18 tasks now. 13 started',
    );
  }

  Widget _buildTaskCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressCardsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.8,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _progressCard(
            progress: 0.25,
            title: 'Medical App',
            hours: '9 hours in progress',
            color: Colors.teal,
          ),
          _progressCard(
            progress: 0.60,
            title: 'Making History Notes',
            hours: '20 hours progress',
            color: Colors.redAccent,
          ),
          _progressCard(
            progress: 0.45,
            title: 'ClassRoom App',
            hours: '15 hours in progress',
            color: const Color(0xFFF4B266),
          ),
          _progressCard(
            progress: 0.80,
            title: 'Shopping App',
            hours: '12 hours in progress',
            color: const Color.fromARGB(255, 100, 153, 222),
          ),
          _progressCard(
            progress: 0.90,
            title: 'eCommerce App',
            hours: '25 hours in process',
            color: const Color(0xFFF4B266),
          ),
          _progressCard(
            progress: 0.99,
            title: 'Delivery App',
            hours: '33 hours in progress',
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _progressCard({
    required double progress,
    required String title,
    required String hours,
    required Color color,
  }) {
    return SizedBox(
      height: 190,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 2,
                          backgroundColor: Colors.white24,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                hours,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
