class ResponseModel<T> {
  final T? data;
  final int? statusCode;
  final String? error;

  ResponseModel({this.data, this.statusCode, this.error});
}