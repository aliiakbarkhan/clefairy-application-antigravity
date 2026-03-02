import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

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
              const Color(0xFF3A1A2B),
            ],
          ),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.primary,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              color: AppTheme.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Communities',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Safe Space Feed',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade800.withOpacity(0.5),
                            ),
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Colors.grey.shade800.withOpacity(0.5),
                                ),
                                child: const Icon(
                                  Icons.notifications_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.primary,
                                    border: Border.all(
                                      color: AppTheme.backgroundDark,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Filter chips
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildChip('For You', true),
                        const SizedBox(width: 8),
                        _buildChip('Safety Tips', false),
                        const SizedBox(width: 8),
                        _buildChip('Verified Stories', false),
                        const SizedBox(width: 8),
                        _buildChip('Group Rides', false),
                      ],
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 12)),

                // Share box
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.primary.withOpacity(0.2),
                            ),
                            child: Icon(
                              Icons.edit_note_rounded,
                              color: AppTheme.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Share a safe experience...',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.image_rounded,
                                            color: Colors.grey.shade400,
                                            size: 20),
                                        const SizedBox(width: 12),
                                        Icon(Icons.location_on_rounded,
                                            color: Colors.grey.shade400,
                                            size: 20),
                                        const SizedBox(width: 12),
                                        Icon(Icons.tag_rounded,
                                            color: Colors.grey.shade400,
                                            size: 20),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: AppTheme.primary,
                                        borderRadius:
                                            BorderRadius.circular(999),
                                      ),
                                      child: const Text(
                                        'Share',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                // Posts
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPost(
                      'Elena Woods',
                      '@elenasafewalks • 45m ago',
                      'Found a really well-lit shortcut through the downtown park today! There\'s an emergency call station every 50 meters now. Feeling much safer walking back from late shifts. 🌙✨',
                      ['#SafeCommute', '#CityUpdate'],
                      hasImage: true,
                      likes: '124',
                      comments: '12',
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildSafetyTipPost(
                      'Maya Rivers',
                      '@maya_r • 2h ago',
                      '"Always keep your \'SOS\' gesture active on your phone. On iOS, quickly pressing the side button 5 times can call emergency services discreetly."',
                      likes: '892',
                      comments: '45',
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            ),

            // Add button
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: AppTheme.backgroundDark,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isActive) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isActive
            ? AppTheme.primary
            : Colors.grey.shade800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(999),
        border: isActive
            ? null
            : Border.all(color: Colors.grey.shade700),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppTheme.primary.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey.shade300,
            fontSize: 13,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPost(
    String name,
    String handle,
    String content,
    List<String> tags, {
    bool hasImage = false,
    required String likes,
    required String comments,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade700,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white70,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        handle,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey.shade400,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Content
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.5,
              ),
            ),

            if (tags.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: tags
                    .map((tag) => Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primary,
                          ),
                        ))
                    .toList(),
              ),
            ],

            if (hasImage) ...[
              const SizedBox(height: 16),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.shade900,
                      Colors.green.shade800,
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.park_rounded,
                    color: Colors.green.shade400,
                    size: 60,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Actions
            Row(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: AppTheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  likes,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(width: 24),
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  comments,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.share_rounded,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyTipPost(
    String name,
    String handle,
    String content, {
    required String likes,
    required String comments,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade700,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white70,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        handle,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Safety Tip card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.primary.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.verified_user_rounded,
                        color: AppTheme.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'SAFETY TIP',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  likes,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(width: 24),
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  comments,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.share_rounded,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
