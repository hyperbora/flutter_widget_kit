# flutter_widget_kit

## 패키지 설명 / Package Description

`flutter_widget_kit`은 Flutter 앱에서 재사용 가능한 공통 위젯을 모아둔 라이브러리입니다.  
앱 개발 시 반복적으로 사용되는 UI 컴포넌트를 쉽게 가져다 쓰고 커스터마이징할 수 있습니다.

`flutter_widget_kit` is a Flutter package that provides reusable UI widgets.  
It helps developers quickly use and customize common components in multiple Flutter apps.

---

## 기능 / Features

- **BoxContainer**: 내부 padding, 외부 padding, 배경색, 테두리 등을 설정할 수 있는 컨테이너
- **CardContainer**: title, leading, trailing, padding, contentPadding, backgroundColor, onTap 지원
- **CardSection**: 레이블과 여러 자식을 포함하는 섹션, padding/contentPadding과 배경색 지원
- **FullWidthInkButton**: 전체 너비 버튼, 텍스트, 색상, onTap 콜백 지원
- **ConfirmDialog**: 확인/취소 다이얼로그 표시
- **Loading**: 비동기 작업 중 로딩 오버레이 표시

- **BoxContainer**: container with inner padding, outer padding, background color, and border options
- **CardContainer**: supports title, leading/trailing, padding, contentPadding, backgroundColor, onTap
- **CardSection**: section with a label and multiple children, supports padding/contentPadding and backgroundColor
- **FullWidthInkButton**: full-width button with text, color, and onTap callback
- **ConfirmDialog**: shows a confirmation/cancel dialog
- **Loading**: displays a loading overlay during async operations

---

## 시작하기 / Getting Started

### 설치 / Installation

Git 레포지토리에서 직접 가져오기:

```yaml
dependencies:
  flutter_widget_kit:
    git:
      url: https://github.com/hyperbora/flutter_widget_kit.git
```

## 사용법 / Usage

```dart
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

// BoxContainer 예시 / Example
BoxContainer(
  padding: EdgeInsets.all(8),
  contentPadding: EdgeInsets.all(16),
  backgroundColor: Colors.grey.shade100,
  borderColor: Colors.blue,
  child: Text('Hello BoxContainer'),
);

// CardContainer 예시 / Example
CardContainer(
  title: Text('Card Title'),
  leading: Icons.star,
  trailing: Icon(Icons.arrow_forward),
  padding: EdgeInsets.all(8),
  contentPadding: EdgeInsets.all(16),
  backgroundColor: Colors.white,
  onTap: () => print('Card tapped!'),
);

// CardSection 예시 / Example
CardSection(
  label: 'Section Label',
  padding: EdgeInsets.all(8),
  contentPadding: EdgeInsets.all(16),
  backgroundColor: Colors.white,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
);
```

## Example 앱 실행 안내 / Running the Example App

### iOS

```sh
cd example
flutter pub get
flutter run -d ios
```

### Android

```sh
cd example
flutter pub get
flutter run -d android
```
