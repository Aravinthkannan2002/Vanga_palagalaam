import 'package:flutter/material.dart';
import 'dart:async';

import 'package:vanga_palagalam/widgets/quiz/QuizData';
import 'package:vanga_palagalam/widgets/quiz/resultScreen.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  int timeLeft = 300; // 5 minutes = 300 seconds
  late Timer timer;
  List<int?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    questions = QuizData.categoryQuestions[widget.category]!;
    selectedAnswers = List.filled(questions.length, null);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          navigateToResultScreen();
        }
      });
    });
  }

  void checkAnswer(int selectedIndex) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = selectedIndex;

      if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }

      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        navigateToResultScreen();
      }
    });
  }

  void navigateToResultScreen() {
    timer.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: score,
          totalQuestions: questions.length,
          category: widget.category,
          questions: questions,
          selectedAnswers: selectedAnswers,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} Quiz',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.hourglass_bottom,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Time Left: ${timeLeft ~/ 60}:${(timeLeft % 60).toString().padLeft(2, '0')}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 24.0),
                    child: Text(
                      questions[currentQuestionIndex].text,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...questions[currentQuestionIndex]
                  .options
                  .asMap()
                  .entries
                  .map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => checkAnswer(entry.key),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedAnswers[currentQuestionIndex] == entry.key
                              ? Colors.green.shade400
                              : Colors.white,
                      foregroundColor:
                          selectedAnswers[currentQuestionIndex] == entry.key
                              ? Colors.white
                              : Colors.blue.shade900,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: BorderSide(
                        color:
                            selectedAnswers[currentQuestionIndex] == entry.key
                                ? Colors.green.shade700
                                : Colors.blue.shade700,
                        width: 2,
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.shade300,
                    ),
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            selectedAnswers[currentQuestionIndex] == entry.key
                                ? Colors.white
                                : Colors.blue.shade900,
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 15),
              Text(
                'Question ${currentQuestionIndex + 1} of ${questions.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
