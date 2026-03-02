import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AskSakhiScreen extends StatelessWidget {
  const AskSakhiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.backgroundDark,
              const Color(0xFF2D1421),
              AppTheme.backgroundDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundDark.withOpacity(0.8),
                  border: Border(
                    bottom: BorderSide(
                      color: AppTheme.primary.withOpacity(0.1),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primary.withOpacity(0.1),
                        ),
                        child: const Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Ask Sakhi AI',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green.shade500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'ONLINE',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      AppTheme.primary.withOpacity(0.7),
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primary.withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),

              // Chat messages
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Sakhi greeting
                      _buildSakhiMessage(
                        "Hello! I'm Sakhi, your AI assistant. How can I help you stay safe today?",
                      ),

                      const SizedBox(height: 24),

                      // User message
                      _buildUserMessage(
                        "Where is the nearest One Stop Center (OSC)?",
                      ),

                      const SizedBox(height: 24),

                      // Sakhi response with map card
                      _buildSakhiMessageWithCard(),
                    ],
                  ),
                ),
              ),

              // Message input
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_rounded,
                          color: AppTheme.primary,
                          size: 24,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic_rounded,
                          color: Colors.grey.shade400,
                          size: 22,
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withOpacity(0.3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSakhiMessage(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppTheme.primary, const Color(0xFFFF6EB4)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withOpacity(0.2),
                blurRadius: 8,
              ),
            ],
          ),
          child: const Icon(
            Icons.face_3_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SAKHI',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary.withOpacity(0.6),
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserMessage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'YOU',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade700,
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: Icon(
            Icons.person_rounded,
            color: Colors.grey.shade500,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildSakhiMessageWithCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppTheme.primary, const Color(0xFFFF6EB4)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withOpacity(0.2),
                blurRadius: 8,
              ),
            ],
          ),
          child: const Icon(
            Icons.face_3_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SAKHI',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary.withOpacity(0.6),
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                child: const Text(
                  "I've found a One Stop Center (OSC) very close to your current location:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Location Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.primary.withOpacity(0.2),
                  ),
                  color: Colors.white.withOpacity(0.03),
                ),
                child: Column(
                  children: [
                    // Map preview
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade800,
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.primary.withOpacity(0.3),
                              ),
                            ),
                            Icon(
                              Icons.location_on_rounded,
                              color: AppTheme.primary,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Info
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'OSC Mumbai North',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color:
                                      Colors.green.withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.circular(999),
                                  border: Border.all(
                                    color: Colors.green
                                        .withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  'OPEN 24/7',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green.shade400,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'S.V. Road, Santacruz West, Mumbai',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '0.5 miles • 8 mins away',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primary,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Container(
                            height: 0.5,
                            color: Colors.white.withOpacity(0.05),
                          ),
                          const SizedBox(height: 12),

                          // Action buttons
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primary,
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.near_me_rounded,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Directions',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  color:
                                      Colors.white.withOpacity(0.03),
                                  border: Border.all(
                                    color: Colors.white
                                        .withOpacity(0.1),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.call_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
