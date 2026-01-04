import 'package:flutter/material.dart';

class MarqueeWidget extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final Duration backDuration;
  final Duration pauseDuration;

  const MarqueeWidget({
    super.key,
    required this.child,
    this.animationDuration = const Duration(seconds: 4),
    this.backDuration = const Duration(milliseconds: 800),
    this.pauseDuration = const Duration(milliseconds: 800),
  });

  @override
  State<MarqueeWidget> createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() async {
    while (mounted) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0) {
        await Future.delayed(widget.pauseDuration);
        if (mounted) {
          await _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: widget.animationDuration,
            curve: Curves.linear,
          );
        }
        await Future.delayed(widget.pauseDuration);
        if (mounted) {
          // Jump back to start instantly to loop, or animate back?
          // Usually marquee loops.
          // For a simple loop, we can just jump.
          _scrollController.jumpTo(0.0);
        }
      } else {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      child: widget.child,
    );
  }
}
