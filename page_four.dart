
import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.black, // Dark theme background
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60), // Space from top

              // Profile Avatar (NFT-based)
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/nft_avatar.png'), // NFT-based avatar
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 10),

              // Username (Wallet Address or ENS-like name)
              const Text(
                '0x1234...abcd', // Replace with dynamic wallet address or ENS
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 5),

              // Bio (Short description of the builder/creator)
              const Text(
                'Blockchain Builder | NFT Creator | Tezos Enthusiast',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),

              // Joined Date (Blockchain timestamp of first activity)
              const Text(
                'Joined: Jan 2023', // Replace with dynamic timestamp
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Stats & Highlights
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem('Minted Projects', '12'), // Replace with dynamic data
                  _buildStatItem('Upvotes', '1.2K'), // Replace with dynamic data
                  _buildStatItem('Funds Raised', '500 XTZ'), // Replace with dynamic data
                  _buildStatItem('Rank', '#5'), // Replace with dynamic data
                ],
              ),
              const SizedBox(height: 20),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Mint New Project page
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Mint New Project clicked!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Mint New Project', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Edit Profile page
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Edit Profile clicked!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Withdraw Funds page
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Withdraw Funds clicked!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Withdraw Funds', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Tab Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(text: 'My Projects'),
                    Tab(text: 'Upvoted Projects'),
                    Tab(text: 'Supporters'),
                    Tab(text: 'Leaderboard'),
                    Tab(text: 'Activity Feed'),
                  ],
                ),
              ),

              // Tab Views
              SizedBox(
                height: 400, // Ensures proper height
                child: TabBarView(
                  children: [
                    _buildMyProjectsTab(), // My Projects Tab
                    _buildUpvotedProjectsTab(), // Upvoted Projects Tab
                    _buildSupportersTab(), // Supporters Tab
                    _buildLeaderboardTab(), // Leaderboard Tab
                    _buildActivityFeedTab(), // Activity Feed Tab
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Stat Item Widget
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // My Projects Tab
  Widget _buildMyProjectsTab() {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/nft_placeholder.png'), // NFT thumbnail
            ),
            title: const Text(
              'Project Title',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Minted on Jan 2023 | 500 XTZ Raised',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            onTap: () {
              // Navigate to Project Details Page
            },
          ),
        );
      },
    );
  }

  // Upvoted Projects Tab
  Widget _buildUpvotedProjectsTab() {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/nft_placeholder.png'), // NFT thumbnail
            ),
            title: const Text(
              'Upvoted Project Title',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Donated: 10 XTZ | Rank: #3',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            onTap: () {
              // Navigate to Project Details Page
            },
          ),
        );
      },
    );
  }

  // Supporters Tab
  Widget _buildSupportersTab() {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/supporter_placeholder.png'), // Supporter avatar
            ),
            title: const Text(
              'Supporter Name',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Donated: 50 XTZ | Received Gratitude NFT',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            onTap: () {
              // Navigate to Supporter Details Page
            },
          ),
        );
      },
    );
  }

  // Leaderboard Tab
  Widget _buildLeaderboardTab() {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: Text(
              '#${index + 1}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            title: const Text(
              'Project Title',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Upvotes: 1.2K | Funds Raised: 500 XTZ',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            onTap: () {
              // Navigate to Project Details Page
            },
          ),
        );
      },
    );
  }

  // Activity Feed Tab
  Widget _buildActivityFeedTab() {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: const Icon(Icons.bolt, color: Colors.blue), // Activity icon
            title: const Text(
              'Minted a new project',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Jan 1, 2023 | 500 XTZ Raised',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.white),
            onTap: () {
              // Navigate to Activity Details Page
            },
          ),
        );
      },
    );
  }
}
