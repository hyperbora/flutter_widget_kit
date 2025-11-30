import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

void main() {
  group('withLoading 테스트 (Loading Overlay Tests)', () {
    testWidgets('로딩 오버레이가 표시되는지 확인 (Overlay appears correctly)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    withLoading(context, () async {
                      await Future.delayed(const Duration(milliseconds: 100));
                      return true;
                    }, 'Loading...');
                  },
                  child: const Text('Start'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Start'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 150));
    });

    testWidgets(
      'action 완료 후 오버레이가 사라지는지 확인 (Overlay closes after action completes)',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () async {
                      await withLoading(context, () async {
                        await Future.delayed(const Duration(milliseconds: 100));
                        return true;
                      }, 'Please wait');
                    },
                    child: const Text('Run'),
                  ),
                );
              },
            ),
          ),
        );

        // 실행
        await tester.tap(find.text('Run'));
        await tester.pump(); // 오버레이 뜨는 중

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        // action Future 끝날 때까지 시간 진행
        await tester.pump(const Duration(milliseconds: 150));

        // 다이얼로그가 닫혔는지 확인
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.text('Please wait'), findsNothing);
      },
    );

    testWidgets('withLoading 반환 값이 정상적으로 전달되는지 확인 (Return value test)', (
      tester,
    ) async {
      late bool result;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () async {
                    result = await withLoading(context, () async {
                      await Future.delayed(const Duration(milliseconds: 50));
                      return true;
                    }, 'Loading...');
                  },
                  child: const Text('Execute'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Execute'));
      await tester.pump(); // 오버레이 표시
      await tester.pump(const Duration(milliseconds: 80)); // action 완료까지

      expect(result, true);
    });
  });
}
