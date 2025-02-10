// project_details_dialog.dart

import 'dart:ui';
import 'package:felcon/pages/project_details_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0xFF2196F3);
const kBackgroundColor = Color(0xFF121212);
const kCardBackgroundColor = Color(0xFF1E1E1E);
const kTextColor = Color(0xFFEAEAEA);
const kSecondaryTextColor = Color(0xFFB0B0B0);
const kSuccessColor = Color(0xFF4CAF50);
const kWarningColor = Color(0xFFFFC107);

class ProjectDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> project;
  final Function(int) onUpvote;
  final int index;

  const ProjectDetailsDialog({
    Key? key,
    required this.project,
    required this.onUpvote,
    required this.index,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    // Calculate dialog dimensions based on screen size
    final screenSize = MediaQuery.of(context).size;
    final dialogWidth = screenSize.width * 0.85; // 85% of screen width
    final dialogHeight = screenSize.height * 0.7; // 70% of screen height

    // Additional project details
    final projectDetails = {
      ...project,
      };

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: dialogWidth,
        height: dialogHeight,
        decoration: BoxDecoration(
          color: kCardBackgroundColor.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // Left side - Token Image
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.white24,
                  child: Image.network(
                    projectDetails['token_image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Right side - Details
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with project logo and title
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  project['image'],
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project['title'],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: getStatusColor(projectDetails['status']).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            projectDetails['status'],
                                            style: TextStyle(
                                              color: getStatusColor(projectDetails['status']),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "by ${project['creator']}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Description
                          Text(
                            projectDetails['detailed_description'],
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.6,
                              color: kTextColor.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Stats Grid
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  icon: Icons.rocket_launch,
                                  value: "${project['upvotes']}",
                                  label: "Upvotes",
                                  isUpvoted: project['isUpvoted'],
                                  onPressed: () => onUpvote(index),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  icon: Icons.monetization_on,
                                  value: "${project['funds']} XTZ",
                                  label: "Funds Raised",
                                  buttonLabel: "Donate",
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  icon: Icons.leaderboard,
                                  value: "#${project['position']}",
                                  label: "Position",
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  icon: Icons.calendar_today,
                                  value: DateFormat('MMM d, y').format(projectDetails['launch_date']),
                                  label: "Launch Date",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Tags
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: projectDetails['tags'].map<Widget>((tag) {
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
                          const SizedBox(height: 24),

                          // CTA Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectDetailsPage(
                                      project: project,
                                      onUpvote: onUpvote,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "More Details",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Close button
                    Positioned(
                      right: 8,
                      top: 8,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: kCardBackgroundColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kPrimaryColor.withOpacity(0.2),
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: kTextColor,
                            size: 20,
                          ),
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
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    String? buttonLabel,
    bool isUpvoted = false,
    VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kPrimaryColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: kPrimaryColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: kTextColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          if (onPressed != null)
            TextButton.icon(
              onPressed: onPressed,
              icon: Icon(
                project['isUpvoted'] ? Icons.rocket_launch : Icons.rocket_launch_outlined,
                size: 16,
                color: isUpvoted ? Colors.green : kPrimaryColor,
              ),
              label: Text(
                buttonLabel ?? (isUpvoted ? "Upvoted" : "Upvote"),
                style: TextStyle(
                  fontSize: 12,
                  color: isUpvoted ? Colors.green : kPrimaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}