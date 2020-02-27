import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';

class Repository {

  List<QuizModel> list;

  Future<List<QuizModel>> getData(String newsType) async {

    String url = "https://opentdb.com/api.php?amount=5&category=24";

    var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data[newsType] as List;

      list = rest.map<QuizModel>((json) => QuizModel.fromJson(json)).toList();
    }
    return list;
  }
}
