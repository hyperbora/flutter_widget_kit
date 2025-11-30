import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;

  const BoxContainer({
    super.key,
    required this.child,
    this.padding,
    this.contentPadding,
    this.borderRadius = 16,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor ?? Colors.grey.shade300),
        ),
        padding: contentPadding ?? const EdgeInsets.all(15),
        child: child,
      ),
    );
  }
}
