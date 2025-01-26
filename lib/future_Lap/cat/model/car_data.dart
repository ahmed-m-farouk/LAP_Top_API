import 'package:dio/dio.dart';

class CardData {
  final dio = Dio();

  getCarddata() async {
    var response = await dio.post('https://elwekala.onrender.com/cart/add',
        data: {
          "nationalId": '01010239913',
          "productId": "8489459494",
          "quantity": "4448494"
        });
    var data = response.data;
    print(data);
    return data;
  }
}
