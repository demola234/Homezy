class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class CacheException implements Exception {}


class TddServerException implements ServerException {
  final String message;

  TddServerException(this.message);
}

class UnexpectedServerException implements ServerException {
  final String msg;
  UnexpectedServerException([this.msg = "An unexpected error Occurred"]);

  @override
  String get message => msg;
}


class TimeoutServerException implements ServerException {
  final String msg;
  TimeoutServerException([this.msg = "An unexpected error Occurred"]);

  @override
  String get message => msg;
}

class InvalidArgOrDataException implements ServerException {
  final String msg;
  InvalidArgOrDataException([this.msg = "An unexpected error Occurred"]);

  @override
  String get message => msg;
}
