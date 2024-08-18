import 'package:color_mood_app/src/core/theme/colors.dart';
import 'package:color_mood_app/src/core/widgets/custom_bottom_app_bar.dart';
import 'package:color_mood_app/src/feature/calendar/calendar_screen.dart';
import 'package:color_mood_app/src/feature/today/today_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;

  static const _pages = [
    Placeholder(),
    TodayScreen(),
    CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: currentPage,
        onChanged: (value) => setState(() {
          currentPage = value;
        }),
        items: const [
          BottomItem(icon: Icons.bar_chart, enabled: false),
          BottomItem(icon: Icons.add_circle),
          BottomItem(icon: Icons.calendar_month),
        ],
      ),
    );
  }
}


// NavigationBar(
//         selectedIndex: currentPage,
//         onDestinationSelected: (ind) => setState(() {
//           currentPage = ind;
//         }),
//         backgroundColor: Colors.black,
//         indicatorColor: CustomColors.purple,
//         indicatorShape: StadiumBorder(),
//         destinations: const [
//           NavigationDestination(
//               icon: Icon(Icons.bar_chart, color: Colors.white24),
//               label: '',
//               enabled: false),
//           NavigationDestination(
//               icon: Icon(Icons.add_circle, color: Colors.white), label: ''),
//           NavigationDestination(
//               icon: Icon(Icons.calendar_month, color: Colors.white), label: '')
//         ],
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
//       ),
// BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'stats'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.add_circle), label: 'current'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_month), label: 'calendar')
//         ],
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: tabController.animateTo,
//         currentIndex: tabController.index,
//         iconSize: 24,
//         backgroundColor: Colors.black,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: CustomColors.purple,
//       ),