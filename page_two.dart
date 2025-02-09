// import 'package:flutter/material.dart';
// import 'page_three.dart';
//
// class PageTwo extends StatefulWidget {
//   const PageTwo({Key? key}) : super(key: key);
//
//   @override
//   _PageTwoState createState() => _PageTwoState();
// }
//
// class _PageTwoState extends State<PageTwo> {
//   final TextEditingController _searchController = TextEditingController();
//   final List<String> _categories = [
//     "Productivity", "Games", "Ecommerce", "Social Media", "Web3"
//   ];
//
//   final List<Map<String, String>> _dynamicCards = [
//     {
//       "title": "Project Management App",
//       "description": "Streamline your team's workflow.",
//       "category": "Productivity"
//     },
//     {
//       "title": "Mobile Game Concept",
//       "description": "Innovative multiplayer strategy game.",
//       "category": "Games"
//     },
//     {
//       "title": "E-commerce Platform",
//       "description": "Next-generation online marketplace.",
//       "category": "Ecommerce"
//     },
//     {
//       "title": "Social Networking App",
//       "description": "Connect with friends and share moments.",
//       "category": "Social Media"
//     },
//     {
//       "title": "Task Tracker Pro",
//       "description": "Keep track of your daily tasks and deadlines effortlessly.",
//       "category": "Productivity"
//     },
//     {
//       "title": "Adventure Quest",
//       "description": "Embark on epic adventures and conquer exciting challenges.",
//       "category": "Games"
//     },
//     {
//       "title": "ShopSmart",
//       "description": "An all-in-one platform for seamless online shopping.",
//       "category": "Ecommerce"
//     },
//     {
//       "title": "ChatterHub",
//       "description": "Connect with friends and share moments instantly.",
//       "category": "Social media"
//     },
//     {
//       "title": "CryptoVault",
//       "description": "Secure and manage your crypto assets with ease.",
//       "category": "Web3"
//     },
//     {
//       "title": "TeamSync",
//       "description": "Collaborate with your team and improve project efficiency.",
//       "category": "Productivity"
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isWideScreen = constraints.maxWidth > 600;
//
//         return Scaffold(
//           drawer: Drawer(
//             child: ListView(
//               children: [
//                 const DrawerHeader(
//                   decoration: BoxDecoration(color: Colors.black),
//                   child: Text(
//                     'Menu',
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 ListTile(
//                   title: const Text('Option 1'),
//                   onTap: () => Navigator.pop(context),
//                 ),
//                 ListTile(
//                   title: const Text('Option 2'),
//                   onTap: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//           appBar: AppBar(
//             title: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           body: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Horizontal Scrollable Chips
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Row(
//                     children: _categories.map((category) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: Chip(
//                           label: Text(category),
//                           backgroundColor: Colors.black,
//                           labelStyle: const TextStyle(color: Colors.white),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//
//                 // Responsive Grid/List of Cards
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: isWideScreen ? 3 : 2,
//                         childAspectRatio: 0.8,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: _dynamicCards.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           elevation: 4,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   _dynamicCards[index]['title']!,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   _dynamicCards[index]['description']!,
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(fontSize: 12),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Chip(
//                                     label: Text(
//                                       _dynamicCards[index]['category']!,
//                                       style: const TextStyle(fontSize: 10),
//                                     ),
//                                     backgroundColor: Colors.black,
//                                     labelStyle: const TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomAppBar(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.arrow_back),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.arrow_forward),
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const PageThree()),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'page_three.dart';
import 'page_four.dart'; // Import page_five.dart

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

  String _selectedCategory = ''; // Variable to store selected category

  final List<Map<String, dynamic>> _dynamicCards = [
    {
      "rank": 1,
      "title": "Project Management App",
      "description": "Streamline your team's workflow.",
      "category": "Productivity",
      "upvotes": 3,
      "isUpvoted": false, // Flag to track whether the card is upvoted
    },
    {
      "rank": 2,
      "title": "Mobile Game Concept",
      "description": "Innovative multiplayer strategy game.",
      "category": "Games",
      "upvotes": 4,
      "isUpvoted": false,
    },
    {
      "rank": 3,
      "title": "E-commerce Platform",
      "description": "Next-generation online marketplace.",
      "category": "Ecommerce",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 4,
      "title": "Social Networking App",
      "description": "Connect with friends and share moments.",
      "category": "Social Media",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 5,
      "title": "Task Tracker Pro",
      "description": "Keep track of your daily tasks and deadlines effortlessly.",
      "category": "Productivity",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 6,
      "title": "Adventure Quest",
      "description": "Embark on epic adventures and conquer exciting challenges.",
      "category": "Games",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 7,
      "title": "ShopSmart",
      "description": "An all-in-one platform for seamless online shopping.",
      "category": "Ecommerce",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 8,
      "title": "ChatterHub",
      "description": "Connect with friends and share moments instantly.",
      "category": "Social Media",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 9,
      "title": "CryptoVault",
      "description": "Secure and manage your crypto assets with ease.",
      "category": "Web3",
      "upvotes": 0,
      "isUpvoted": false,
    },
    {
      "rank": 10,
      "title": "TeamSync",
      "description": "Collaborate with your team and improve project efficiency.",
      "category": "Productivity",
      "upvotes": 0,
      "isUpvoted": false,
    },
  ];
@override
void initState() {
  super.initState();
  // Sort cards initially by upvotes
  sortCards();
}

  // Function to dynamically adjust search bar width
  double getSearchBarWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.4; // Makes the search bar 60% of screen width
  }

  void sortCards() {
    setState(() {
      _dynamicCards.sort((a, b) => b["upvotes"].compareTo(a["upvotes"]));
      // Update ranks after sorting
      for (int i = 0; i < _dynamicCards.length; i++) {
        _dynamicCards[i]["rank"] = i + 1;
      }
    });
  }


  // Function to handle upvote and downvote actions dynamically
  void toggleVote(int index) {
    setState(() {
      if (_dynamicCards[index]["isUpvoted"]) {
        _dynamicCards[index]["upvotes"]--;
      } else {
        _dynamicCards[index]["upvotes"]++;
      }
      _dynamicCards[index]["isUpvoted"] = !_dynamicCards[index]["isUpvoted"];
      sortCards(); // Call sorting function after vote change
    });
  }

  // Function to get filtered cards based on selected category
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
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    // Navigate to page_four.dart when "Profile" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PageFour()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Option 2'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Container(
              width: getSearchBarWidth(context),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          body: SafeArea(
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
                                color: Colors.black.withOpacity(0.3),
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
                                    ? Colors.white
                                    : Colors.black87,
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
                            selectedColor: const Color(0xFF2C2C2C),
                            backgroundColor: Colors.grey.shade100,
                            elevation: _selectedCategory == category ? 0 : 1,
                            pressElevation: 2,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: _selectedCategory == category
                                    ? Colors.transparent
                                    : Colors.grey.shade300,
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
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: getFilteredCards().length,
                      itemBuilder: (context, index) {
                        final card = getFilteredCards()[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            card['title']!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Chip(
                                            label: Text(
                                              card['category']!,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.black,
                                            padding: EdgeInsets.zero,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                        ],
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        final size = constraints.maxWidth > 600 ? 48.0 : 40.0;

                                        return Container(
                                          width: size,
                                          height: size,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(size * 0.2),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(
                                                  minWidth: size * 0.6,
                                                  minHeight: size * 0.6,
                                                ),
                                                icon: AnimatedSwitcher(
                                                  duration: const Duration(milliseconds: 300),
                                                  transitionBuilder: (Widget child, Animation<double> animation) {
                                                    return ScaleTransition(scale: animation, child: child);
                                                  },
                                                  child: Icon(
                                                    card["isUpvoted"] ? Icons.rocket_launch : Icons.rocket_launch_outlined,
                                                    key: ValueKey<bool>(card["isUpvoted"]),
                                                    color: card["isUpvoted"] ? Colors.green : Colors.white,
                                                    size: size * 0.4,
                                                  ),
                                                ),
                                                onPressed: () => toggleVote(index),
                                              ),
                                              Text(
                                                "${card["upvotes"]}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size * 0.25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  card['description']!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PageThree()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}