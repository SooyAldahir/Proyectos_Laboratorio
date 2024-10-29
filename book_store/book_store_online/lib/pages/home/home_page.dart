import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:book_store_online/pages/home/home_controller.dart';
import 'package:book_store_online/pages/explore/explore_page.dart';
import 'package:book_store_online/pages/settings/settings_page.dart';
import 'package:book_store_online/pages/book_details/book_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    const ExplorePage(),
    const SettingsPage(),
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
        backgroundColor: Colors.white,
        title: const Text(
          'Flutter Ebook App',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Map<String, String>> books = [
    {
      'title': 'Romeo and Juliet',
      'author': 'William Shakespeare',
      'image': 'assets/img/61yI3FL8kQL._AC_UF1000,1000_QL80_.jpg',
    },
    {
      'title': 'The Adventures of Sherlock Holmes',
      'author': 'Arthur Conan Doyle',
      'image':
          'assets/img/353012_portada_las-aventuras-de-sherlock-holmes_arthur-conan-doyle_202203181004.jpg',
    },
    {
      'title': 'Alice in Wonderland',
      'author': 'Lewis Carroll',
      'image': 'assets/img/27885-JZXYD4QG.jpg',
    },
  ];

  final List<String> _categories = [
    'Fiction',
    'Non-Fiction',
    'Science',
    'History'
  ];
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: BookCard(
                      imageUrl: book['image']!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(book: book),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            _categorySelection(),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Recently Added',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookInfoCard(
                  imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
                  title: 'Alicia en el pais de las maravillas',
                  author: 'Lewis Carrol',
                  description:
                      'Este libro es muy bonito y ademas de fantasioso.',
                ),
                BookInfoCard(
                  imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
                  title: 'Alicia en el pais de las maravillas',
                  author: 'Lewis Carrol',
                  description:
                      'Este libro es muy bonito y ademas de fantasioso.',
                ),
                BookInfoCard(
                  imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
                  title: 'Alicia en el pais de las maravillas',
                  author: 'Lewis Carrol',
                  description:
                      'Este libro es muy bonito y ademas de fantasioso.',
                ),
                BookInfoCard(
                  imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
                  title: 'Alicia en el pais de las maravillas',
                  author: 'Lewis Carrol',
                  description:
                      'Este libro es muy bonito y ademas de fantasioso.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categorySelection() {
    return Wrap(
      spacing: 5,
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
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox(
      width: 120,
      child: Card(
        elevation: 5,
        child: AspectRatio(
          aspectRatio: 1.2,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: content)
        : content;
  }
}

class BookInfoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String description;

  const BookInfoCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Imagen del libro
            Image.asset(
              imageUrl,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
