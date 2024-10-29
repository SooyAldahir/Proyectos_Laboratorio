import 'package:book_store_online/pages/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController _controller = SettingsController();

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
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OptionsWidget(
                icon: Icons.favorite_border,
                onPressed: _controller.goTofavoritePage,
                label: 'Favorites'),
            const SizedBox(
              height: 10,
            ),
            OptionsWidget(
              icon: Icons.download_outlined,
              onPressed: () {},
              label: 'Downloads',
            ),
            const SizedBox(
              height: 10,
            ),
            OptionsWidget(
              icon: Icons.info_outline,
              onPressed: () {},
              label: 'About',
            ),
            const SizedBox(
              height: 10,
            ),
            OptionsWidget(
              icon: Icons.description_outlined,
              onPressed: () {},
              label: 'Licenses',
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const OptionsWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            padding: EdgeInsets.zero,
            color: Colors.grey,
            iconSize: 24,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
