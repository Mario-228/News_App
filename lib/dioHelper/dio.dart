import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
  static void init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:"https://newsapi.org/",
        receiveDataWhenStatusError: true
      )
    );
     // ignore: unused_element
  }
    static Future<Response> getData (String url,Map<String,dynamic>query)async
    {
      return await dio!.get(url,queryParameters: query);
    }
}

//https://newsapi.org/
//v2/top-headlines?
//country=eg&category=business&apikey=525feca1aa7c4a6eafbf97c00eb672f9