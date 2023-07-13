abstract class Failure implements Exception {
  final String errorMessage;

  Failure({
    this.errorMessage = '',
    StackTrace? stackTrace,
  });
}
