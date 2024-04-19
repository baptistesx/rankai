/// Your backend should return a json with the following structure:
/// {
///  "code": "string",
///  "message": "string"
/// }
class ApiError implements Exception {
  final String? code;
  final String? message;

  ApiError({
    this.code,
    this.message,
  });

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message)';
  }
}
