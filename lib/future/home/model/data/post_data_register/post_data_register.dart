import 'package:dio/dio.dart';

class PostDataRegister {
  final dio = Dio();
  postRegister({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String token,
    required String profileImage,
  }) async {
    var response =
        await dio.post('https://elwekala.onrender.com/user/register', data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage,
    });
    try {
      var data = response.data;
      print(data);
      return data;
    } on DioException catch (erorr) {
      if (erorr.response != null) {
        print(erorr.response!.data);
        return erorr.response!.data;
      }
    }
  }
}
