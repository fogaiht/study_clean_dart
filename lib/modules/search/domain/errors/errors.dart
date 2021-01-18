abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {
   final String message;

  InvalidTextError(this.message);
}

class DataSourceError implements FailureSearch {
  final String message;

  DataSourceError({this.message});
}
