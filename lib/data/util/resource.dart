abstract class Resource<T> {
  const Resource();
}

/// Success state with data
class Success<T> extends Resource<T> {
  final T data;
  const Success(this.data);
}

/// Failure state with error
class Failure<T> extends Resource<T> {
  final Exception? exception;
  final String? message;

  const Failure({this.exception, this.message});
}

/// Loading state (no data yet)
class Loading<T> extends Resource<T> {
  const Loading();
}
