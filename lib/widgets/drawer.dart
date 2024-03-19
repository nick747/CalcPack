import 'package:calcpack/models/pages.dart';
import 'package:flutter/material.dart';
import '../models/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPageProvider = StateProvider<String>((ref) => 'Calculator');
final selectedPageBuilderProvider = Provider<Widget?>((ref) {
  final key = ref.watch(selectedPageProvider);
  return pages[key];
});

class CalcDrawer extends ConsumerWidget {
  const CalcDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: primary,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildSection(
                'Algebra',
                [
                  'Percentage',
                  'Mean',
                  'Fraction',
                  'GCD/LCM',
                  'Prime number',
                  'Random number',
                ],
                ref,
                context),
            buildSection(
                'Geometry',
                [
                  'Shapes',
                  'Solids',
                ],
                ref,
                context),
            buildSection(
                'Finance',
                [
                  'Change',
                  'Tax',
                ],
                ref,
                context),
            buildSection(
                'Conversions',
                [
                  'Velocity',
                  'Data',
                  'Surface',
                  'Length',
                  'Volume',
                  'Weight',
                ],
                ref,
                context),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String sectionTitle, List<String> pages, WidgetRef ref,
      BuildContext context) {
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
          onTap: () {
            changePage(context, ref, page);
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }

  void changePage(BuildContext context, WidgetRef ref, String pageName) {
    if (ref.read(selectedPageProvider) != pageName) {
      ref.read(selectedPageProvider.notifier).state = pageName;
    }
  }
}
