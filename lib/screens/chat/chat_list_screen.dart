import 'package:flutter/material.dart';
import '../chat/chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  final List<Map<String, String>> chats = const [
    {
      'name': 'Alice',
      'image': 'https://i.pravatar.cc/300?img=1',
    },
    {
      'name': 'Bob',
      'image': 'https://i.pravatar.cc/300?img=2',
    },
    {
      'name': 'Charlie',
      'image': 'https://i.pravatar.cc/300?img=3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat['image']!),
            ),
            title: Text(chat['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    name: chat['name']!,
                    image: chat['image']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
