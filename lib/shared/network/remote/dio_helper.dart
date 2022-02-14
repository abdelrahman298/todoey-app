import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future <Response> postData({
    //the path of post
    required String url,
    //the data of email,password,name,phone
    required Map<String,dynamic> data,
    //to add it in the headers
    String? lang,
    Map<String,dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers={
      'lang':lang ?? 'en',
      'Authorization':token
    };
   return await dio!.post(
     //the end point of every request(post-get-put)
     url,
      //بعت ال data فى شكل map على طول
      data: data,
    );
  }

// static Future<Response> getData({
//   required String url,
//   Map<String, dynamic>? query,
//   String lang = 'en',
//   String? token,
// }) async {
//   dio?.options.headers = {
//     'Content-Type': 'application/json',
//     'lang': lang,
//     'Authorization': token ?? '',
//   };
//   return await dio!.get(
//     url,
//     queryParameters: query,
//   );
// }



// static Future<Response> putData({
//   required String url,
//   Map<String, dynamic>? query,
//   required Map<String, dynamic> data,
//   String lang = 'en',
//   String? token,
// }) async {
//   dio!.options.headers = {
//     'Content-Type': 'application/json',
//     'lang': lang,
//     'Authorization': token,
//   };
//   return await dio!.put(
//     url,
//     data: data,
//   );
// }












}
