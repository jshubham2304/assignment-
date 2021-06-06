import 'package:flutter/material.dart';

class AnimatedReloader extends AnimatedWidget {
  VoidCallback callback;
  AnimatedReloader({Key key, Animation<double> animation, this.callback})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.rotate(
      angle: animation.value,
      child: IconButton(
          icon: Icon(
            Icons.sync,
            size: 28,
          ), // <-- Icon
          onPressed: () => callback()),
    );
  }
}
