import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LiveTrackScreen extends StatelessWidget {
  const LiveTrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Stack(
        children: [
          // Map placeholder
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade900.withOpacity(0.3),
                    Colors.grey.shade900,
                    AppTheme.backgroundDark,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Grid lines for map effect
                  ...List.generate(8, (i) {
                    return Positioned(
                      top: i * 120.0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 0.5,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    );
                  }),
                  ...List.generate(6, (i) {
                    return Positioned(
                      left: i * 80.0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 0.5,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    );
                  }),

                  // Current location marker
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Ping animation area
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.primary.withOpacity(0.15),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.primary,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppTheme.primary.withOpacity(0.6),
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Destination marker
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3,
                    right: MediaQuery.of(context).size.width * 0.25,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppTheme.primary.withOpacity(0.2),
                            ),
                          ),
                          child: Text(
                            'DESTINATION',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.location_on_rounded,
                          color: AppTheme.primary,
                          size: 40,
                        ),
                      ],
                    ),
                  ),

                  // Map labels
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: 20,
                    child: Text(
                      'San Francisco',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Header
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Live Track Me',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        child: const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Search bar
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundDark.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppTheme.primary.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Icon(
                          Icons.search_rounded,
                          color: AppTheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Home (2.4 miles away)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Zoom controls
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundDark.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_rounded,
                            color: Colors.white),
                      ),
                      Container(
                        height: 0.5,
                        width: 24,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_rounded,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.my_location_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),

          // Bottom panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Info card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundDark.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppTheme.primary.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Automatic SOS toggle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Automatic SOS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Active protection for deviations',
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: true,
                              onChanged: (_) {},
                              activeColor: Colors.white,
                              activeTrackColor: AppTheme.primary,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Route info
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.05),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green.shade400,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'HEADING TO HOME',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade300,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: '12 min ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '• 2.4 miles',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppTheme.primary.withOpacity(0.2),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      'Route',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.navigation_rounded,
                                      color: Colors.white,
                                      size: 16,
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

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
