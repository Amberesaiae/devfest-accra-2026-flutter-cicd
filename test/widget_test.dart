import 'package:flutter_test/flutter_test.dart';
import 'package:devfest_accra_2026/main.dart';

void main() {
  testWidgets('DevFest welcome screen renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DevFestApp());

    expect(find.text('Welcome to\nDevFest Accra 2026'), findsOneWidget);
    expect(find.text('My name is Julius.'), findsOneWidget);
    expect(find.text('From Code to Testers 🚀'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Codemagic'), findsOneWidget);
    expect(find.text('Firebase'), findsOneWidget);
  });

  testWidgets('Tapping Explore Session Agenda opens modal sheet', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DevFestApp());

    // Ensure button is scrolled into view in test environment
    final buttonFinder = find.text('Explore Session Agenda');
    await tester.ensureVisible(buttonFinder);
    await tester.pumpAndSettle();

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Session Agenda & Key Takeaways'), findsOneWidget);
    expect(find.text('Automated CI/CD with Codemagic'), findsOneWidget);

    // Dismiss sheet
    await tester.tap(find.text('Ready to Roll!'));
    await tester.pumpAndSettle();

    expect(find.text('Session Agenda & Key Takeaways'), findsNothing);
  });
}
