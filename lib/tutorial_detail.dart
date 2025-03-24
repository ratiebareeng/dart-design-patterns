import 'package:design_patterns/data.dart';
import 'package:design_patterns/singleton.dart';
import 'package:design_patterns/tutorial_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TutorialDetailPage extends StatefulWidget {
  final String tutorial;
  const TutorialDetailPage({super.key, required this.tutorial});

  @override
  State<TutorialDetailPage> createState() => _TutorialDetailState();
}

class _TutorialDetailState extends State<TutorialDetailPage> {
  bool isMultiPageView = false;
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tutorial),
        actions: [
          Switch(
            value: isMultiPageView,
            onChanged: (value) {
              setState(() {
                isMultiPageView = value;
                currentPageIndex = 0;
              });
            },
          ),
          Text(isMultiPageView ? 'Page View' : 'Single Page'),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isMultiPageView ? _buildPageView() : _buildSinglePageView(),
      ),
    );
  }

  Widget _buildSinglePageView() {
    return ListView.builder(
      itemCount: tutorialDetails[widget.tutorial]!.length,
      itemBuilder: (context, index) {
        return _buildTutorialStep(tutorialDetails[widget.tutorial]![index]);
      },
    );
  }

  Widget _buildPageView() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: tutorialDetails.length,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildTutorialStep(
                    tutorialDetails[widget.tutorial]![currentPageIndex]),
              );
            },
          ),
        ),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tutorialDetails[widget.tutorial]!.map((tutorialDetail) {
          int index = tutorialDetails[widget.tutorial]!.indexOf(tutorialDetail);
          return GestureDetector(
            onTap: () => setState(() {
              currentPageIndex = index;
            }),
            child: Container(
              width: currentPageIndex == index ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: index == currentPageIndex
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTutorialStep(TutorialStep step) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              step.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              step.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            _buildCodeSnippet(step.codeSnippet),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeSnippet(String code) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      //  padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              code,
              style: TextStyle(
                fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              onPressed: () async {
                try {
                  await Clipboard.setData(
                    ClipboardData(text: code),
                  );
                  if (!mounted) {
                    return;
                  }

                  Service.instance
                      .simpleSnackbar(context, 'Copied to Clipboard');
                } catch (_) {
                  if (!mounted) {
                    return;
                  }

                  Service.instance
                      .simpleSnackbar(context, 'Failed to copy to Clipboard');
                }
              },
              icon: const Icon(Icons.copy),
            ),
          )
        ],
      ),
    );
  }
}
