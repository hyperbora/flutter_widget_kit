import 'package:flutter/material.dart';
import 'package:flutter_widget_kit/src/layout/card_container.dart';

class CardSection extends StatelessWidget {
  final String? label;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;

  const CardSection({
    super.key,
    this.label,
    required this.children,
    this.padding,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> childrenWithDivider = [];
    for (var i = 0; i < children.length; i++) {
      childrenWithDivider.add(children[i]);
      if (i != children.length - 1) {
        childrenWithDivider.add(
          const Divider(height: 0, indent: 50, endIndent: 50),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4, top: 2),
            child: Text(
              label!,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        CardContainer(
          color: Theme.of(context).colorScheme.surface,
          padding: padding,
          contentPadding: contentPadding,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: childrenWithDivider,
          ),
        ),
      ],
    );
  }
}
