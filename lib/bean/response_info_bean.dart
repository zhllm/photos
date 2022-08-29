class ResponseInfo<T> {
  int? code;
  String? msg;
  T? data;

  ResponseInfo({this.code, this.msg, this.data});
}
