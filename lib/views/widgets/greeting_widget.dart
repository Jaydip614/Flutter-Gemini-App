import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                ],
              ).createShader(bounds);
            },
            child: const Text(
              'Hello, Jaydip!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    _buildActionButton(
                      text: '🍌 Create Image',
                      onTap: () {},
                    ),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    _buildActionButton(
                      text: 'Write',
                      onTap: () {},
                    ),
                    _buildActionButton(
                      text: 'Build',
                      onTap: () {},
                    ),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    _buildActionButton(
                      text: 'Deep Research',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, right: 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withValues(alpha: 0.08),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}