import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? weight;
  int? height;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.weight, required this.height});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBMI() {
    double heightInMeter = height! / 100;
    final h = heightInMeter * heightInMeter;
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obeseIII;
    }

    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealthRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy weight).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes.";
        break;
      case obeseI:
      case obeseII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes.";
        break;
      case obeseIII:
        desc =
            "Very high risk of developing heart disease, high blood pressure, stroke, diabetes.";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
