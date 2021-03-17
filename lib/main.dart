import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/horizontal_items.dart';
import 'providers/vertical_items.dart';

void main() => runZonedGuarded(
      _run,
      (error, stackTrace) {
        print(error);
        print(stackTrace);
      },
    );

void _run() => runApp(
      const App(),
    );
