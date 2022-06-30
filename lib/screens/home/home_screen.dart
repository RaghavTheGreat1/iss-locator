import 'package:flutter/material.dart';
import 'package:iss_locator/services/iss_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ISS Locator',
        ),
      ),
      body: Text(
        IssLocator.instance.position.toString(),
      ),
    );
  }
}
