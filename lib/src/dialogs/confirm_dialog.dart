import 'package:flutter/material.dart';

Future<void> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required VoidCallback onConfirm,
  String? confirmText,
  String? cancelText,
  Color? confirmColor,
  Color? cancelColor,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(
            cancelText ?? 'Cancel',
            style: TextStyle(color: cancelColor ?? Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(
            confirmText ?? 'Confirm',
            style: TextStyle(color: confirmColor ?? Colors.red),
          ),
        ),
      ],
    ),
  );

  if (result == true) {
    onConfirm();
  }
}
