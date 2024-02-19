class NetworkResponse{
  final bool isSuccess;
  final int statusCode;
  final Map<String,dynamic>? responsejson;

  NetworkResponse(this.isSuccess, this.statusCode, this.responsejson);


}