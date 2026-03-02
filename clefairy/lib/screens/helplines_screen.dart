import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HelplineScreen extends StatelessWidget {
  const HelplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Helplines & Safety Officials',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.info_rounded,
                    color: AppTheme.primary,
                    size: 22,
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.primary.withOpacity(0.1),
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
                    const SizedBox(width: 12),
                    Text(
                      'Search officials or services',
                      style: TextStyle(
                        color: AppTheme.primary.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tabs
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.primary.withOpacity(0.1),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildTab('Helplines', true),
                    const SizedBox(width: 32),
                    _buildTab('Officials', false),
                  ],
                ),
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // National Helplines header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'National Helplines',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Verified',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Emergency Response
                    _buildHelplineCard(
                      Icons.emergency_rounded,
                      'Emergency Response',
                      '112',
                      true,
                    ),

                    const SizedBox(height: 12),

                    // Women Helpline
                    _buildHelplineCard(
                      Icons.female_rounded,
                      'Women Helpline',
                      '1091',
                      false,
                    ),

                    const SizedBox(height: 32),

                    // Safety Officials
                    const Text(
                      'Safety Officials',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildOfficialCard(
                      Icons.shield_rounded,
                      'Protection Officer',
                      'Domestic Violence Support',
                      [Icons.email_rounded, Icons.call_rounded],
                    ),

                    const SizedBox(height: 12),

                    _buildOfficialCard(
                      Icons.policy_rounded,
                      'Anti-Trafficking Unit',
                      'Regional Specialized Squad',
                      [Icons.map_rounded, Icons.call_rounded],
                    ),

                    const SizedBox(height: 12),

                    _buildOfficialCard(
                      Icons.medical_services_rounded,
                      'One Stop Centre (Sakhi)',
                      'Medical & Legal Support',
                      [Icons.info_rounded, Icons.call_rounded],
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive ? AppTheme.primary : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isActive ? AppTheme.primary : Colors.grey.shade400,
        ),
      ),
    );
  }

  Widget _buildHelplineCard(
    IconData icon,
    String title,
    String number,
    bool isPrimary,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primary.withOpacity(0.1),
        ),
        // Left accent border
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary.withOpacity(isPrimary ? 0.2 : 0.1),
            ),
            child: Icon(
              icon,
              color: AppTheme.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.primary.withOpacity(isPrimary ? 1 : 0.8),
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary.withOpacity(isPrimary ? 1 : 0.8),
              boxShadow: isPrimary
                  ? [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.3),
                        blurRadius: 12,
                      ),
                    ]
                  : null,
            ),
            child: const Icon(
              Icons.call_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfficialCard(
    IconData icon,
    String title,
    String subtitle,
    List<IconData> actions,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primary.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.primary.withOpacity(0.05),
            ),
            child: Icon(
              icon,
              color: AppTheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: actions
                .map(
                  (actionIcon) => Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.primary.withOpacity(0.05),
                        border: Border.all(
                          color: AppTheme.primary.withOpacity(0.1),
                        ),
                      ),
                      child: Icon(
                        actionIcon,
                        color: AppTheme.primary,
                        size: 16,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
