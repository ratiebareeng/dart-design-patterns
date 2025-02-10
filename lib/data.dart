import 'package:design_patterns/tutorial_step.dart';

List<String> tutorials = [
  'Singleton Pattern',
  'Factory Pattern',
  'Observer Pattern',
];

Map<String, List<TutorialStep>> tutorialDetails = {
  'Singleton Pattern': singletonTutorialSteps,
  'Factory Pattern': tutorialSteps,
  'Observer Pattern': tutorialSteps,
};

// Sample tutorial data
final List<TutorialStep> singletonTutorialSteps = [
  TutorialStep(
    title: 'Step 1: Private static inctance',
    description:
        'Create a private static instance of the class. This will only be accessible within the class:',
    codeSnippet: 'static Service? _instance;',
  ),
  TutorialStep(
    title: 'Step 2: Private constructor',
    description:
        'Create a private static instance of the class. Also only be accessible within the class:',
    codeSnippet: 'Service._internal();',
  ),
  TutorialStep(
    title: 'Step 3: Create Main Widget',
    description: 'Create your main widget structure:',
    codeSnippet: '''
factory Service() {
    _instance ??= Service._internal();

    return _instance!;
  }
''',
  ),
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
