import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String otherUserId;
  final String otherUserName;
  final String image;

  const ChatScreen({
    super.key,
    required this.currentUserId,
    required this.otherUserId,
    required this.otherUserName,
    required this.image,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  String getChatId(String uid1, String uid2) {
    final sorted = [uid1, uid2]..sort();
    return sorted.join('_');
  }

  Future<void> sendMessage() async {
    final msg = _controller.text.trim();
    if (msg.isEmpty) return;

    final chatId = getChatId(widget.currentUserId, widget.otherUserId);

    final message = ChatMessage(
      text: msg,
      senderId: widget.currentUserId,
      timestamp: DateTime.now(),
    );

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .set({
          'users': [widget.currentUserId, widget.otherUserId],
        }, SetOptions(merge: true));

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toMap());

    _controller.clear();
  }

  Widget buildMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF6422F4) : const Color(0xFFE6DBFC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatId = getChatId(widget.currentUserId, widget.otherUserId);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.image)),
            const SizedBox(width: 10),
            Text(widget.otherUserName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final message = ChatMessage.fromMap(data);
                    final isMe = message.senderId == widget.currentUserId;

                    return buildMessage(message.text, isMe);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: const Color(0xFFE6DBFC),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF6422F4)),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
