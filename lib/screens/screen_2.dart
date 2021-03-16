import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                color: ProjectColor.white,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
          Container(
            margin: const EdgeInsets.all(ProjectSpacing.spacing10),
            child: const Text(
              ProjectText.screen2_section_1,
              textAlign: TextAlign.start,
              style: TextStyle(
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
                itemCount: 2,
                itemBuilder: (BuildContext context, index) {
                  var provider = new HorizontalItemsProvider();
                  return Container(
                    width: MediaQuery.of(context).size.width - 72,
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
                          provider.generateItemAt(index + 1),
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
            child: const Text(
              ProjectText.screen2_section_2,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: ProjectColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ProjectFont.font20),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(ProjectSpacing.spacing8),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    var provider = new VerticalItemsProvider();
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
                          child: Text(provider.generateItemAt(index + 1),
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
