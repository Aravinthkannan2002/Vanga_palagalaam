import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:intl/intl.dart';


class ChatbotController extends GetxController {
  final String formattedTime = DateFormat('2025-01-27  15:30:00').format(DateTime.now()); 
  final DateTime nowInIST = DateTime.now().toUtc().add(Duration(hours: 5, minutes: 30));
  
  final ChatUser myself = ChatUser(id: '1', firstName: 'Tom');
  final ChatUser bot = ChatUser(id: '2', firstName: 'Gemini');

  final RxList<ChatMessage> allMessages = <ChatMessage>[].obs;
  final RxList<ChatUser> typing = <ChatUser>[].obs;

  final String apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyDP44VfvPWKWEvakEN222NJvyUnPqHz6TU';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  @override
  void onInit() {
    super.onInit();
    // Additional initialization logic if needed
  }

  @override
  void onReady() {
    super.onReady();
    // Logic to execute once the controller is fully ready
  }

  @override
  void onClose() {
    super.onClose();
    // Cleanup logic if needed
  }

Future<void> getData(ChatMessage message) async {
  // Show typing indicator
  typing.add(bot);
  
  // Insert the user's message at the start of the list
  allMessages.insert(0, message);

  // Remove specific unwanted message
  if (message.text == "just some after I started conversation") {
    allMessages.removeWhere((msg) => msg.text == "just some after I started conversation");
  }

  final Map<String, dynamic> data = {
    "contents": [
      {
        "parts": [
          {"text": message.text}
        ]
      }
    ]
  };

  try {
    // Log the request details for debugging
    print('Sending request to API...');
    print('API URL: $apiUrl');
    print('Headers: $headers');
    print('Request Body: ${jsonEncode(data)}');

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(data),
    );

    // Log response status for better tracking
    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      // Debug the response body
      print('Response Body: $result');

      final String botReply =
          result['candidates'][0]['content']['parts'][0]['text'];

      final ChatMessage botMessage = ChatMessage(
        text: botReply,
        user: bot,
       createdAt: nowInIST, // Or use formattedTime as string if needed
      );

      allMessages.insert(0, botMessage);
    } else {
      // Log error details when the response status is not 200
      print('Error occurred: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  } catch (e) {
    // Log detailed error information
    print('Exception occurred: $e');
  } finally {
    // Remove typing indicator
    typing.remove(bot);

    // Log completion of the request
    print('Request completed.');
  }

  update();
}


}