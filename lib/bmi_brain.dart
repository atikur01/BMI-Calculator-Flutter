import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;

  BMIBrain({required this.height, required this.weight});

  double calculateBMI() {
    return weight / pow(height / 100, 2);
  }

  String getResult(double bmi) {
    if (bmi >= 25) {
      return "OVERWEIGHT";
    } else if (bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getDescription(double bmi) {
    if (bmi >= 25) {
      return "আপনার ওজন বেশি। ব্যায়াম করতে হবে।";
    } else if (bmi > 18.5) {
      return "আপনার ওজন স্বাভাবিক! ভালো কাজ!";
    } else {
      return "আপনার ওজন কম। পুষ্টিকর খাবার খান।";
    }
  }
}
