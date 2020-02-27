import 'package:flutter/material.dart';
import 'package:quiz/src/Question/Controller/QuestionController.dart';
import 'package:quiz/src/Utilities/size_config.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';


class QuizView extends StatefulWidget {

  List<QuizModel> quizData;
  QuizView(var quizData){
    this.quizData = quizData;
  }

  @override
  QuizViewUIState createState() => QuizViewUIState(this.quizData);
}

class QuizViewUIState extends State<QuizView> {

  var gridData;
  List<QuizModel> quizData;
  QuizViewUIState(var quizData){
    this.gridData = quizData;
    this.quizData = quizData;
  }
  //UI layout for "Whos Hidden Inside of You" title
  Container getTitle(double screenHeight) {
    double titleHeight = (screenHeight * 15) / 100;
    var title = Container(
        padding: EdgeInsets.only(top: 30),
        height: titleHeight,
        child: Center(
            child: Column (
              children: <Widget>[
                Text(
                  'Welcome to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Deloitte Quiz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            )
        )
    );
    return title;
  }

  /*
    Function to add Text Widget and do its styling
  */
  Widget addCustomText(
      String title, double fontSize, FontWeight weight, Color textColor) {
    return Text(
      title,
      style:
      TextStyle(color: textColor, fontSize: fontSize, fontWeight: weight),
    );
  }



  Expanded getAvatarSelectionGridView(double screenWidth) {
    var gridView = Expanded(
      child: GridView.extent(
          maxCrossAxisExtent: 300,
          padding: const EdgeInsets.only(left: 15, right: 15),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: _buildGridTileList(this.gridData[0].results.length, screenWidth)),
    );
    return gridView;
  }

  List<Container> _buildGridTileList(int count, double screenWidth) {
    return List.generate(
        count,
            (i) => Container(
            width: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: screenWidth/2,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0),
                    color: Colors.blue,
                  ),
                  child: Container(
                    child:
                    RawMaterialButton(
                        onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => QuestionController(this.gridData[0].results[i].questions, this.quizData)));
                        },
                    child:
                        addCustomText(this.gridData[0].results[i].title, 18, FontWeight.w300, Colors.white),
                  )
                  )
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(
              top: SizeConfig.safeAreaTop, bottom: SizeConfig.safeAreaBottom),
          child: Column(
            children: <Widget>[
              getTitle(SizeConfig.screenHeight),
              getAvatarSelectionGridView(SizeConfig.screenWidth),
            ],
          ),
        ));
  }
}