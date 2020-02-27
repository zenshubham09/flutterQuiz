

class QuestionModel {

  String question;
  String answer;
  String imageURL;

  QuestionModel({this.question, this.answer, this.imageURL});

  void setQuestions(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(String getAnswer) {
    answer = getAnswer;
  }

  void setImageURL(String getImageURL) {
    imageURL = getImageURL;
  }

  String getQuestion() {
    return question;
  }

  String getAnswer(){
    return answer;
  }

  String getImageURL(){
    return imageURL;
  }
}