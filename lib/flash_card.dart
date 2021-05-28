library flash_card;

import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlashCard extends StatefulWidget {
  final Widget frontWidget;

  final Widget backWidget;

  final Duration duration;
  final double height;
  final double width;

  FlashCard({
    Key key,
    @required this.frontWidget,
    @required this.backWidget,
    this.duration = const Duration(milliseconds: 500),
    this.height = 200,
    this.width = 200
  }):super(key: key);

  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<double> _backRotation;

  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.duration);
    animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: math.pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(math.pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);

    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(math.pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -math.pi / 2, end: 0.0).chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _toggleSide,
          child: AnimatedCard(
            animation: animation,
            child: widget.backWidget,
            height: widget.height,
            width: widget.width,
          ),
        ),
        GestureDetector(
          onTap: _toggleSide,
          child: AnimatedCard(
            animation: _backRotation,
            child: widget.frontWidget,
            height: widget.height,
            width: widget.width,
          ),
        ),
      ],
    );
  }

  void _toggleSide() {
    if (isFrontVisible) {
      _controller.forward();
      isFrontVisible = false;
    } else {
      _controller.reverse();
      isFrontVisible = true;
    }
  }
}

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final double height;
  final double width;

  AnimatedCard({
    @required this.child,
    @required this.animation,
    @required this.height,
    @required this.width
  })
      : assert(child != null),
        assert(animation != null),
        assert(height!=null && height >10),
        assert(width!=null && width >10);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            borderOnForeground: false,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: child,
            )
        ),
      ),
    );
  }
}

