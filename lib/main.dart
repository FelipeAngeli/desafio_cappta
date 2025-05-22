import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di/service_locator.dart';
import 'core/app/app_widget.dart';

void main() {
  setupLocator();

  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
