import 'package:dio/dio.dart';
import 'package:post_login/future_Lap/home/model/model/laptop_model/lap_home.dart';

class GetLaptop {
  final dio = Dio();

  getlaptopdata() async {
    var response =
        await dio.get("https://elwekala.onrender.com/product/Laptops");
    try {
      if (response.statusCode == 200) {
        List responsdata = response.data['product'];
        List<LaptopModel> listmodel = responsdata
            .map(
              (e) => LaptopModel.fromJson(e),
            )
            .toList();

        print(listmodel[1].image);
        print(listmodel[2].image);
        return listmodel;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }
}
