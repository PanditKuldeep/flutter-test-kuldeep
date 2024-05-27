import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// todo The purpose of hooks is that developer can make custom ones if they need to.
/// writing my own hook that combines useFuture and useMemoized
AsyncSnapshot<T> useCustomHook<T>(Future<T> Function() create) {
  final future = useMemoized(create, const []);
  return useFuture(future);
}
