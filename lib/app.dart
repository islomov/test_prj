import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'constant/colors.dart';
import 'providers/horizontal_items.dart';
import 'providers/vertical_items.dart';
import 'screens/screen_0.dart';
import 'screens/screen_1.dart';
import 'screens/screen_2.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WidgetsApp(
        color: ProjectColor.black,
        debugShowCheckedModeBanner: false,
        routes: {
          Screen0.routeName: (context) => const Screen0(),
          Screen1.routeName: (context) => Screen1(),
          Screen2.routeName: (context) => Screen2(),
        },
        pageRouteBuilder: _pageRouteBuilder,
      );

  PageRoute<T> _pageRouteBuilder<T>(
    RouteSettings settings,
    WidgetBuilder builder,) =>
      PageRouteBuilder(
        settings: settings,
        transitionDuration: Duration.zero,
        pageBuilder: (context, _, __) => builder(context),
      );

}

