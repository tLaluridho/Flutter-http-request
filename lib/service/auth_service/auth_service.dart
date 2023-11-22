import 'package:dio/dio.dart';

class AuthService {
  login() async {
    //                                       Route Parameter
    //https://capekngoding/demo/api/products/1
    //                                       QUERYPARAMETER => page, nilainya adalah 1
    //                                       Fitur daru query adalah, paging, seraching, sorting
    //https://capekngoding/demo/api/products?page=1

    //                          METHOD(GET, POST, PUT, DELETE)
    var response = await Dio().post(
      //URL
      "https://capekngoding/demo/api/auth/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      //DATA/BODY
      data: {
        "email": "ridhotaufik2003@gmail.com",
        "password": "123456",
      },
    );
    Map obj = response.data;
  }
}
