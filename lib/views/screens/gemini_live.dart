import 'package:flutter/material.dart';
import 'dart:ui';

class GeminiLiveScreen extends StatelessWidget {
  const GeminiLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.graphic_eq_outlined, color: Colors.white70, size: 20),
            SizedBox(width: 8),
            Text('Live', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.subtitles_outlined, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              child: Stack(
                children: [
                  // Blurred background section
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.8),
                          Colors.blueGrey.shade900.withValues(alpha: 0.7),
                          Colors.blue.shade900.withValues(alpha: 0.6),
                          Colors.blue.shade700.withValues(alpha: 0.5),
                          Colors.blueAccent.shade400.withValues(alpha: 0.4),
                        ],
                        stops: [0.0, 0.4, 0.6, 0.8, 1.0],
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom controls
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            color: Colors.black, // Background for the controls area
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildControlActionButton(Icons.videocam_outlined, () {
                  // Handle camera action
                }),
                _buildControlActionButton(Icons.screen_share_outlined, () {
                  // Handle share screen action
                }),
                _buildControlActionButton(Icons.pause, () {
                  // Handle pause/play action
                }),
                _buildControlActionButton(Icons.close, () {
                  // Handle end call action
                  Navigator.pop(context); // Example: go back
                }, isRed: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlActionButton(IconData icon, VoidCallback onPressed, {bool isRed = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: isRed ? Colors.red : Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30)
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white70, size: 28),
        onPressed: onPressed,
      ),
    );
  }
}
