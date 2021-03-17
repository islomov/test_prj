import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../constant/font_size.dart';
import '../constant/spacing.dart';
import '../constant/texts.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    return InnerWidget();
  }
}

class InnerWidget extends StatefulWidget {
  InnerWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InnerWidgetState();
  }
}

class _InnerWidgetState extends State<InnerWidget> {

  HorizontalItemsProvider _horizontalDataProvider;
  VerticalItemsProvider _verticalDataProvider;
  double _cardWidth;

  @override
  void initState() {
    _cardWidth = MediaQuery.of(context).size.width - 72;
    _horizontalDataProvider = Provider.of<HorizontalItemsProvider>(context);
    _verticalDataProvider = Provider.of<VerticalItemsProvider>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              "Section 1 (${_horizontalDataProvider.itemsCount})",
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
                itemCount: _horizontalDataProvider.itemsCount,
                itemBuilder: (context, index) {
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
              "Section 2 (${_verticalDataProvider.itemsCount})",
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
                  itemCount: _verticalDataProvider.itemsCount,
                  itemBuilder: (context, index) {
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

  @override
  void dispose() {
    if (_horizontalDataProvider != null && _verticalDataProvider != null) {
      _horizontalDataProvider.dispose();
      _verticalDataProvider.dispose();
    }
    super.dispose();
  }
}
