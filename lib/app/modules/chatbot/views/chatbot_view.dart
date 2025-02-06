import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chatbot_controller.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatbotView extends GetView<ChatbotController> {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatbotController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9817AC),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // Back icon
            color: Colors.white,
            size: 24.0, // Adjust the size of the back icon
          ),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context); // Example: Navigate to the previous screen
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                // Navigate to user profile
              },
              icon: Icon(
                LineAwesomeIcons.ellipsis_v_solid,
                color: Colors.white,
                size: 24.0, // Fixed size for the icon
              ),
            ),
          ),
        ],
        title: Text(
          "Vanga Palagalam",
          style: GoogleFonts.lato(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ChatbotController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: DashChat(
            inputOptions: InputOptions(
              leading: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Softer background color
                      borderRadius: BorderRadius.circular(20), // Rounded edges
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4.0, // Subtle shadow effect
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.attach_file,
                        color: Colors
                            .grey[600], // Slightly darker icon for contrast
                        size: 24.0, // Standardized size
                      ),
                      onPressed: () {         
                        // Handle file attachment logic
                      },
                      tooltip: "Attach a file", // Tooltip for better UX
                    ),
                  ),
                ),
              ],
              cursorStyle: const CursorStyle(
                color: Colors.black,
                // thickness: 2.0, // Slightly thicker cursor for better visibility
              ),
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100], // Light background for input field
                hintText: "Type a message...",
                hintStyle:
                    TextStyle(color: Colors.grey[500]), // Subtle placeholder
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none, // Remove border for a clean look
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
            typingUsers: controller.typing,
            currentUser: controller.myself,
            onSend: (ChatMessage message) {
              controller.getData(message);
            },
            messages: controller.allMessages,
            messageOptions: MessageOptions(
              currentUserTextColor: Colors.black,
            ),
          ),
        );
      }),
    );
  }
}
