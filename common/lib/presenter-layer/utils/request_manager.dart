import 'dart:async';
import 'package:common/behaviour-layer/domain/usecase/base/params.dart';
import 'package:common/behaviour-layer/shared/model/base_error.dart';
import 'package:common/presenter-layer/utils/resource.dart';
import 'package:dartz/dartz.dart';

class RequestManager<T> {
  final StreamController<Resource<T>> _resource =
      StreamController<Resource<T>>();

  RequestManager(Params params,
      {required Future<Either<BaseError, T>> Function() createCall}) {
    if (params.reloading) {
      _resource.sink.add(Resource.reloading<T>(data: null));
    } else {
      _resource.sink.add(Resource.loading<T>(data: null));
    }
    params.verify().fold(
      (l) async {
        _resource.sink.add(
          Resource.error<T>(error: l, data: null),
        );
        dispose();
      },
      (r) async {
        Either<BaseError, T> response = await createCall.call();
        response.fold((l) {
          _resource.sink.add(
            Resource.error<T>(
              error: l.transform(),
            ),
          );
          dispose();
        }, (r) {
          _resource.sink.add(
            Resource.success<T>(data: r),
          );
          dispose();
        });
      },
    );
  }

  Stream<Resource<T>> asFlow() => _resource.stream;

  void dispose() {
    _resource.close();
  }
}
