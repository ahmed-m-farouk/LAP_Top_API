import 'package:dio/dio.dart';

class PostLogin {
  final dio = Dio();
  postData({required email, required password}) async {
    var response = await dio.post(
      'https://elwekala.onrender.com/user/login',
      data: {"email": email, "password": password},
    );

    try {
      var data = response.data;
      print(data);
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }
}
