class HttpCallExcetopn implements Exception {
  final String message;
  final int statusCode;
  HttpCallExcetopn({required this.message, required this.statusCode});
}
