library timeline;

import 'package:flutter/material.dart';
import 'package:timeline/model/timeline-model.dart';
import 'package:timeline/timeline-element.dart';

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
              child: new ListView.builder(
                itemCount: widget.timelineList.length,
                itemBuilder: (_, index) {
                  return new TimelineElement(
                    lineColor: Theme.of(context).accentColor,
                    backgroundColor: Theme.of(context).backgroundColor,
                    model: widget.timelineList[index],
                    firstElement: index==0,
                    lastElement: widget.timelineList.length==index+1,
                  );
                },
              ),
            );
  }

}