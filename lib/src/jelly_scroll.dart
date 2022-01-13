part of scroll_animation;

class JellyScrollContainer extends StatelessWidget {
  final bool forceMax;
  final double maxJellySkewAlpha;
  final double maxJellySkewBeta;
  final Widget child;
  final bool reverseJellyDirection;
  const JellyScrollContainer({
    Key? key,
    this.forceMax = true,
    required this.child,
    this.reverseJellyDirection = true,
    this.maxJellySkewAlpha = pi / 16,
    this.maxJellySkewBeta = 0,
    // this.maxJellySkewBeta = pi / 24,
  }) : super(key: key);

  double _motionVelocity(double velocity) {
    bool isNegative = velocity.isNegative;
    velocity = velocity.abs();
    if (forceMax) {
      velocity = velocity > 1 ? 1 : velocity;
    }
    if (velocity > 1)
      // ignore: curly_braces_in_flow_control_structures
      return velocity *
          (isNegative ? -1 : 1) *
          (reverseJellyDirection ? -1 : 1);
    double motion = Curves.ease.transform(velocity);
    motion *= isNegative ? -1 : 1;
    return motion * (reverseJellyDirection ? -1 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: context
          .findAncestorStateOfType<_ScrollAnimationNotifierState>()!
          ._velocityStream,
      initialData: 0.0,
      builder: (_, snapshot) {
        Matrix4 matrix = Matrix4.skew(
            _motionVelocity(snapshot.data!) * maxJellySkewBeta,
            _motionVelocity(snapshot.data!) * maxJellySkewAlpha);
        return Container(
          transform: matrix,
          child: child,
        );
      },
    );
  }
}
