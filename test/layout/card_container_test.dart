import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

void main() {
  group('CardContainer 테스트 (CardContainer Tests)', () {
    testWidgets('title 위젯이 정상 출력되는지 확인 (Title is displayed)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: CardContainer(title: Text('Hello'))),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets(
      'leading이 IconData일 때 CircleAvatar + Icon 출력 확인 (IconData leading creates avatar)',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CardContainer(title: Text('T'), leading: Icons.home),
          ),
        );

        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.byIcon(Icons.home), findsOneWidget);
      },
    );

    testWidgets(
      'leading이 일반 위젯일 때 그대로 표시되는지 확인 (Custom widget leading is rendered)',
      (tester) async {
        const leadingWidget = FlutterLogo();

        await tester.pumpWidget(
          const MaterialApp(
            home: CardContainer(title: Text('T'), leading: leadingWidget),
          ),
        );

        expect(find.byType(FlutterLogo), findsOneWidget);
      },
    );

    testWidgets('trailing 위젯 표시 확인 (Trailing widget appears)', (tester) async {
      const trailingWidget = Icon(Icons.arrow_forward);

      await tester.pumpWidget(
        const MaterialApp(
          home: CardContainer(title: Text('T'), trailing: trailingWidget),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('onTap 호출 확인 (Tap triggers callback)', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: CardContainer(
            title: const Text('Tap me'),
            onTap: () {
              tapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byType(CardContainer));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('커스텀 padding 적용 확인 (Custom padding applied)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CardContainer(title: Text('T'), padding: EdgeInsets.all(30)),
        ),
      );

      final outerPaddingWidget = tester.widget<Padding>(
        find
            .ancestor(of: find.byType(Card), matching: find.byType(Padding))
            .first,
      );
      expect(outerPaddingWidget.padding, const EdgeInsets.all(30));
    });

    testWidgets('커스텀 contentPadding 적용 확인 (Custom contentPadding applied)', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CardContainer(
            title: Text('T'),
            contentPadding: EdgeInsets.all(20),
          ),
        ),
      );

      final contentPaddingWidget = tester.widget<Padding>(
        find
            .descendant(
              of: find.byType(InkWell),
              matching: find.byType(Padding),
            )
            .first,
      );

      expect(contentPaddingWidget.padding, const EdgeInsets.all(20));
    });

    testWidgets('기본 padding 적용 확인 (Default padding applied)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: CardContainer(title: Text('T'))),
      );

      final contentPaddingWidget = tester.widget<Padding>(
        find
            .descendant(
              of: find.byType(InkWell),
              matching: find.byType(Padding),
            )
            .first,
      );

      expect(
        contentPaddingWidget.padding,
        const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      );
    });
  });
}
