import 'package:calculator/components/button_oval.dart';
import 'package:calculator/components/buttons.dart';
import 'package:calculator/components/check_operator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userQuestion = '';
  var userAnswer = '';

  List<String> buttons = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'DEL',
    '=',
  ];
  List btnOval = [
    'sqrt(',
    'pi',
    '^',
    '%',
    '!',
    'sin(',
    'cos(',
    'tan(',
    'e',
    'ln(',
    'log(',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // * Question and Answer
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          userQuestion,
                          style: GoogleFonts.comfortaa(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          userAnswer,
                          style: GoogleFonts.comfortaa(fontSize: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // * Buttons Oval
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: btnOval.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return ButtonOval(
                        buttonText: isOperator(btnOval[index])
                            ? SvgPicture.asset(
                                checkOperator(btnOval[index]),
                                width: 15,
                              )
                            : Text(removeBracket(btnOval[index]),
                                style: GoogleFonts.comfortaa(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                        onPress: () {
                          setState(() {
                            userQuestion += btnOval[index];
                          });
                        });
                  })),
            ),

            // * Buttons
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      // * Clear Button
                      if (index == 0) {
                        return CustomButton(
                          buttonText: Text(buttons[index],
                              style: GoogleFonts.comfortaa(fontSize: 25)),
                          color: Colors.green[200]!,
                          textColor: Colors.black,
                          onPress: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                        );
                      }
                      // * Delete Button
                      else if (index == buttons.length - 2) {
                        return CustomButton(
                          buttonText: Text(buttons[index]),
                          iconBtn: const Icon(
                            Icons.backspace_rounded,
                            size: 27,
                          ),
                          color: Colors.grey[200]!,
                          textColor: Colors.black,
                          onPress: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                        );
                      }
                      // * Equal Button
                      else if (index == buttons.length - 1) {
                        return CustomButton(
                          buttonText: SvgPicture.asset('assets/icons/equal.svg',
                              width: 30),
                          color: Colors.deepPurple[100]!,
                          textColor: Colors.black,
                          onPress: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                        );
                      }
                      // * Rest of the Buttons
                      else {
                        return CustomButton(
                          buttonText: isOperator(buttons[index])
                              ? SvgPicture.asset(
                                  checkOperator(buttons[index]),
                                  width: 30,
                                )
                              : Text(buttons[index],
                                  style: GoogleFonts.comfortaa(fontSize: 30)),
                          color: isOperator(buttons[index])
                              ? Colors.blue[100]!
                              : Colors.grey[200]!,
                          textColor: Colors.black,
                          onPress: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('pi', '3.14159');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
