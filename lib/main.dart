import 'package:design_patterns/data.dart';
import 'package:design_patterns/tutorial_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const TutorialApp());
}

class TutorialApp extends StatelessWidget {
  const TutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const TutorialHomePage(),
    );
  }
}

class TutorialHomePage extends StatefulWidget {
  const TutorialHomePage({super.key});

  @override
  State<TutorialHomePage> createState() => _TutorialHomePageState();
}

class _TutorialHomePageState extends State<TutorialHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial'),
      ),
      body: GridView.count(
        crossAxisCount: kIsWeb ? 4 : 2,
        mainAxisSpacing: kIsWeb ? 16 : 8,
        crossAxisSpacing: kIsWeb ? 16 : 8,
        padding: const EdgeInsets.all(16),
        children: tutorials
            .map((tutorial) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TutorialDetailPage(tutorial: tutorial),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Text(tutorial),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
