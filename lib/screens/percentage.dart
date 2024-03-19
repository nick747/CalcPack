import 'package:flutter/material.dart';

class PercentageScreen extends StatefulWidget {
  const PercentageScreen({super.key});

  @override
  State<PercentageScreen> createState() => _PercentageScreenState();
}

class _PercentageScreenState extends State<PercentageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "PROVA",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
