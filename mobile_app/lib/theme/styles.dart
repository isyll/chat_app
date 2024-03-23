import 'package:flutter/material.dart';

class AppStyles {
  const AppStyles(this.context);

  final BuildContext context;

  get titleStyle =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 28.0);
  get labelStyle => Theme.of(context)
      .textTheme
      .headlineSmall!
      .copyWith(fontWeight: FontWeight.normal, fontSize: 20);
  get divider => Divider(
        color: Theme.of(context).colorScheme.tertiary,
        height: 2,
        thickness: 1,
      );
}
