import 'dart:ui';

import 'package:flutter/material.dart';

class BeautifulButton extends StatefulWidget {
  double size;
  VoidCallback onPressed;
  Duration duration;
  Widget child;
  Color color;
  Color shade;
  BeautifulButton({@required this.size, @required this.onPressed, @required this.duration, this.child, this.color, this.shade});
  @override
  _BeautifulButtonState createState() => _BeautifulButtonState();
}

class _BeautifulButtonState extends State<BeautifulButton> with SingleTickerProviderStateMixin {
  double get buton_derinlik => widget.size * 0.1;
  Offset _offset;
  AnimationController _animationController;
  Animation<double> _animation;
  TickerFuture _ticker;

  @override
  void initState() {
    super.initState();
    initAnimation();
    _offset = Offset(buton_derinlik, -buton_derinlik);
  }

  initAnimation() {
    final oldControllerValue = _animationController?.value ?? 0.0;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds),
      value: oldControllerValue,
    );
    _animation = Tween<double>(begin: -buton_derinlik, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  void _onTapDown(_) {
    if (widget.onPressed != null) {
      _ticker = _animationController.animateTo(1.0);
    }
  }

  void _onTapUp(_) {
    if (widget.onPressed != null) {
      _ticker.whenComplete(() {
        _animationController.animateTo(0.0);
        widget.onPressed?.call();
      });
    }
  }

  void _onTapCancel() {
    if (widget.onPressed != null) {
      _animationController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size * 2,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.shade,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-_animation.value, _animation.value),
                  child: Container(
                    width: widget.size * 2,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: widget.child),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
