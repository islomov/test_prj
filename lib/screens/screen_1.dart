import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constant/colors.dart';
import '../constant/font_size.dart';
import '../constant/spacing.dart';
import '../constant/texts.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColor.grey,
      child: InnerWidget(),
    );
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
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var _contentHeight = ProjectSpacing.spacing400;
      if (constraints.maxHeight < 600) {
        _contentHeight = ProjectSpacing.spacing200;
      }

      return Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
              ProjectSpacing.spacing20,
              ProjectSpacing.spacing0,
              ProjectSpacing.spacing20,
              ProjectSpacing.spacing0),
          decoration: const BoxDecoration(
              color: ProjectColor.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(ProjectSpacing.spacing15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.fromLTRB(
                          ProjectSpacing.spacing0,
                          ProjectSpacing.spacing0,
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
                    margin: const EdgeInsets.fromLTRB(
                        ProjectSpacing.spacing0,
                        ProjectSpacing.spacing10,
                        ProjectSpacing.spacing0,
                        ProjectSpacing.spacing0),
                    alignment: Alignment.topCenter,
                    child: const Text(
                      ProjectText.screen1_title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ProjectColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: ProjectFont.font30),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                    ProjectSpacing.spacing10,
                    ProjectSpacing.spacing5,
                    ProjectSpacing.spacing10,
                    ProjectSpacing.spacing5),
                child: Text(
                  ProjectText.screen1_subTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: ProjectColor.black,
                      fontWeight: FontWeight.normal,
                      fontSize: ProjectFont.font15),
                ),
              ),
              Container(
                color: ProjectColor.grey.withOpacity(ProjectSpacing.spacing065),
                height: _contentHeight,
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(ProjectSpacing.spacing10),
                    child: const Text(
                      ProjectText.screen1_desc,
                      style: TextStyle(color: ProjectColor.black),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: ProjectColor.black,
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 1.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        -5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(ProjectSpacing.spacing15),
                child: RaisedButton(
                  padding: const EdgeInsets.fromLTRB(
                      ProjectSpacing.spacing20,
                      ProjectSpacing.spacing10,
                      ProjectSpacing.spacing20,
                      ProjectSpacing.spacing15),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ProjectSpacing.spacing26)),
                  color: ProjectColor.purple,
                  onPressed: () {},
                  child: const Text(
                    ProjectText.screen1_button_text,
                    style: TextStyle(
                        color: ProjectColor.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
