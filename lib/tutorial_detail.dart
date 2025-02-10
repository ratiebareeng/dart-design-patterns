import 'package:design_patterns/data.dart';
import 'package:design_patterns/tutorial_step.dart';
import 'package:flutter/material.dart';

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
          const SizedBox(width: 8),
          Text(isMultiPageView ? 'Page View' : 'Single Page'),
        ],
      ),
      body: isMultiPageView ? _buildPageView() : _buildSinglePageView(),
    );
  }

  Widget _buildSinglePageView() {
    return ListView.builder(
      itemCount: tutorialSteps.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return _buildTutorialStep(tutorialSteps[index]);
      },
    );
  }

  Widget _buildPageView() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: tutorialSteps.length,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildTutorialStep(tutorialSteps[currentPageIndex]),
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
        children: tutorialSteps.map((tutorialStep) {
          int index = tutorialSteps.indexOf(tutorialStep);
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
      padding: const EdgeInsets.all(16),
      child: SelectableText(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
