import 'package:flutter/material.dart';

class ChatSection extends StatelessWidget {
  const ChatSection({super.key, required this.messages});

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isUserMessage = index % 2 == 0;
              return Container(
                margin: !isUserMessage
                    ? EdgeInsets.only(bottom: 16)
                    : EdgeInsets.only(),
                child: isUserMessage
                    ? UserMessageBubble(message: message)
                    : ChatGPTMessageBubble(message: message),
              );
            },
          ),
        ),
      ],
    );
  }
}

class UserMessageBubble extends StatelessWidget {
  const UserMessageBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(2),
            ),
          ),
          child: Text(message, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class ChatGPTMessageBubble extends StatelessWidget {
  const ChatGPTMessageBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/logos/gemini_logo.png", width: 24, height: 24,),
                Icon(
                  Icons.volume_up,
                  color: Colors.white70,
                  size: 20,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
            Row(
              children: [
                Icon(Icons.copy_rounded, color: Colors.white70, size: 20),
                SizedBox(width: 20),
                Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Colors.white70,
                  size: 20,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.thumb_down_alt_outlined,
                  color: Colors.white70,
                  size: 20,
                ),
                SizedBox(width: 20),
                Icon(Icons.checklist_rtl, color: Colors.white70, size: 20),
                SizedBox(width: 20),
                Icon(Icons.share_outlined, color: Colors.white70, size: 20),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.white70, size: 20,),
                ],
            ),
          ],
        ),
      ),
    );
  }
}
