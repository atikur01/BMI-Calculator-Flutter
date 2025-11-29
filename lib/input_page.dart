import 'package:flutter/material.dart';
import 'bmi_brain.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: genderCard(
                      icon: Icons.male,
                      text: "MALE",
                      isSelected: selectedGender == Gender.male,
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: genderCard(
                      icon: Icons.female,
                      text: "FEMALE",
                      isSelected: selectedGender == Gender.female,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 5),
                  Text(
                    "$height cm",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  )
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: numberCard(
                    title: "WEIGHT",
                    value: weight,
                    onMinus: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPlus: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: numberCard(
                    title: "AGE",
                    value: age,
                    onMinus: () {
                      setState(() {
                        age--;
                      });
                    },
                    onPlus: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              BMIBrain calc = BMIBrain(height: height, weight: weight);
              double bmi = calc.calculateBMI();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultPage(
                    result: calc.getResult(bmi),
                    bmiValue: bmi.toStringAsFixed(1),
                    description: calc.getDescription(bmi),
                  ),
                ),
              );
            },
            child: Container(
              height: 70,
              width: double.infinity,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  // -----------------------------------
  // REUSABLE UI WIDGETS
  // -----------------------------------

  Widget genderCard({required IconData icon, required String text, required bool isSelected}) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 70),
          SizedBox(height: 10),
          Text(text, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget numberCard({
    required String title,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 18)),
          Text("$value",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              roundButton("-", onMinus),
              SizedBox(width: 10),
              roundButton("+", onPlus),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundButton(String symbol, VoidCallback action) {
    return RawMaterialButton(
      onPressed: action,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      child: Text(symbol, style: TextStyle(fontSize: 25)),
    );
  }
}
