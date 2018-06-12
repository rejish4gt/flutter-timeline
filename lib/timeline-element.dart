import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:timeline/model/timeline-model.dart';

class TimelinePainter extends CustomPainter {

  final Color lineColor;
  final Color backgroundColor;
  final bool firstElement;
  final bool lastElement;

  TimelinePainter({
    @required this.lineColor,
    @required this.backgroundColor,
    this.firstElement = false,
    this.lastElement,
  }) :super();

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    _centerElementPaint(canvas, size);
  }

  void _centerElementPaint(Canvas canvas, ui.Size size)
  {
    Paint linePaint = new Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

    canvas.drawLine(
      size.topCenter(new Offset(0.0, 2.0)), 
      size.bottomCenter(new Offset(0.0, -2.0)), 
      linePaint);

  }

  @override
  bool shouldRepaint(TimelinePainter oldDelegate) {
    return oldDelegate.lineColor!=lineColor || oldDelegate.backgroundColor!=backgroundColor;
  }

}

class TimelineElement extends StatelessWidget {

  final Color lineColor;
  final Color backgroundColor;
  final TimelineModel model;

  TimelineElement({
    @required this.lineColor,
    @required this.backgroundColor,
    @required this.model,
  });

  Widget _buildLine(BuildContext context) {
    return new Container(
      width: 40.0,
      child: new CustomPaint(
        painter: new TimelinePainter(
          lineColor: lineColor,
          backgroundColor: backgroundColor
        ),
      ),
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: new Text(
            model.title,
            style: new TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        new Text(
          model.description,
          style: new TextStyle(
            color: Colors.grey
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildLine(context),
          new Expanded(
            child: _buildContentColumn(context),
            ),
        ],
      ),
    );
  }

}