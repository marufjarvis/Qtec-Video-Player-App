import 'package:flutter/material.dart';

import '../../../../contstant/string.dart';

AppBar homeAppbar(BuildContext context) {
  return AppBar(
    title: Text(
      AppString.tranding,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
