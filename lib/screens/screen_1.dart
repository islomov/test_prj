import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/constant/font_size.dart';
import 'package:test_prj/constant/spacing.dart';
import 'package:test_prj/constant/texts.dart';

import '../constant/colors.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColor.grey,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(ProjectSpacing.spacing20),
          decoration: const BoxDecoration(
              color: ProjectColor.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(ProjectSpacing.spacing20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(
                      ProjectSpacing.spacing0,
                      ProjectSpacing.spacing0,
                      ProjectSpacing.spacing0,
                      ProjectSpacing.spacing0),
                  child: Stack(
                    children: [
                      Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.fromLTRB(
                              ProjectSpacing.spacing0,
                              ProjectSpacing.spacing5,
                              ProjectSpacing.spacing10,
                              ProjectSpacing.spacing0),
                          child: Material(
                            color: ProjectColor.white,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(
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
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    ProjectSpacing.spacing10,
                    ProjectSpacing.spacing5,
                    ProjectSpacing.spacing10,
                    ProjectSpacing.spacing5),
                child: const Text(
                  ProjectText.screen1_subTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: ProjectColor.black,
                      fontWeight: FontWeight.normal,
                      fontSize: ProjectFont.font15),
                ),
              ),
              Container(
                height: ProjectSpacing.spacing400,
                color: ProjectColor.grey.withOpacity(ProjectSpacing.spacing08),
                child:Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown:true,
                  child:  SingleChildScrollView(
                    // ignore: lines_longer_than_80_chars
                    controller: _scrollController, // <---- Same as the Scrollbar controller
                    padding: EdgeInsets.all(ProjectSpacing.spacing10),
                    child: Text(
                      ProjectText.screen1_desc,
                      style: TextStyle(color: ProjectColor.black),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    ProjectSpacing.spacing0,
                    ProjectSpacing.spacing20,
                    ProjectSpacing.spacing0,
                    ProjectSpacing.spacing20),
                child: RaisedButton(
                  padding: const EdgeInsets.fromLTRB(
                      ProjectSpacing.spacing20,
                      ProjectSpacing.spacing15,
                      ProjectSpacing.spacing20,
                      ProjectSpacing.spacing15),
                  shape: RoundedRectangleBorder(
                      // ignore: lines_longer_than_80_chars
                      borderRadius:
                          BorderRadius.circular(ProjectSpacing.spacing20)),
                  color: ProjectColor.purple,
                  onPressed: () {},
                  child: const Text(
                    ProjectText.screen1_button_text,
                    style: TextStyle(
                      color: ProjectColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
