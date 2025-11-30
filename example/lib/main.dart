import 'package:flutter/material.dart';
import 'package:flutter_widget_kit/flutter_widget_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Kit Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Widget Kit Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _showConfirmDialog() async {
    bool result = false;
    final originalContext = context;
    await showConfirmDialog(
      originalContext,
      title: 'Confirm',
      message: 'Do you want to proceed?',
      confirmText: 'Yes',
      cancelText: 'No',
      onConfirm: () {
        result = true;
      },
    );
    if (originalContext.mounted) {
      ScaffoldMessenger.of(originalContext).showSnackBar(
        SnackBar(content: Text(result == true ? 'Confirmed' : 'Cancelled')),
      );
    }
  }

  Future<void> _showLoading() async {
    withLoading(context, () {
      return Future.delayed(const Duration(milliseconds: 800));
    }, 'Now Loading...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BoxContainer(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.blue.shade50,
              borderColor: Colors.blue,
              child: const Text(
                'This is a BoxContainer with custom padding, background, and border.',
              ),
            ),
            const SizedBox(height: 16),
            CardContainer(
              title: const Text('CardContainer Title'),
              leading: Icons.info,
              trailing: const Icon(Icons.arrow_forward),
              contentPadding: const EdgeInsets.all(16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('CardContainer tapped')),
                );
              },
            ),
            const SizedBox(height: 16),
            CardSection(
              label: 'Section Label',
              padding: const EdgeInsets.symmetric(vertical: 1),
              contentPadding: const EdgeInsets.all(8),
              children: const [
                Text('Child 1 in CardSection'),
                Text('Child 2 in CardSection'),
              ],
            ),
            const SizedBox(height: 16),
            CardSection(
              label: 'Section with Card',
              padding: const EdgeInsets.symmetric(vertical: 1),
              contentPadding: const EdgeInsets.all(2),
              children: [
                CardContainer(
                  leading: Icons.access_time_rounded,
                  color: Colors.teal,
                  title: Text(
                    'inner1',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'tailing1',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.edit, size: 18, color: Colors.grey),
                    ],
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('inner1 tapped')),
                    );
                  },
                ),
                CardContainer(
                  leading: Icons.data_array,
                  color: Colors.orange,
                  title: Text(
                    'inner2',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'tailing2',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.check, size: 18, color: Colors.grey),
                    ],
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('inner2 tapped')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            FullWidthInkButton(
              text: 'FullWidthInkButton',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('FullWidthInkButton tapped')),
                );
              },
              backgroundColor: Colors.deepPurple,
              textColor: Colors.white,
            ),
            const SizedBox(height: 16),
            FullWidthInkButton(
              text: 'Show ConfirmDialog',
              onTap: _showConfirmDialog,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            ),
            const SizedBox(height: 16),
            FullWidthInkButton(
              text: 'Show Loading Overlay',
              onTap: _showLoading,
              backgroundColor: Colors.orange,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
