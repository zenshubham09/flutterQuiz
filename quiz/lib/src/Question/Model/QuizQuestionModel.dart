class QuizModel {
  List<Results> results;

  QuizModel({this.results});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String title;
  List<Questions> questions;

  Results({this.title, this.questions});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<IncorrectAnswers> incorrectAnswers;

  Questions(
      {this.category,
        this.type,
        this.difficulty,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers});

  Questions.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    if (json['incorrect_answers'] != null) {
      incorrectAnswers = new List<IncorrectAnswers>();
      json['incorrect_answers'].forEach((v) {
        incorrectAnswers.add(new IncorrectAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    if (this.incorrectAnswers != null) {
      data['incorrect_answers'] =
          this.incorrectAnswers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncorrectAnswers {
  String text;
  bool isCorrect;

  IncorrectAnswers({this.text, this.isCorrect});

  IncorrectAnswers.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['isCorrect'] = this.isCorrect;
    return data;
  }
}
