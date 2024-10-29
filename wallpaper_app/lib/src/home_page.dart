import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wallpaper_app/src/home_Controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  int _selectedIndex = 0;
  final HomeController _controller = HomeController();

  final List<String> imageAssets = [
    'assets/img/chibi_art_style_jujutsu_kaisen_anime_wallpaper.jpeg',
    'assets/img/descargar_1.jpeg',
    'assets/img/descargar_2.jpeg',
    'assets/img/descargar.jpeg',
    'assets/img/gojo.jpeg',
    'assets/img/jjk.jpeg',
    'assets/img/jujutsu_kaisen_wallpaper.jpeg',
    'assets/img/satoru_gojo.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              height: -55,
              constraints: const BoxConstraints(
                maxWidth: 120,
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.redAccent,
                  size: 18,
                ),
                label: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  backgroundColor: Colors.red.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myText(),
            _myText2(),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: imageAssets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageAssets[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _buildIcon(Icons.home, 0), label: 'Home'),
          BottomNavigationBarItem(
              icon: _buildIcon(Icons.favorite, 1), label: 'Favorites'),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.add, 2),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: _buildIcon(Icons.image, 3), label: 'My Uploads'),
          BottomNavigationBarItem(
              icon: _buildIcon(Icons.more_horiz, 4), label: 'More'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return _selectedIndex == index
        ? Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Icon(iconData, color: Colors.white),
          )
        : Icon(iconData);
  }

  Widget _myText() {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Text(
        "My Uploads",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _myText2() {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Text(
        "Uploaded wallpapers",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
      ),
    );
  }
}
