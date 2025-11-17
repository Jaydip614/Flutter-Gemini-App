import 'package:flutter/material.dart';
import 'package:gemini_app/views/widgets/custom_drawer.dart';

class ExploreGemsScreen extends StatefulWidget {
  const ExploreGemsScreen({super.key});

  @override
  State<ExploreGemsScreen> createState() => _ExploreGemsScreenState();
}

class _ExploreGemsScreenState extends State<ExploreGemsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _gemItems = [
    {
      'icon': Icons.sports_soccer,
      'color': Colors.teal.withValues(alpha: 0.32),
      'title': "Women's World Cup",
      'description': 'Make Gemini your companion for the ICC ...',
    },
    {
      'icon': Icons.menu_book,
      'color': Colors.blue.withValues(alpha: 0.32),
      'title': 'Storybook',
      'description': 'Create a customized picture book, for eit...',
    },
    {
      'icon': Icons.lightbulb_outline,
      'color': Colors.orange.withValues(alpha: 0.32),
      'title': 'Brainstormer',
      'description': 'Find inspiration easily. Fresh ideas for par...',
    },
    {
      'icon': Icons.work_outline,
      'color': Colors.purple.withValues(alpha: 0.32),
      'title': 'Career guide',
      'description': 'Unlock your career potential. Get a detail...',
    },
    {
      'icon': Icons.code,
      'color': Colors.cyan.withValues(alpha: 0.32),
      'title': 'Coding partner',
      'description': 'Level up your coding skills. Get the help y...',
    },
    {
      'icon': Icons.book,
      'color': Colors.indigo.withValues(alpha: 0.5),
      'title': 'Learning coach',
      'description': 'Here to help you learn and practice new c...',
    },
    {
      'icon': Icons.edit_outlined,
      'color': Colors.deepPurple.withValues(alpha: 0.32),
      'title': 'Writing editor',
      'description': 'Elevate your writing. Get clear, constructi...',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.sort),
          ),
        ),
        title: Text(
          "Gems",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
            child: Text(
              "J",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blueAccent,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Your Gems'),
            Tab(text: 'By Google'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [_buildGemList(), _yourGemsList(), _buildGemList()],
      ),
    );
  }

  Widget _buildGemList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: _gemItems.length,
      itemBuilder: (context, index) {
        final item = _gemItems[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: item['color'],
            child: Icon(item['icon'], color: Colors.white70, size: 20),
          ),
          title: Text(
            item['title'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            item['description'],
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _yourGemsList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: Colors.white70, size: 20,),
          SizedBox(width: 12,),
          Text("You can create Gems on the web here"),
        ],
      ),
    );
  }

  Widget _GoogleGemsList() {
    return Center(child: Text("GOOGLE GEMS NOT FOUND!"));
  }
}
