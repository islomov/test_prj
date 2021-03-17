import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../constant/font_size.dart';
import '../constant/spacing.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  State<StatefulWidget> createState() {
    return _Screen2State();
  }

}

class _Screen2State extends State<Screen2>{
  HorizontalItemsProvider _horizontalItemsProvider;
  VerticalItemsProvider _verticalItemsProvider;

  @override
  void initState() {
    super.initState();
    _horizontalItemsProvider = HorizontalItemsProvider();
    _verticalItemsProvider = VerticalItemsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Why I moved code from App widget to Screen2 widget.
        // Because, App widget is initiated once when we enter the app.
        // I first implemented in a way when Providers was provided in App widget,
        // and I disposed those providers in Screen2 widget. But when you reenter the screen2 again,
        // exception was thrown because,one instance of provider was used again. You can't reuse disposed providers.

        // This implementation helps me to avoid reusing providers again.
        // In project description there was no any note about reusing provider, or creating new provider.
        // I know using ChangeNotifierProvider.value(value:_horizontalItemsProvider)
        // in build method could lead into memory leaks but not disposing provider also lead to memory leak(timer is also not stopped)
        // In both cases, I will be in memory leak problem.
        // https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html
        // Why I choosed this way of implementation is because, this will not lead any exceptions related to dispoing.

        ChangeNotifierProvider.value(
            value:_horizontalItemsProvider
        ),
        ChangeNotifierProvider.value(
          value: _verticalItemsProvider,
        ),
      ],
      child: InnerWidget(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // in order to avoid memory leaks.
    _horizontalItemsProvider.dispose();
    _verticalItemsProvider.dispose();
  }
}

class InnerWidget extends StatelessWidget {
  InnerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cardWidth = MediaQuery.of(context).size.width - 72;

    var _horizontalDataProvider = Provider.of<HorizontalItemsProvider>(context);
    var _verticalDataProvider = Provider.of<VerticalItemsProvider>(context);
    return Container(
      color: ProjectColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.fromLTRB(
                  ProjectSpacing.spacing0,
                  ProjectSpacing.spacing45,
                  ProjectSpacing.spacing0,
                  ProjectSpacing.spacing0),
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: const Icon(CupertinoIcons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
          Container(
            margin: const EdgeInsets.all(ProjectSpacing.spacing10),
            child: Text(
              "Section 1 (${_horizontalDataProvider == null
                  ? 0 :_horizontalDataProvider.itemsCount})",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: ProjectColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ProjectFont.font20),
            ),
          ),
          Container(
            height: ProjectSpacing.spacing120,
            margin: const EdgeInsets.fromLTRB(
                ProjectSpacing.spacing26,
                ProjectSpacing.spacing0,
                ProjectSpacing.spacing0,
                ProjectSpacing.spacing0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _horizontalDataProvider == null
                    ? 0 :_horizontalDataProvider.itemsCount ,
                itemBuilder: (context, index) {
                  if(_horizontalDataProvider==null){
                    return Container();
                  }
                  return Container(
                    width: _cardWidth,
                    height: ProjectSpacing.spacing120,
                    margin: const EdgeInsets.fromLTRB(
                        ProjectSpacing.spacing5,
                        ProjectSpacing.spacing0,
                        ProjectSpacing.spacing5,
                        ProjectSpacing.spacing0),
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                          _horizontalDataProvider.generateItemAt(index + 1),
                          style: const TextStyle(
                              color: ProjectColor.black,
                              fontWeight: FontWeight.bold,
                              fontSize: ProjectFont.font20),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.all(ProjectSpacing.spacing10),
            child: Text(
              "Section 2 (${_verticalDataProvider == null
                  ? 0 :_verticalDataProvider.itemsCount})",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: ProjectColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ProjectFont.font20),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(ProjectSpacing.spacing8),
                  itemCount: _verticalDataProvider == null
                      ? 0 :_verticalDataProvider.itemsCount,
                  itemBuilder: (context, index) {
                    if(_verticalDataProvider==null) {
                      return Container();
                    }
                    return Container(
                      height: ProjectSpacing.spacing120,
                      margin: const EdgeInsets.fromLTRB(
                          ProjectSpacing.spacing18,
                          ProjectSpacing.spacing5,
                          ProjectSpacing.spacing18,
                          ProjectSpacing.spacing5),
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text(
                              _verticalDataProvider.generateItemAt(index + 1),
                              style: const TextStyle(
                                  color: ProjectColor.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ProjectFont.font20)),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

