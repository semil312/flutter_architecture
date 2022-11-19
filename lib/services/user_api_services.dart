import 'package:dio/dio.dart';
import 'package:flutter_architecture/model/user_data_model.dart';

class ApiServices {
  Future<List<UserDataModal>> getUserData() async {
    const String pathUrl = 'https://jsonplaceholder.typicode.com/comments';

    Dio dio = Dio();

    dio.options.responseType = ResponseType.plain;

    Response response;

    response = await dio.get(pathUrl);

    return userDataModalFromJson(response.data);
  }
}
