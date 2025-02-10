import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

// Constants from your theme
const kPrimaryColor = Color(0xFF2196F3);
const kBackgroundColor = Color(0xFF121212);
const kCardBackgroundColor = Color(0xFF131313);
const kTextColor = Color(0xFFEAEAEA);
const kSecondaryTextColor = Color(0xFFCCCCCC);
const kBorderColor = Color(0xFF2C2C2C);
const kAccentColor = Color(0xFF4CAF50); // New accent color for better contrast
const kSuccessColor = Color(0xFF4CAF50);
const kWarningColor = Color(0xFFFFC107);

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'active':
      return kSuccessColor;
    case 'in progress':
      return kWarningColor;
    default:
      return kPrimaryColor;
  }
}

class ProjectDetailsPage extends StatelessWidget {
  final Map<String, dynamic> project;
  final Function(int) onUpvote;
  final int index;

  const ProjectDetailsPage({
    Key? key,
    required this.project,
    required this.onUpvote,
    required this.index,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kCardBackgroundColor,
        title: Text(
          project['title'],
          style: TextStyle(color: kTextColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectHeader(context),
              const SizedBox(height: 24),
              _buildTokenImage(),
              const SizedBox(height: 24),
              _buildCreatorProfile(),
              const SizedBox(height: 24),
              _buildProjectGallery(),
              const SizedBox(height: 24),
              _buildProjectUpdates(),
              const SizedBox(height: 24),
              _buildCommentsSection(),
              const SizedBox(height: 24),
              _buildSocialLinks(),
              const SizedBox(height: 24),
              _buildAdditionalResources(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectHeader(BuildContext context) {
    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    project['title'],
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      project['isUpvoted'] ? Icons.rocket_launch : Icons.rocket_launch_outlined,
                      color: project['isUpvoted'] ? kPrimaryColor : kTextColor,
                    ),
                  ),
                  onPressed: () => onUpvote(index),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Rank #${project['rank']} · ${project['category']}',
              style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Text(
              project['detailed_description'] ?? project['description'],
              style: TextStyle(color: kTextColor, height: 1.5, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project['tags'].map<Widget>((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: kPrimaryColor.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Launch Date: ${DateFormat('MMM dd, yyyy').format(project['launch_date'])}',
                  style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
                ),
                Text(
                  'Status: ${project['status']}',
                  style: TextStyle(
                    color: getStatusColor(project['status']),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTokenImage() {
    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NFT Token',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                project['token_image'],
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 300,
                  color: kPrimaryColor.withOpacity(0.1),
                  child: Icon(Icons.image_not_supported, color: kSecondaryTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatorProfile() {
    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Creator Profile',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(project['image']),
                  backgroundColor: kPrimaryColor.withOpacity(0.1),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['creator'],
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Created ${project['upvotes']} projects',
                        style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectGallery() {
    final List<String> images = [
      project['image'],
      project['token_image'],
      // Add more images if available in your data structure
    ];

    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Gallery',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: images.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: kPrimaryColor.withOpacity(0.1),
                            child: Icon(Icons.image_not_supported, color: kSecondaryTextColor),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectUpdates() {
    // Simulated updates - in real app, this would come from your data structure
    final List<Map<String, String>> updates = [
      {
        'date': '2024-02-10',
        'title': 'Project Launch',
        'description': 'Successfully launched the project.',
      },
      {
        'date': '2024-02-05',
        'title': 'Development Update',
        'description': 'Completed core features implementation.',
      },
    ];

    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Updates',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: updates.length,
              itemBuilder: (context, index) {
                final update = updates[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            update['title']!,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('MMM dd, yyyy').format(DateTime.parse(update['date']!)),
                            style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        update['description']!,
                        style: TextStyle(color: kTextColor, fontSize: 14),
                      ),
                      if (index < updates.length - 1) Divider(color: kBorderColor, height: 32),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    // Simulated comments - in real app, this would come from your data structure
    final List<Map<String, String>> comments = [
      {
        'user': 'User1',
        'date': '2024-02-10',
        'comment': 'Great project! Looking forward to the updates.',
      },
      {
        'user': 'User2',
        'date': '2024-02-09',
        'comment': 'Interesting concept and well-executed.',
      },
    ];

    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comments',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            comment['user']!,
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat('MMM dd, yyyy').format(DateTime.parse(comment['date']!)),
                            style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        comment['comment']!,
                        style: TextStyle(color: kTextColor, fontSize: 14),
                      ),
                      if (index < comments.length - 1) Divider(color: kBorderColor, height: 32),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    final Map<String, IconData> socialLinks = {
      'Twitter': Icons.link,
      'Discord': Icons.link,
      'Website': Icons.language,
    };

    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Social Links',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: socialLinks.entries.map((entry) {
                return InkWell(
                  onTap: () {
                    // In real app, use actual URLs from your data structure
                    _launchURL('https://example.com');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kPrimaryColor.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(entry.value, color: kPrimaryColor, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          entry.key,
                          style: TextStyle(color: kTextColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalResources() {
    final List<Map<String, String>> resources = [
      {'title': 'Whitepaper', 'url': 'https://example.com/whitepaper'},
      {'title': 'Pitch Deck', 'url': 'https://example.com/pitch-deck'},
      {'title': 'Technical Documentation', 'url': 'https://example.com/docs'},
    ];

    return Card(
      color: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Additional Resources',
              style: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: resources.length,
              itemBuilder: (context, index) {
                final resource = resources[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.description, color: kPrimaryColor),
                  title: Text(
                    resource['title']!,
                    style: TextStyle(color: kTextColor, fontSize: 14),
                  ),
                  trailing: Icon(Icons.download, color: kPrimaryColor),
                  onTap: () => _launchURL(resource['url']!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}