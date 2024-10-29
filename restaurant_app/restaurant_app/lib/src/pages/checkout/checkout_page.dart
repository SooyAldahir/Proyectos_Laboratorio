import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderDetails(
              title: 'Shipping Address',
              iconData: Icons.edit,
            ),
            UserAddress(
              name: 'Luis Cristobal Orejas',
              address: '1278 Loving Acres Road Kansas City, MO 64110',
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Payment Method',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(),
                child: ListTile(
                  leading: Icon(Icons.credit_card, color: Colors.red, size: 40),
                  title: Text(
                    'Luis Cristobal Orejas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    '5506 7744 8610 9638',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text('Items'),
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
            ProductCard(
              imageUrl:
                  'https://www.allrecipes.com/thmb/X2V7yiK2jcZWXNW6cVhHT0Hvn_I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Not-Just-for-Brunch-Fruit-Saladlutzflcat4x3-f1020e3f61164c13b41d890c5195f539.jpg',
              title: 'Fruit Salad',
              rating: 2.0,
              reviews: 25,
              pieces: 40,
              price: 90,
              quantity: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutSummary(totalAmount: 990),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final String title;
  final IconData iconData; // Cambia a IconData

  const OrderDetails({
    super.key,
    required this.title,
    required this.iconData, // Cambia a iconData
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 8),
            Icon(iconData)
          ],
        ),
      ),
    );
  }
}

class UserAddress extends StatelessWidget {
  final String name;
  final String address;

  const UserAddress({
    super.key,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              textAlign: TextAlign.justify,
              address,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int reviews;
  final int pieces;
  final double price;
  final int quantity;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.pieces,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        '$rating ($reviews Reviews)',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$pieces Pieces  ',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Quantity: $quantity',
                    style: const TextStyle(fontSize: 14),
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

class CheckoutSummary extends StatelessWidget {
  final double totalAmount;

  const CheckoutSummary({
    super.key,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta la altura al contenido
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.card_giftcard),
                hintText: 'Coupon Code',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$ $totalAmount',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Delivery charges included',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'PLACE ORDER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
