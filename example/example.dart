import "package:flutter/material.dart";
import 'package:timeline/model/timeline-model.dart';
import 'package:timeline/timeline.dart';

class TimelineExample extends StatelessWidget {

  final List<TimelineModel> list = [
    TimelineModel(
      id: "1",
      description: "Test 1",
      title: "Test 1"),
      TimelineModel(
      id: "2",
      description: "Test 2",
      title: "Test 2")
  ];

  @override
  Widget build(BuildContext context) {
    return new TimelineComponent(timelineList: list,);
  }


}