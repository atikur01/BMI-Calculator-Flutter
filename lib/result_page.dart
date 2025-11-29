import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String bmiValue;
  final String description;

  const ResultPage({
    super.key,
    required this.result,
    required this.bmiValue,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color(0xFF0A0E21),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Your Result",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),

          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(result,
                    style: TextStyle(color: Colors.green, fontSize: 25)),
                SizedBox(height: 10),
                Text(bmiValue,
                    style:
                    TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 70,
              width: double.infinity,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "RE-CALCULATE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
