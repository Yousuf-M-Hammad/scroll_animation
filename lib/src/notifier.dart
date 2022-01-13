part of scroll_animation;

class ScrollAnimationNotifier extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final bool dispatchBubble;
  final double defaultMaxOutOfScrollExtent;
  final double maxVelocityToCalculate;
  final double minVelocityToNotify;
  const ScrollAnimationNotifier({
    Key? key,
    required this.child,
    this.defaultMaxOutOfScrollExtent = 200,
    this.maxVelocityToCalculate = 400,
    this.minVelocityToNotify = 80,
    required this.scrollController,
    required this.dispatchBubble,
  }) : super(key: key);

  @override
  State<ScrollAnimationNotifier> createState() =>
      _ScrollAnimationNotifierState();
}

class _ScrollAnimationNotifierState extends State<ScrollAnimationNotifier> {
  int _lastMilli = DateTime.now().millisecondsSinceEpoch;
  final StreamController<double> _velocityStreamController =
      StreamController<double>();
  late final Stream<double> _velocityStream;
  @override
  void initState() {
    _velocityStream = _velocityStreamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        final now = DateTime.now();
        final timeDiff = now.millisecondsSinceEpoch - _lastMilli;
        double velocity = 0.0;
        if (notification is ScrollUpdateNotification) {
          velocity = notification.scrollDelta ?? 1.0 / timeDiff;
          _lastMilli = DateTime.now().millisecondsSinceEpoch;
        }
        if (notification is ScrollEndNotification) {
          velocity = 0;
          _lastMilli = DateTime.now().millisecondsSinceEpoch;
        }
        if (velocity.abs() > widget.minVelocityToNotify) {
          bool isNegative = velocity.isNegative;
          velocity = velocity.abs() - widget.minVelocityToNotify;
          velocity /= widget.maxVelocityToCalculate;
          velocity *= isNegative ? -1 : 1;
        } else {
          velocity = 0.0;
        }

        if (widget.scrollController.offset >
            widget.scrollController.position.maxScrollExtent) {
          velocity = widget.scrollController.offset -
              widget.scrollController.position.maxScrollExtent;
          velocity = velocity / widget.defaultMaxOutOfScrollExtent;
        }
        if (widget.scrollController.offset <
            widget.scrollController.position.minScrollExtent) {
          velocity = widget.scrollController.offset;
          velocity = velocity / widget.defaultMaxOutOfScrollExtent;
        }
        _velocityStreamController.add(velocity);
        return widget.dispatchBubble;
      },
      child: widget.child,
    );
  }
}
