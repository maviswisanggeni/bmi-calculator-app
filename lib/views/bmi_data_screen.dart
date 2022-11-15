import 'dart:ui';

import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle!.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(height: height, weight: weight);
          bmiCalculator.calculateBMI();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color(0xff3260F4),
                Color(0xff8E57D1),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'CALCULATE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: -10,
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color(0xff3260F4),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 120,
                    sigmaY: 120,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: -50,
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color(0xff8E57D1),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 150,
                    sigmaY: 150,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Column(children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        gender = "male";
                        setState(() {});
                      },
                      child: BmiCard(
                        borderColor: (gender == "male")
                            ? const Color(0xff3260F4)
                            : Colors.white10,
                        child: Stack(
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: GenderIconText(
                                  icon: Icons.male,
                                  title: 'Male',
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.check_circle,
                                color: (gender == "male")
                                    ? const Color(0xff3260F4)
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        gender = "female";
                        setState(() {});
                      },
                      child: BmiCard(
                        borderColor: (gender == "female"
                            ? const Color(0xff3260F4)
                            : Colors.white10),
                        child: Stack(
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: GenderIconText(
                                  icon: Icons.female,
                                  title: 'Female',
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.check_circle,
                                color: (gender == "female")
                                    ? const Color(0xff3260F4)
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BmiCard(
                          child: Slider(
                            value: height.toDouble(),
                            min: 80,
                            max: 200,
                            activeColor: const Color(0xff3260F4),
                            thumbColor: const Color(0xff3260F4),
                            inactiveColor: Colors.white10,
                            onChanged: (value) {
                              height = value.toInt();
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      BmiCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "$height",
                                style: labelTextStyle,
                              ),
                              Text(
                                " cm",
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle!.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        BmiCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: CupertinoPicker(
                                    itemExtent: 25,
                                    squeeze: 0.8,
                                    scrollController:
                                        FixedExtentScrollController(
                                            initialItem: 30),
                                    magnification: 2,
                                    useMagnifier: true,
                                    onSelectedItemChanged: (val) {
                                      weight = val + 20;
                                    },
                                    children: generateList(20, 220)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle!.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        BmiCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: CupertinoPicker(
                                    itemExtent: 25,
                                    squeeze: 0.8,
                                    scrollController:
                                        FixedExtentScrollController(
                                            initialItem: 5),
                                    magnification: 2,
                                    useMagnifier: true,
                                    onSelectedItemChanged: (val) {
                                      weight = val + 15;
                                    },
                                    children: generateList(15, 90)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white10,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
