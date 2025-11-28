import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_selector/DialogBox/multi_selector_dialog.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

void main() {
  group('MultiSelectorDialog', () {
    late List<MultiSelectorItem<String>> items;

    setUp(() {
      items = [
        MultiSelectorItem('1', 'Apple'),
        MultiSelectorItem('2', 'Banana'),
        MultiSelectorItem('3', 'Cherry'),
      ];
    });

    testWidgets('renders items correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiSelectorDialog<String>(
            items: items,
            initialValue: const [],
          ),
        ),
      );

      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Cherry'), findsOneWidget);
    });

    testWidgets('selection updates UI', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiSelectorDialog<String>(
            items: items,
            initialValue: const [],
          ),
        ),
      );

      // Tap 'Apple'
      await tester.tap(find.text('Apple'));
      await tester.pump();

      // Checkbox should be checked
      final checkbox = tester.widget<Checkbox>(
        find.descendant(
          of: find.widgetWithText(Row, 'Apple'),
          matching: find.byType(Checkbox),
        ),
      );
      expect(checkbox.value, isTrue);
    });

    testWidgets('confirm returns selected values', (WidgetTester tester) async {
      List<String>? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result = await showDialog<List<String>>(
                    context: context,
                    builder: (context) => MultiSelectorDialog<String>(
                      items: items,
                      initialValue: const [],
                      onConfirm: (values) {},
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apple'));
      await tester.pump();

      await tester.tap(find.text('CONFIRM'));
      await tester.pumpAndSettle();

      expect(result, contains('1'));
    });

    testWidgets('search filters list', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiSelectorDialog<String>(
            items: items,
            initialValue: const [],
            searchable: true,
          ),
        ),
      );

      // Open search
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Type 'ap'
      await tester.enterText(find.byType(TextField), 'ap');
      await tester.pump();

      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsNothing);
    });
  });
}
