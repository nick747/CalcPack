import 'package:flutter/material.dart';
import '../models/theme.dart';

class CalcDrawer extends StatefulWidget {
  const CalcDrawer({super.key});

  @override
  State<CalcDrawer> createState() => _CalcDrawerState();
}

class _CalcDrawerState extends State<CalcDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primary,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildSection('Algebra', [
              'Percentage',
              'Mean',
              'Fraction',
              'GCD/LCM',
              'Prime number',
              'Random number',
            ]),
            buildSection('Geometry', [
              'Shapes',
              'Solids',
            ]),
            buildSection('Finance', [
              'Change',
              'Tax',
            ]),
            buildSection('Conversions', [
              'Velocity',
              'Data',
              'Surface',
              'Length',
              'Volume',
              'Weight',
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String sectionTitle, List<String> pages) {
    return ExpansionTile(
      title: Text(
        sectionTitle,
        style: const TextStyle(color: secondary, fontWeight: FontWeight.bold),
      ),
      children: pages.map((page) {
        return ListTile(
          title: Text(
            page,
            style: const TextStyle(color: secondary),
          ),
          onTap: () {},
        );
      }).toList(),
    );
  }
}
