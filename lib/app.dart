import 'package:calcpack/models/theme.dart';
import 'package:calcpack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primary,
        appBar: AppBar(
          title: const Text(
            "CalcPack",
            style: TextStyle(color: secondary),
          ),
          backgroundColor: primary,
          iconTheme: const IconThemeData(color: secondary),
        ),
        drawer: const CalcDrawer(),
        body: Consumer(builder: (context, ref, _) {
          final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
          return Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: selectedPageBuilder ?? Container(),
          );
        }),
      ),
    );
  }
}
