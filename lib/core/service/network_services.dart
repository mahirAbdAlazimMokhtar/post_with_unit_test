import 'package:dio/dio.dart';

abstract class NetworkService {
 Future<Response> get(String url);
 Future<dynamic> post(String url, dynamic body);
}

class NetworkServiceImpl implements NetworkService {
  final dio = Dio();
  @override
  Future<Response> get(String url) async {
    final response = await dio.get(url);
    return response;
  }
  
  @override
  Future post(String url, body) async{
    final response = await dio.post(url,data:body);
    return response;
  }
}