import 'package:flutter/material.dart';
import 'package:book_store_online/pages/settings/favorites_controller.dart';
import 'package:flutter/scheduler.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesController _controller = FavoritesController();

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: _controller.goToSettingsePage,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.6,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return BookCard(
              imageUrl: book['image']!,
              title: book['title']!,
            );
          },
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const BookCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 0,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
