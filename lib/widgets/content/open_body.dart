import 'package:flutter/material.dart';
import 'package:portfolio/widgets/finder_widget.dart';


class OpenBodyWidget extends StatefulWidget {
  @override
  _OpenBodyWidgetState createState() => _OpenBodyWidgetState();
}

class _OpenBodyWidgetState extends State<OpenBodyWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _curve,
      child: FinderWidget(),
    );
  }
}
