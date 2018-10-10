/* Copyright 2018 Rejish Radhakrishnan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

library timeline;

import 'package:flutter/material.dart';
import 'package:timeline/model/timeline_model.dart';
import 'package:timeline/timeline_element.dart';

class TimelineComponent extends StatefulWidget {

  final List<TimelineModel> timelineList;

  final Color lineColor;

  final Color backgroundColor;

  final Color headingColor;

  final Color descriptionColor;

  final Color shrinkWrap;
    
  const TimelineComponent({Key key, this.timelineList, this.lineColor, this.backgroundColor, this.headingColor, this.descriptionColor, this.shrinkWrap = false}) : super(key: key);

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
                shrinkWrap: widget.shrinkWrap,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return new TimelineElement(
                    lineColor: widget.lineColor==null?Theme.of(context).accentColor:widget.lineColor,
                    backgroundColor: widget.backgroundColor==null?Colors.white:widget.backgroundColor,
                    model: widget.timelineList[index],
                    firstElement: index==0,
                    lastElement: widget.timelineList.length==index+1,
                    controller: controller,
                    headingColor: widget.headingColor,
                    descriptionColor: widget.descriptionColor,
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
