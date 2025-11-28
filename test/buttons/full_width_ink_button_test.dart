import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

void main() {
  group('FullWidthInkButton', () {
    testWidgets(
      '버튼이 화면에 표시되고 텍스트가 올바른지 확인 (Button is displayed and text is correct)',
      (WidgetTester tester) async {
        const buttonText = 'Click Me';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FullWidthInkButton(text: buttonText, onTap: () {}),
            ),
          ),
        );

        // 버튼 텍스트가 화면에 존재하는지 확인
        expect(find.text(buttonText), findsOneWidget);

        // 버튼 타입 확인
        expect(find.byType(FullWidthInkButton), findsOneWidget);
      },
    );

    testWidgets('onTap 콜백이 호출되는지 확인 (Check if onTap callback is called)', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FullWidthInkButton(
              text: 'Tap Me',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      // 버튼 클릭
      await tester.tap(find.byType(FullWidthInkButton));
      await tester.pump();

      // 콜백이 호출되었는지 확인
      expect(tapped, true);
    });

    testWidgets('커스텀 색상 적용 확인 (Verify custom colors applied)', (
      WidgetTester tester,
    ) async {
      const bgColor = Colors.red;
      const splashColor = Colors.green;
      const textColor = Colors.yellow;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FullWidthInkButton(
              text: 'Color Test',
              onTap: () {},
              backgroundColor: bgColor,
              splashColor: splashColor,
              textColor: textColor,
            ),
          ),
        ),
      );

      // FullWidthInkButton 위젯만 찾도록 범위 제한
      final buttonFinder = find.byType(FullWidthInkButton);

      // 내부 Text 위젯 확인
      final textWidget = tester.widget<Text>(
        find.descendant(of: buttonFinder, matching: find.text('Color Test')),
      );
      expect(textWidget.style?.color, textColor);

      // 내부 Material 위젯 확인
      final materialWidget = tester.widget<Material>(
        find.descendant(of: buttonFinder, matching: find.byType(Material)),
      );
      expect(materialWidget.color, bgColor);
    });
  });
}
