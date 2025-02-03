
// // lib/pages/page_four.dart
// import 'package:flutter/material.dart';
//
// class PageFour extends StatelessWidget {
//   const PageFour({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Page Four'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome to Page Four',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Back'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        body: Container(
          width: double.infinity, // Ensures full width
          height: double.infinity, // Ensures full height
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFe3efff), // Light blue
                Color(0xFFfce3ff), // Light pink
                Color(0xFFffffe3), // Light yellow
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80), // Space from top

                // Profile Avatar
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatar_placeholder.png'), // Check if image exists
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 10),

                // Username and Bio
                const Text(
                  'Wiz K',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'A student',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 5),

                // ID and Follower Count
                const Text(
                  '#8081933   0 followers   0 following',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 15),

                // Streak and Stacked Products
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wb_sunny, color: Colors.orange, size: 20),
                      const SizedBox(width: 5),
                      const Text('2-day streak'),
                      const SizedBox(width: 15),
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            Image.asset('assets/notion.png', width: 30, errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 30)), // Fallback icon if image is missing
                            const SizedBox(width: 5),
                            Image.asset('assets/spotify.png', width: 30, errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 30)),
                            const SizedBox(width: 5),
                            Image.asset('assets/gmail.png', width: 30, errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 30)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('+7 stacked products'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Edit Profile clicked!')),
                    );
                  },
                  child: const Text('Edit my profile'),
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
                      Tab(text: 'About'),
                      Tab(text: 'Activity'),
                      Tab(text: 'Upvotes'),
                      Tab(text: 'Collections'),
                      Tab(text: '10 Stacks'),
                    ],
                  ),
                ),

                // Tab Views
                Container(
                  height: 400, // Ensures proper height
                  child: const TabBarView(
                    children: [
                      Center(child: Text('About Section')),
                      Center(child: Text('No Activity Events')),
                      Center(child: Text('Upvotes')),
                      Center(child: Text('Collections')),
                      Center(child: Text('10 Stacks')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
