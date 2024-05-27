import 'package:flutter/material.dart';

class AsyncBuilder extends StatefulWidget {
  bool unableLoader;
  bool isSuccess;
  Widget successWidget;
  Widget? failureWidget;

  AsyncBuilder({
    required this.isSuccess,
    this.unableLoader = false,
    required this.successWidget,
    this.failureWidget,
  });

  @override
  State<AsyncBuilder> createState() => _AsyncBuilderState();
}

class _AsyncBuilderState extends State<AsyncBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.unableLoader) {
      return Center(
        child: CircularProgressIndicator(color: Colors.black,),
      );
    }
    if (widget.isSuccess) {
      return widget.successWidget;
    } else {
      return widget.failureWidget ?? Container();
    }
  }
}
