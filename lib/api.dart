import 'package:dio/dio.dart';
import 'package:task4/loginmodel.dart';
import 'package:task4/registermodel.dart';
import 'package:task4/url.dart';

class Apiclass{
 
  Apiclass._internal();
  static Apiclass instance=Apiclass._internal();

  factory(){
    return instance;
  }
  final dio=Dio();
  final url=URL();
  Apiclass(){
    dio.options=BaseOptions(
      baseUrl: url.baseurl,
      responseType: ResponseType.json,
    );
  }
// ignore: body_might_complete_normally_nullable
Future <login?> loginUserApi (FormData formData) async{
  try{
    final result=await dio.post(url.loginend,data: formData);
    return login.fromJson((result.data));
  }
  on DioException catch(e){
    print(e);
  }
}

// ignore: body_might_complete_normally_nullable
Future <register?> registerUserApi (FormData formData) async{
  try {
    final result=await dio.post(url.registerend,data: formData);
    print("**********$result");
    return register.fromJson((result.data));
  }
  on DioException catch(e){
    print(e);
  }
 
}

}