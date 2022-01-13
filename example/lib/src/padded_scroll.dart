part of scroll_animation;

class PaddedScrollContainer extends StatelessWidget {
  final bool forceMax;
  final Widget child;
  final bool usePadding;
  final double maxPadding;
  const PaddedScrollContainer({
    Key? key,
    this.maxPadding = 32.0,
    this.forceMax = true,
    this.usePadding = false,
    required this.child,
  }) : super(key: key);

  double _motionVelocity(double velocity) {
    velocity = velocity.abs();
    if (forceMax) {
      velocity = velocity > 1 ? 1 : velocity;
    }
    if (velocity > 1) {
      return velocity;
    }
    return Curves.ease.transform(velocity);
  }

  Axis _scrollDirection(BuildContext context) =>
      Scrollable.of(context)!.axisDirection == AxisDirection.left ||
              Scrollable.of(context)!.axisDirection == AxisDirection.right
          ? Axis.horizontal
          : Axis.vertical;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: context
          .findAncestorStateOfType<_ScrollAnimationNotifierState>()!
          ._velocityStream,
      initialData: 0.0,
      builder: (_, snapshot) => Builder(builder: (context) {
        if (usePadding) {
          print(_motionVelocity(snapshot.data!) * maxPadding / 2);
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: _scrollDirection(context) == Axis.vertical
                  ? _motionVelocity(snapshot.data!) * maxPadding / 2
                  : 0.0,
              horizontal: _scrollDirection(context) == Axis.vertical
                  ? 0.0
                  : _motionVelocity(snapshot.data!) * maxPadding / 2,
            ),
            child: child,
          );
        } else {
          return _scrollDirection(context) == Axis.vertical
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: _motionVelocity(snapshot.data!) * maxPadding / 2,
                    ),
                    FittedBox(child: child),
                    SizedBox(
                      height: _motionVelocity(snapshot.data!) * maxPadding / 2,
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: _motionVelocity(snapshot.data!) * maxPadding / 2,
                    ),
                    child,
                    SizedBox(
                      width: _motionVelocity(snapshot.data!) * maxPadding / 2,
                    ),
                  ],
                );
        }
      }),
    );
  }
}
