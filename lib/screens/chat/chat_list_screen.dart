import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../chat/chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isNotEqualTo: currentUser!.uid) // exclude self
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final users = snapshot.data!.docs;

          if (users.isEmpty) return const Center(child: Text("No other users yet."));

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, index) {
              final userData = users[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    userData['image'] ?? 'https://i.pravatar.cc/150?img=5',
                  ),
                ),
                title: Text(userData['fullName']),
                subtitle: Text(userData['email']),
                onTap: () async {
                  final otherUserId = userData['uid'];
                  final otherUserName = userData['fullName'];
                  final otherUserImage = userData['image'] ?? 'https://i.pravatar.cc/150?img=5';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        currentUserId: currentUser.uid,
                        otherUserId: otherUserId,
                        otherUserName: otherUserName,
                        image: otherUserImage,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
