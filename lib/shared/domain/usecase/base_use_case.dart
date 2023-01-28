import 'dart:async';

abstract class BaseUseCaseParam<P, R> {
  final StreamController<R> _resultController = StreamController.broadcast();

  Stream<R> get result => _resultController.stream;

  void execute(P params) {
    _resultController.addStream(invoke(params));
  }

  Stream<R> invoke(P params);
}

abstract class BaseUseCase<R> {

  final StreamController<R> _resultController = StreamController.broadcast();

  Stream<R> get result => _resultController.stream;

  void execute() {
    _resultController.addStream(invoke());
  }

  Stream<R> invoke();
}
