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

  final Color lineColor;

  final Color backgroundColor;

  const TimelineComponent({Key key, this.timelineList, this.lineColor, this.backgroundColor}) : super(key: key);

  @override
  TimelineComponentState createState() {
    return new TimelineComponentState();
  }

}

class TimelineComponentState extends State<TimelineComponent> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;
 
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), 
        vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
              child: new ListView.builder(
                itemCount: widget.timelineList.length,
                itemBuilder: (_, index) {
                  return new TimelineElement(
                    lineColor: widget.lineColor==null?Theme.of(context).accentColor:widget.lineColor,
                    backgroundColor: widget.backgroundColor==null?Theme.of(context).backgroundColor:widget.backgroundColor,
                    model: widget.timelineList[index],
                    firstElement: index==0,
                    lastElement: widget.timelineList.length==index+1,
                    controller: controller,
                  );
                },
              ),
            );
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

}