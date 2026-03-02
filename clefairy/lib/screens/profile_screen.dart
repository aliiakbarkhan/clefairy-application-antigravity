import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'sos_screen.dart';
import 'live_track_screen.dart';
import 'helplines_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: Column(
                  children: [
                    // Avatar with verified badge
                    Stack(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.primary,
                                Colors.pink.shade300,
                              ],
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.backgroundDark,
                                width: 4,
                              ),
                              color: Colors.grey.shade800,
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 50,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade500,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.backgroundDark,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.verified_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Isha Sharma',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Verified Safety Member',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primary.withOpacity(0.8),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Stats row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Row(
                        children: [
                          Expanded(
                            child: GlassContainer(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              borderRadius: BorderRadius.circular(16),
                              child: Column(
                                children: [
                                  Text(
                                    'SAFETY SCORE',
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '98%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GlassContainer(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              borderRadius: BorderRadius.circular(16),
                              child: Column(
                                children: [
                                  Text(
                                    'CONTACTS',
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Safety Dashboard
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAFETY DASHBOARD',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Grid of dashboard items
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    children: [
                      _buildDashboardItem(
                        context,
                        'SOS',
                        Icons.sos_rounded,
                        Colors.red.shade400,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SOSScreen()),
                        ),
                      ),
                      _buildDashboardItem(
                        context,
                        'Track Me',
                        Icons.location_on_rounded,
                        AppTheme.primary,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const LiveTrackScreen()),
                        ),
                      ),
                      _buildDashboardItem(
                        context,
                        'Helpline',
                        Icons.call_rounded,
                        AppTheme.primary,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const HelplineScreen()),
                        ),
                      ),
                      _buildDashboardItem(
                        context,
                        'Record',
                        Icons.mic_rounded,
                        AppTheme.primary,
                        () {},
                      ),
                      _buildDashboardItem(
                        context,
                        'SMS',
                        Icons.sms_rounded,
                        AppTheme.primary,
                        () {},
                      ),
                      _buildDashboardItem(
                        context,
                        'App Support',
                        Icons.contact_support_rounded,
                        AppTheme.primary,
                        () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Account Settings
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundDark.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.primary.withOpacity(0.15),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.settings_rounded,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            'Account Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context,
    String label,
    IconData icon,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        padding: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(20),
        backgroundColor: label == 'SOS'
            ? Colors.red.withOpacity(0.05)
            : AppTheme.primary.withOpacity(0.08),
        borderColor: label == 'SOS'
            ? Colors.red.withOpacity(0.3)
            : AppTheme.primary.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
