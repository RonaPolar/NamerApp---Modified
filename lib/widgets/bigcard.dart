import 'package:flutter/material.dart';

String toUpperCase(String input) {
  return input.toUpperCase();
}

String toPascalCase(String input) {
  return input.split(' ').map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase()).join(' ');
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final String pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 25,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          toUpperCase(pair),
          style: style,
          semanticsLabel: toPascalCase(pair),
        ),
      ),
    );
  }
}
