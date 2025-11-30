import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

void main() {
  group('BoxContainer 테스트 (BoxContainer Tests)', () {
    testWidgets('child 위젯이 정상적으로 표시되는지 확인 (Child is rendered)', (tester) async {
      const testKey = Key('child');

      await tester.pumpWidget(
        MaterialApp(
          home: BoxContainer(child: Container(key: testKey)),
        ),
      );

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('기본 padding 이 적용되는지 확인 (Default padding applied)', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: BoxContainer(child: Text('Test'))),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final padding = container.padding as EdgeInsets;

      expect(padding, const EdgeInsets.all(15));
    });

    testWidgets('커스텀 padding 적용 확인 (Custom padding applied)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BoxContainer(padding: EdgeInsets.all(30), child: Text('P')),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final padding = container.padding as EdgeInsets;

      expect(padding, const EdgeInsets.all(30));
    });

    testWidgets('배경색(backgroundColor) 적용 확인 (Background color applied)', (
      tester,
    ) async {
      const bgColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: BoxContainer(backgroundColor: bgColor, child: Text('BG')),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, bgColor);
    });

    testWidgets('borderColor 적용 확인 (Border color applied)', (tester) async {
      const borderColor = Colors.blue;

      await tester.pumpWidget(
        const MaterialApp(
          home: BoxContainer(borderColor: borderColor, child: Text('BC')),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;

      expect(border.top.color, borderColor);
    });

    testWidgets('borderRadius 적용 확인 (Border radius applied)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BoxContainer(borderRadius: 20, child: Text('BR')),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final radius = decoration.borderRadius as BorderRadius;

      expect(radius.topLeft.x, 20);
      expect(radius.topRight.x, 20);
    });
  });
}
