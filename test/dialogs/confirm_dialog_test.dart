import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

void main() {
  group('showConfirmDialog 테스트 (Confirm Dialog Tests)', () {
    testWidgets('다이얼로그가 정상적으로 표시되는지 확인 (Dialog is displayed)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    showConfirmDialog(
                      context,
                      title: 'Test Title',
                      message: 'Test Message',
                      onConfirm: () {},
                    );
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      // 다이얼로그 열기
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // 내용 확인
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Message'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets(
      '취소 버튼 클릭 시 onConfirm 호출되지 않음 (Cancel button should NOT trigger onConfirm)',
      (tester) async {
        bool confirmed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showConfirmDialog(
                        context,
                        title: 'T',
                        message: 'M',
                        onConfirm: () {
                          confirmed = true;
                        },
                      );
                    },
                    child: const Text('Open'),
                  ),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        // 취소 클릭
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();

        expect(confirmed, false);
      },
    );

    testWidgets(
      '확인 버튼 클릭 시 onConfirm 호출됨 (Confirm button SHOULD trigger onConfirm)',
      (tester) async {
        bool confirmed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showConfirmDialog(
                        context,
                        title: 'T',
                        message: 'M',
                        onConfirm: () {
                          confirmed = true;
                        },
                      );
                    },
                    child: const Text('Open'),
                  ),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        // 확인 클릭
        await tester.tap(find.text('Confirm'));
        await tester.pumpAndSettle();

        expect(confirmed, true);
      },
    );

    testWidgets('커스텀 텍스트/컬러 적용 확인 (Custom text & color test)', (tester) async {
      const confirmText = 'OK';
      const cancelText = 'NO';
      const confirmColor = Colors.green;
      const cancelColor = Colors.orange;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    showConfirmDialog(
                      context,
                      title: 'Title',
                      message: 'Msg',
                      onConfirm: () {},
                      confirmText: confirmText,
                      cancelText: cancelText,
                      confirmColor: confirmColor,
                      cancelColor: cancelColor,
                    );
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // 텍스트 확인
      expect(find.text(confirmText), findsOneWidget);
      expect(find.text(cancelText), findsOneWidget);

      // 색상 확인
      final confirmWidget = tester.widget<Text>(find.text(confirmText));
      final cancelWidget = tester.widget<Text>(find.text(cancelText));

      expect(confirmWidget.style?.color, confirmColor);
      expect(cancelWidget.style?.color, cancelColor);
    });
  });
}
