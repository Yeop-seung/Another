import 'dart:convert';
import 'package:another/constant/const/data.dart';
import 'package:http/http.dart' as http;


class DetailFeedApi {
  static Future<dynamic> getFeed(
      String runningId,
      ) async {
    var url = Uri.parse('$baseUrl/feed/detail/$runningId');
    print(runningId);
    // 요청
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      print('디데일 피드 가져오기 성공');
      var responseBody = json.decode(utf8.decode(response.bodyBytes));
      return responseBody;
    } else {
      print(response.statusCode);

      print('디데일 피드 가져오기 실패');
    }
  }
}
