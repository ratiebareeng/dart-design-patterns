import 'package:design_patterns/tutorial_step.dart';

List<String> tutorials = [
  'Singleton Pattern',
  'Factory Pattern',
  'Observer Pattern',
];

// Sample tutorial data
final List<TutorialStep> tutorialSteps = [
  TutorialStep(
    title: 'Step 1: Project Setup',
    description:
        'Create a new Flutter project using the following command in your terminal:',
    codeSnippet: 'flutter create my_app\ncd my_app',
  ),
  TutorialStep(
    title: 'Step 2: Add Dependencies',
    description:
        'Open your pubspec.yaml file and add the required dependencies:',
    codeSnippet: '''
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
''',
  ),
  TutorialStep(
    title: 'Step 3: Create Main Widget',
    description: 'Create your main widget structure:',
    codeSnippet: '''
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
''',
  ),
];
