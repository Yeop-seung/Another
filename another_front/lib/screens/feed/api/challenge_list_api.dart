import 'dart:convert';
import 'package:another/constant/const/data.dart';
import 'package:http/http.dart' as http;


class ChallengeListApi {
  static Future<dynamic> getFeed(
      String runningId
      ) async {
    var url = Uri.parse('$baseUrl/feed/detail/withRun/$runningId');
    // 요청
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      print('함께 달린 사람 가져오기 성공');
      var responseBody = json.decode(utf8.decode(response.bodyBytes));
      return responseBody;
    } else {
      print('함께 달린 사람 가져오기 실패');
    }
  }
}
