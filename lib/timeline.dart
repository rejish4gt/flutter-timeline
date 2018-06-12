library timeline;

import 'package:flutter/material.dart';
import 'package:timeline/model/timeline-model.dart';
import 'package:timeline/timeline-element.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class TimelineComponent extends StatefulWidget {

  final List<TimelineModel> timelineList;

  const TimelineComponent({Key key, this.timelineList}) : super(key: key);

  @override
  TimelineComponentState createState() {
    return new TimelineComponentState();
  }

}

class TimelineComponentState extends State<TimelineComponent> {

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: 
          new Flexible(
            child: new Container(
              child: new ListView.builder(
                itemCount: widget.timelineList.length,
                itemBuilder: (_, index) {
                  return new TimelineElement(
                    lineColor: Theme.of(context).accentColor,
                    backgroundColor: Theme.of(context).backgroundColor,
                    model: widget.timelineList[index],
                  );
                },
              ),
            ),
          ),
    );
  }

}