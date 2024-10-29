import 'package:flutter/material.dart';
import 'package:book_store_online/pages/explore/SeeAll_controller.dart';
import 'package:flutter/scheduler.dart';

class SeeallPage extends StatefulWidget {
  const SeeallPage({super.key});

  @override
  State<SeeallPage> createState() => _SeeallPageState();
}

class _SeeallPageState extends State<SeeallPage> {
  final SeeallController _controller = SeeallController();

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
            onPressed: _controller.goToExplorePage,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'Short Stories',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookInfoCard(
              imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
              title: 'Alicia en el pais de las maravillas',
              author: 'Lewis Carrol',
              description: 'Este libro es muy bonito y ademas de fantasioso.',
            ),
            BookInfoCard(
              imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
              title: 'Alicia en el pais de las maravillas',
              author: 'Lewis Carrol',
              description: 'Este libro es muy bonito y ademas de fantasioso.',
            ),
            BookInfoCard(
              imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
              title: 'Alicia en el pais de las maravillas',
              author: 'Lewis Carrol',
              description: 'Este libro es muy bonito y ademas de fantasioso.',
            ),
            BookInfoCard(
              imageUrl: 'assets/img/27885-JZXYD4QG.jpg',
              title: 'Alicia en el pais de las maravillas',
              author: 'Lewis Carrol',
              description: 'Este libro es muy bonito y ademas de fantasioso.',
            ),
          ],
        ),
      ),
    );
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
