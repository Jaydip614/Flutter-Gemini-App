import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {

  // sample data to mimic your screenshot
  static final List<Map<String, String>> _items = [
    {
      'title': 'Initial Greeting And Offer',
      'subtitle': 'Hello there! What can I help you with right now?',
      'date': '10 Nov'
    },
    {
      'title': 'Defining a Company',
      'subtitle': 'A company is a legal entity formed by an association of peo..',
      'date': '28 Oct'
    },
    {
      'title': 'WhatsApp Avatar Image Creation',
      'subtitle': 'Okay, here is the square version of the 3D cartoon image, w..',
      'date': '12 Sep'
    },
    {
      'title': 'Image Colorization Request',
      'subtitle': "Sorry for the misunderstanding! Here is the full image with..",
      'date': '12 Sep'
    },
    {
      'title': 'Professional Image Request Fulfilled',
      'subtitle': 'Here is the color version with your hair adjusted:',
      'date': '12 Sep'
    },
    {
      'title': 'Duaon Ka Asar',
      'subtitle': "It sounds like you're reciting a beautiful verse. Would you li..",
      'date': '27 Dec 2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white70,
                      ),
                    ),
                    hintText: 'Search for chats',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                child: Text(
                  "Recent",
                  style: TextStyle(fontSize: 15, color: Colors.white70, fontWeight: FontWeight.w500),
                ),
              ),
              // list
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return ChatListTile(
                      title: item['title']!,
                      subtitle: item['subtitle']!,
                      date: item['date']!,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final VoidCallback onTap;


  const ChatListTile({super.key, required this.title, required this.subtitle, required this.date, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF9E9E9E)),
                  ),
                ],
              ),
            ),


            const SizedBox(width: 12),


        // date on right
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}