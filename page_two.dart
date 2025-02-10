import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'page_three.dart';
import 'page_four.dart';
import 'project_details_dialog.dart';

const kPrimaryColor = Color(0xFF2196F3);
const kBackgroundColor = Color(0xFF121212);
const kCardBackgroundColor = Color(0xFF131313);
const kTextColor = Color(0xFFEAEAEA);
const kSecondaryTextColor = Color(0xFFCCCCCC);
const kBorderColor = Color(0xFF2C2C2C);



class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = [
    "Productivity",
    "Games",
    "Ecommerce",
    "Social Media",
    "Web3"
  ];

  String _selectedCategory = '';

  final List<Map<String, dynamic>> _dynamicCards = [
    {
      "rank": 1,
      "title": "Project Management App",
      "description": "Streamline your team's workflow.",
      "category": "Productivity",
      "upvotes": 3,
      "isUpvoted": false,
      "image": "https://plus.unsplash.com/premium_photo-1661914978519-52a11fe159a7?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "token_image": "https://images.unsplash.com/photo-1633409361618-c73427e4e206?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "status": "Active",
      "launch_date": DateTime.parse("2022-01-01"),
      "tags": ["project management", "team workflow", "productivity"],
      "detailed_description": "This project management app is designed to help teams streamline their workflow and improve productivity. With features such as task assignment, deadline tracking, and collaboration tools, teams can work more efficiently and effectively.",
      "creator": "AliceDev",
      "funds": 500,
      "position": 5,
    },
    {
      "rank": 2,
      "title": "Mobile Game Concept",
      "description": "Innovative multiplayer strategy game.",
      "category": "Games",
      "upvotes": 4,
      "isUpvoted": false,
      "image": "https://images.unsplash.com/photo-1633409361618-c73427e4e206?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "token_image": "https://example.com/images/mobile_game_token.png",
      "status": "In Progress",
      "launch_date": DateTime.parse("2022-06-01"),
      "tags": ["mobile game", "multiplayer", "strategy"],
      "detailed_description": "This mobile game concept is an innovative multiplayer strategy game that allows players to compete against each other in real-time. With features such as leaderboards, daily challenges, and social sharing, players can engage with the game in a variety of ways.",
      "creator": "GameMaker99",
      "funds": 300,
      "position": 3,
    },
    {
      "rank": 3,
      "title": "E-commerce Platform",
      "description": "Next-generation online marketplace.",
      "category": "Ecommerce",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://plus.unsplash.com/premium_vector-1726930891962-b337f61cb814?q=80&w=2130&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "token_image": "https://example.com/images/ecommerce_token.png",
      "status": "Complete",
      "launch_date": DateTime.parse("2022-03-01"),
      "tags": ["ecommerce", "online marketplace", "next-generation"],
      "detailed_description": "This e-commerce platform is a next-generation online marketplace that allows businesses to sell their products and services to a global audience. With features such as payment processing, shipping integration, and customer management, businesses can easily manage their online presence.",
      "creator": "ShopSmartTeam",
      "funds": 1000,
      "position": 1,
    },
    {
      "rank": 4,
      "title": "Social Networking App",
      "description": "Connect with friends and share moments.",
      "category": "Social Media",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://plus.unsplash.com/premium_photo-1722176809011-7e5677562960?q=80&w=1984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "token_image": "https://example.com/images/social_networking_token.png",
      "status": "Active",
      "launch_date": DateTime.parse("2022-02-01"),
      "tags": ["social networking", "connect with friends", "share moments"],
      "detailed_description": "This social networking app allows users to connect with friends and share moments from their lives. With features such as messaging, photo sharing, and event planning, users can stay connected with their friends and family.",
      "creator": "SocialConnect",
      "funds": 200,
      "position": 4,
    },
    {
      "rank": 5,
      "title": "Task Tracker Pro",
      "description": "Keep track of your daily tasks and deadlines effortlessly.",
      "category": "Productivity",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://example.com/images/task_tracker_pro.png",
      "token_image": "https://example.com/images/task_tracker_token.png",
      "status": "In Progress",
      "launch_date": DateTime.parse("2022-07-01"),
      "tags": ["task tracker", "productivity", "deadlines"],
      "detailed_description": "This task tracker app allows users to keep track of their daily tasks and deadlines effortlessly. With features such as task assignment, deadline tracking, and reminders, users can stay on top of their work and personal tasks.",
      "creator": "TaskMaster",
      "funds": 150,
      "position": 6,
    },
    {
      "rank": 6,
      "title": "Adventure Quest",
      "description": "Embark on epic adventures and conquer exciting challenges.",
      "category": "Games",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://example.com/images/adventure_quest.png",
      "token_image": "https://example.com/images/adventure_quest_token.png",
      "status": "Complete",
      "launch_date": DateTime.parse("2022-04-01"),
      "tags": ["adventure game", "epic adventures", "exciting challenges"],
      "detailed_description": "This adventure game allows players to embark on epic adventures and conquer exciting challenges. With features such as character customization, questing, and combat, players can engage with the game in a variety of ways.",
      "creator": "QuestCreator",
      "funds": 400,
      "position": 2,
    },
    {
      "rank": 7,
      "title": "ShopSmart",
      "description": "An all-in-one platform for seamless online shopping.",
      "category": "Ecommerce",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://i.pinimg.com/736x/b4/84/b0/b484b028e6e065fe7e82ed2b2f503584.jpg",
      "token_image": "https://example.com/images/shopsmart_token.png",
      "status": "Active",
      "launch_date": DateTime.parse("2022-05-01"),
      "tags": ["ecommerce", "online shopping", "all-in-one platform"],
      "detailed_description": "This e-commerce platform is an all-in-one platform for seamless online shopping. With features such as payment processing, shipping integration, and customer management, businesses can easily manage their online presence.",
      "creator": "InnovateShop",
      "funds": 600,
      "position": 7,
    },
    {
      "rank": 8,
      "title": "ChatterHub",
      "description": "Connect with friends and share moments instantly.",
      "category": "Social Media",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://example.com/images/chatterhub.png",
      "token_image": "https://example.com/images/chatterhub_token.png",
      "status": "In Progress",
      "launch_date": DateTime.parse("2022-08-01"),
      "tags": ["social networking", "connect with friends", "share moments"],
      "detailed_description": "This social networking app allows users to connect with friends and share moments from their lives. With features such as messaging, photo sharing, and event planning, users can stay connected with their friends and family.",
      "creator": "ChatTeam",
      "funds": 250,
      "position": 8,
    },
    {
      "rank": 9,
      "title": "CryptoVault",
      "description": "Secure and manage your crypto assets with ease.",
      "category": "Web3",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://example.com/images/crypto_vault.png",
      "token_image": "https://example.com/images/crypto_vault_token.png",
      "status": "Complete",
      "launch_date": DateTime.parse("2022-09-01"),
      "tags": ["crypto assets", "security", "management"],
      "detailed_description": "This crypto asset management platform allows users to secure and manage their crypto assets with ease. With features such as wallet management, transaction tracking, and security measures, users can protect their investments.",
      "creator": "CryptoSecure",
      "funds": 700,
      "position": 9,
    },
    {
      "rank": 10,
      "title": "TeamSync",
      "description": "Collaborate with your team and improve project efficiency.",
      "category": "Productivity",
      "upvotes": 0,
      "isUpvoted": false,
      "image": "https://example.com/images/team_sync.png",
      "token_image": "https://example.com/images/team_sync_token.png",
      "status": "Active",
      "launch_date": DateTime.parse("2022-10-01"),
      "tags": ["team collaboration", "project efficiency", "productivity"],
      "detailed_description": "This team collaboration platform allows teams to collaborate and improve project efficiency. With features such as task assignment, deadline tracking, and communication tools, teams can work more efficiently and effectively.",
      "creator": "CollabTeam",
      "funds": 350,
      "position": 10,
    },
  ];

  @override
  void initState() {
    super.initState();
    sortCards();
  }

  double getSearchBarWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.4;
  }

  void sortCards() {
    setState(() {
      _dynamicCards.sort((a, b) => b["upvotes"].compareTo(a["upvotes"]));
      for (int i = 0; i < _dynamicCards.length; i++) {
        _dynamicCards[i]["rank"] = i + 1;
      }
    });
  }

  void toggleVote(int index) {
    setState(() {
      if (_dynamicCards[index]["isUpvoted"]) {
        _dynamicCards[index]["upvotes"]--;
      } else {
        _dynamicCards[index]["upvotes"]++;
      }
      _dynamicCards[index]["isUpvoted"] = !_dynamicCards[index]["isUpvoted"];
      sortCards();
    });
  }

  List<Map<String, dynamic>> getFilteredCards() {
    if (_selectedCategory.isEmpty) {
      return _dynamicCards;
    } else {
      return _dynamicCards
          .where((card) => card["category"] == _selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;

        return Scaffold(
          backgroundColor: kBackgroundColor,
          endDrawer: Drawer(
            child: Container(
              color: kCardBackgroundColor,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      gradient: LinearGradient(
                        colors: [
                          kPrimaryColor,
                          kPrimaryColor.withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Text(
                      'Menu',
                      style: TextStyle(color: kTextColor, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Profile',
                      style: TextStyle(color: kTextColor),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PageFour()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Option 2',
                      style: TextStyle(color: kTextColor),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: kCardBackgroundColor,
            elevation: 0,
            title: Container(
              width: getSearchBarWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.1),
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: kTextColor),
                decoration: InputDecoration(
                  hintText: 'Search items...',
                  hintStyle: TextStyle(color: kTextColor.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: kTextColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          body: Container(

            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.4, -0.6), // Soft glow position
                radius: 1.4,
                colors: [
                  Color(0xFF04619F), // *Deep Cyan-Blue (Vibrant but not too bright)*
                  Color(0xFF3D2C8D), // *Subtle Purple (Adds richness)*
                  Color(0xFF1B1F3B), // *Deep Navy Blue (Strong base)*
                  Color(0xFF0A0A0A), // *Vintage Black (Dark & elegant)*
                ],
                stops: [0.1, 0.3, 0.7, 1.0],
              ),
            ),


            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      children: _categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: _selectedCategory == category
                                  ? [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                                  : [],
                            ),
                            child: ChoiceChip(
                              label: Text(
                                category,
                                style: TextStyle(
                                  color: _selectedCategory == category
                                      ? kTextColor
                                      : kSecondaryTextColor,
                                  fontWeight: _selectedCategory == category
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              selected: _selectedCategory == category,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedCategory = selected ? category : '';
                                });
                              },
                              selectedColor: kPrimaryColor,
                              backgroundColor: kCardBackgroundColor,
                              elevation: _selectedCategory == category ? 0 : 1,
                              pressElevation: 2,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: _selectedCategory == category
                                      ? Colors.transparent
                                      : kPrimaryColor.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final cardWidth = 275.0;
                          final crossAxisCount =
                          (constraints.maxWidth / cardWidth).floor();
                          final aspectRatio = 4 / 5;

                          return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: aspectRatio,
                            ),
                            itemCount: getFilteredCards().length,
                            itemBuilder: (context, index) {
                              final card = getFilteredCards()[index];
                              return GestureDetector(
                                onTap:() {
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.black.withOpacity(0.1), // Creates background blur effect
                                  builder: (context) => ProjectDetailsDialog(
                                      project: card,
                                      index: index,
                                      onUpvote: toggleVote),

                                );
                                },
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(
                                      children: [
                                        BackdropFilter(
                                          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.white.withOpacity(0.1),
                                                  Colors.white.withOpacity(0.05),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white.withOpacity(0.2),
                                              width: 0.5,
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 120,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    image: DecorationImage(
                                                      image: NetworkImage("${card['image']}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Text(
                                                  card['title']!,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "By ${card['creator']!}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white.withOpacity(0.8),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  card['description']!,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white.withOpacity(0.8),
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => toggleVote(index),
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                        decoration: BoxDecoration(
                                                          color: Colors.transparent,
                                                          borderRadius: BorderRadius.circular(20),
                                                          border: Border.all(
                                                            color: Colors.white.withOpacity(0.5),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            AnimatedSwitcher(
                                                              duration: const Duration(milliseconds: 300),
                                                              transitionBuilder: (Widget child, Animation<double> animation) {
                                                                return ScaleTransition(scale: animation, child: child);
                                                              },
                                                              child: Icon(
                                                                card["isUpvoted"] ? Icons.rocket_launch : Icons.rocket_launch_outlined,
                                                                key: ValueKey<bool>(card["isUpvoted"]),
                                                                color: card["isUpvoted"] ? Colors.green : Colors.white,
                                                                size: 16,
                                                              ),
                                                            ),
                                                            const SizedBox(width: 4),
                                                            Text(
                                                              "${card["upvotes"]}",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                color: card["isUpvoted"] ? Colors.green : Colors.white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    _buildStatItem(
                                                      icon: Icons.monetization_on,
                                                      value: "${card['funds']} XTZ",
                                                      label: "Funds Raised",
                                                      color: Colors.white,
                                                    ),
                                                    _buildStatItem(
                                                      icon: Icons.leaderboard,
                                                      value: "#${card['position']}",
                                                      label: "Rank",
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(
      {required IconData icon, required String value, required String label, required Color color}) {
    return Column(
      children: [
        Icon(icon, size: 16, color: kPrimaryColor),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: color.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}