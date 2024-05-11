class ServerException implements Exception {}
class NotFoundExeption implements Exception {
  final String message;

  NotFoundExeption(this.message);
}
class CachedException implements Exception {}