import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class GamesTicTactToeGameController extends GetxController {
  RxList<String> board = List.filled(9, "").obs;
  RxString lastValue = "X".obs;
  RxBool gameOver = false.obs;
  RxString result = "".obs;
  int turn = 0;
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  void makeMove(int index) {
    if (board[index] == "") {
      board[index] = lastValue.value;
      turn++;
      gameOver.value = winnerCheck(lastValue.value, index);

      if (gameOver.value) {
        result.value = "${lastValue.value} is the Winner";
        // Show popup for winner
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.success,
          title: "${lastValue.value} Wins!",
          text: "Congratulations to ${lastValue.value}",
          confirmBtnText: "OK",
          onConfirmBtnTap: () {
             Navigator.pop(Get.context!); // Close the popup
            // Reset the game or take any action when the user taps OK
            resetGame();
          },
        );
      } else if (!gameOver.value && turn == 9) {
        result.value = "It's a Draw!";
        gameOver.value = true;
        // Show popup for draw
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.info,
          title: "It's a Draw!",
          text: "No winner this time. Try again!",
          confirmBtnText: "OK",
          onConfirmBtnTap: () {
            // Reset the game or take any action when the user taps OK
              Navigator.pop(Get.context!); // Close the popup
            resetGame();
          
          },
        );
      }

      lastValue.value = lastValue.value == "X" ? "O" : "X";
    }
  }

  void resetGame() {
    board.value = List.filled(9, "");
    lastValue.value = "X";
    gameOver.value = false;
    result.value = "";
    turn = 0;
    scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  }

  bool winnerCheck(String player, int index) {
    // Define the winning combinations
    List<List<int>> winningCombinations = [
      [0, 1, 2], // Row 1
      [3, 4, 5], // Row 2
      [6, 7, 8], // Row 3
      [0, 3, 6], // Column 1
      [1, 4, 7], // Column 2
      [2, 5, 8], // Column 3
      [0, 4, 8], // Diagonal 1
      [2, 4, 6], // Diagonal 2
    ];

    // Check if the current player has a winning combination
    for (var combination in winningCombinations) {
      if (combination.contains(index)) {
        // Check if all positions in the combination have the same player value
        if (combination.every((i) => board[i] == player)) {
          return true; // Player has won
        }
      }
    }
    return false; // No winner yet
  }
}
