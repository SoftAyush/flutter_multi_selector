import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Example app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title is present
    expect(find.text('MultiSelector Demo'), findsOneWidget);

    // Verify that we have the sections
    expect(find.text('1. Basic List Mode (with Validation)'), findsOneWidget);
    expect(find.text('2. Chip Mode (Separate Selected)'), findsOneWidget);
    expect(find.text('3. Custom Colors & Styling'), findsOneWidget);

    // Verify that we have the select buttons
    expect(find.text('Select Animals'), findsOneWidget);
    expect(find.text('Select Fruits'), findsOneWidget);
    expect(find.text('Select Tags'), findsOneWidget);
  });
}
