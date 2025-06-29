library base_usecase;

abstract base class Usecase<Payload, Output> {
  const Usecase();

  Output execute(Payload payload);
}

abstract base class FutureUsecase<Payload, Output> {
  const FutureUsecase();

  Future<Output> execute(Payload payload);
}

abstract base class StreamUsecase<Payload, Output> {
  const StreamUsecase();

  Stream<Output> execute(Payload payload);
}

final class NoParams {
  const NoParams();
}
