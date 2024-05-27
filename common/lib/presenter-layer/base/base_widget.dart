import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseWidget extends StatefulHookConsumerWidget {
  final Widget? child;
  final Widget Function(BuildContext context, WidgetRef ref, Widget? child)
      builder;

  const BaseWidget({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _BaseWidget();
}

class _BaseWidget extends ConsumerState<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return widget.builder(context, ref, child);
      },
      child: widget.child,
    );
  }
}
