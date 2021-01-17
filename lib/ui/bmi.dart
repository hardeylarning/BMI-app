import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BmiState();
  }
  
}

class BmiState extends State<Bmi> {
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  String result="";
  double calculate(String weight, String height) {
    double convertWeight = double.parse(weight);
    double convertHeight = double.parse(height);
    if (weight.isNotEmpty && height.isNotEmpty) {
      double result = convertWeight / (convertHeight * convertHeight);
      return result;
    }
    else {
      return 0.0;
    }
  }
    void _calculation(){
      double bmi= calculate(_weight.text, _height.text);
      setState(() {
        if(bmi<18.5) {
          result="Age: ${_age.text} \n\nYour BMI is: $bmi\n\n You're Underweight";
        }
        else if(bmi>=18.5 && bmi<=24.9){
          result="Age: ${_age.text} \n\nYour BMI is: $bmi\n\n Normal weight keep it up dude";
        }
        else if(bmi>=25 && bmi<=29.9){
          result="Age: ${_age.text} \n\nYour BMI is: $bmi\n\n Overweight you need to be on digestion";
        }
        else if(bmi>=30){
          result="Age: ${_age.text} \n\nYour BMI is: $bmi\n\n Obese you need to be on digestion and Excercise";
        }
        else{
          result ="Invalid input";
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 10.0),
        child: ListView(
          children: <Widget>[
            Image.asset("images/bmi.png",
            width: 50.0,
            height: 50.0,),
            Padding(padding: EdgeInsets.all(10.0)),
            //Form
            Container(
              margin: const EdgeInsets.all(7.5),
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Age textField
                  TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Age",
                      icon: Icon(Icons.person_outline)
                    ),
                  ),
                  //Height textField
                  TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Height in feet",
                        icon: Icon(Icons.insert_chart, color: Colors.black,)
                    ),
                  ),
                  //Weight textField
                  TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Weight in lib",
                        icon: Icon(Icons.menu, color: Colors.black,)
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                  Container(
                    margin: EdgeInsets.only(left: 140.0),
                    child:  Row(
                      children: <Widget>[
                        RaisedButton(onPressed: _calculation,
                          color: Colors.pinkAccent, child: Text("Calculate",
                            style: TextStyle(color: Colors.white),
                          ),

                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.5))

                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5.5)),
            Container(
              alignment: Alignment.center,
              color: Colors.pinkAccent,
              margin: const EdgeInsets.only(top:25.5, left: 5.5, right: 5.5),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(child:Text(result,
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.4, color: Colors.white),) ,
              ),
            ),

          ],
        ),
      ),
    );
  }
}