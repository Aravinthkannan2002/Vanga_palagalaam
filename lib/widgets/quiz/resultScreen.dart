// screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:vanga_palagalam/widgets/quiz/QuizData';

import '../../app/modules/home/views/home_view.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String category;
  final List<Question> questions;
  final List<int?> selectedAnswers;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.category,
    required this.questions,
    required this.selectedAnswers,
  });

  String _getResultMessage() {
    double percentage = (score / totalQuestions) * 100;
    if (percentage == 100) return 'Perfect Score! Excellent Job!';
    if (percentage >= 80) return 'Great Performance!';
    if (percentage >= 60) return 'Good Effort!';
    if (percentage >= 40) return 'Keep Practicing!';
    return 'You Need More Study!';
  }

  Color _getResultColor() {
    double percentage = (score / totalQuestions) * 100;
    if (percentage == 100) return Colors.green;
    if (percentage >= 80) return Colors.green.shade700;
    if (percentage >= 60) return Colors.orange;
    if (percentage >= 40) return Colors.orange.shade700;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$category Quiz',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_events,
                            size: 50,
                            color: _getResultColor(),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Your Score',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '$score / $totalQuestions',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: _getResultColor(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _getResultMessage(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getResultColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                            ),
                            icon:
                                const Icon(Icons.refresh, color: Colors.white),
                            label: const Text(
                              'Try Again',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                      (route) => false,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      shadowColor: Colors.blueAccent.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.home, size: 20, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Back to Home',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ExpansionTile(
                    title: const Text(
                      'Review Answers',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.purple,
                    collapsedBackgroundColor: Colors.grey,
                    iconColor: Colors.black,
                    collapsedIconColor: Colors.white,
                    children: List.generate(questions.length, (index) {
                      final question = questions[index];
                      final selectedAnswer = selectedAnswers[index];
                      final isCorrect =
                          selectedAnswer == question.correctAnswerIndex;

                      return Card(
                        color: Colors.blueGrey[900],
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q${index + 1}: ${question.text}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Your Answer: ${selectedAnswer != null ? question.options[selectedAnswer] : 'Not Answered'}',
                                style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Correct Answer: ${question.options[question.correctAnswerIndex]}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
