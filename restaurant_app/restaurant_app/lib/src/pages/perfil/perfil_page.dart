import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/img/pngtree-web-programmer-avatar-png-image_12529205.png',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Luis Cristobal Orejas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4), // Espacio entre el nombre y el email
                      Text(
                        'luis.oreja@email.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          height:
                              15), // Espacio entre el email y el nuevo texto
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'ACCOUNT INFORMATION',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            EditableTile(
              title: 'Full Name',
              subtitle: 'Luis Cristobal Orejas',
              onEdit: () {},
            ),
            const EditableTile(
              title: 'Email',
              subtitle: 'luis.oreja@email.com',
            ),
            const EditableTile(
              title: 'Phone',
              subtitle: '+1 816-926-6241',
            ),
            const EditableTile(
              title: 'Address',
              subtitle: '1278 Loving Acres Road Kansas City, MO 64110',
            ),
            const EditableTile(
              title: 'Gender',
              subtitle: 'Male',
            ),
            const EditableTile(
              title: 'Date of Birth',
              subtitle: 'April 9, 1995',
            ),
            const DarkThemeToggle(),
          ],
        ),
      ),
    );
  }
}

class EditableTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final VoidCallback? onEdit;

  const EditableTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.edit,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          if (icon != null && onEdit != null)
            IconButton(
              icon: Icon(icon),
              onPressed: onEdit,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}

class DarkThemeToggle extends StatefulWidget {
  const DarkThemeToggle({super.key});

  @override
  _DarkThemeToggleState createState() => _DarkThemeToggleState();
}

class _DarkThemeToggleState extends State<DarkThemeToggle> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Dark Theme',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              setState(() {
                _isDarkTheme = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
