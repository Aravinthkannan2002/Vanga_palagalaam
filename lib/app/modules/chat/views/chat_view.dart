import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/chat_controller.dart';
import 'ChatScreen_view.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff53196e),
        title: const Text(
          "ChatBox",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAllNamed(
                '/home'); // Replace '/home' with your actual home route
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: Obx(() {
        // Show skeleton while loading, actual list after delay
        return controller.isLoading.value
            ? buildSkeletonList() // Skeleton loading UI
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return buildListTile(
                    context,
                    chat['title']!,
                    chat['subtitle']!,
                    chat['image']!,
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("New chat");
        },
        child: const Icon(Icons.message, color: Colors.white),
        backgroundColor: const Color(0xff53196e),
      ),
    );
  }

  // Build the Skeleton Placeholder
  Widget buildSkeletonList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10, // Number of skeleton items
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 150,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build the ListTile
  ListTile buildListTile(
    BuildContext context,
    String title,
    String subtitle,
    String image,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "27/01/2025",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Icon(Icons.done_all, color: Colors.blue, size: 18),
        ],
      ),
      onTap: () {
        Get.to(() => ChatScreen(contactName: title, image: image));
      },
    );
  }
}
