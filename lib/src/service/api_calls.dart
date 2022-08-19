import 'package:dio/dio.dart';

class Database {
  Dio dio = Dio();

  Future getAnimals() async {
    try {
      dynamic response = await dio.get(
        "https://zoo-animal-api.herokuapp.com/animals/rand/10",
        // options: Options(
        //   validateStatus: (_) => true,
        //   contentType: Headers.jsonContentType,
        //   responseType: ResponseType.json,
        // ),
      );
      print("This is home ${response.data}");
      if (response.statusCode != 200) {
        return null;
      }
      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      return null;
    }
  }
}
