import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_kit/src/layout/card_section.dart';
import 'package:flutter_widget_kit/src/layout/card_container.dart';

void main() {
  group('CardSection Tests', () {
    testWidgets('renders label text correctly', (WidgetTester tester) async {
      const labelText = 'Test Label';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardSection(
              label: labelText,
              children: const [Text('Child 1')],
            ),
          ),
        ),
      );

      expect(find.text(labelText), findsOneWidget);
    });

    testWidgets('renders child widgets correctly', (WidgetTester tester) async {
      const child1 = Text('Child 1');
      const child2 = Text('Child 2');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CardSection(children: [child1, child2])),
        ),
      );

      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
    });

    testWidgets('applies custom outer padding correctly', (
      WidgetTester tester,
    ) async {
      const outerPadding = EdgeInsets.all(20);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardSection(
              label: 'Label',
              padding: outerPadding,
              children: const [Text('Child')],
            ),
          ),
        ),
      );

      final cardContainerFinder = find.byType(CardContainer);
      expect(cardContainerFinder, findsOneWidget);

      final cardContainerWidget = tester.widget<CardContainer>(
        cardContainerFinder,
      );
      expect(cardContainerWidget.padding, outerPadding);
    });

    testWidgets('applies custom inner contentPadding correctly', (
      WidgetTester tester,
    ) async {
      const contentPadding = EdgeInsets.symmetric(horizontal: 30, vertical: 10);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardSection(
              label: 'Label',
              contentPadding: contentPadding,
              children: const [Text('Child')],
            ),
          ),
        ),
      );

      final cardContainerFinder = find.byType(CardContainer);
      expect(cardContainerFinder, findsOneWidget);

      final cardContainerWidget = tester.widget<CardContainer>(
        cardContainerFinder,
      );
      expect(cardContainerWidget.contentPadding, contentPadding);
    });

    testWidgets('applies backgroundColor correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardSection(
              backgroundColor: Colors.red,
              children: const [Text('Child')],
            ),
          ),
        ),
      );

      final cardContainerFinder = find.byType(CardSection);
      expect(cardContainerFinder, findsOneWidget);

      final cardContainerWidget = tester.widget<CardSection>(
        cardContainerFinder,
      );
      expect(cardContainerWidget.backgroundColor, Colors.red);
    });
  });
}
