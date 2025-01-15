import 'package:refugee_dashboard/pages/dashboard/widgets/popular_products.dart';
import 'package:refugee_dashboard/pages/notification/presenter/notification_create_screen.dart';
import 'package:refugee_dashboard/responsive.dart';
import 'package:refugee_dashboard/shared/constants/defaults.dart';
import 'package:refugee_dashboard/shared/widgets/sidemenu/sidebar.dart';
import 'package:refugee_dashboard/shared/widgets/sidemenu/tab_sidebar.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/header.dart';
import 'dashboard/dashboard_page.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EntryPoint extends StatefulWidget {
  EntryPoint([Key? key, this.currentScreen = "d"]);
  String currentScreen;
  static String routeName = "/entryPoint";
  @override
  State<EntryPoint> createState() => _EndPointState();
}

class _EndPointState extends State<EntryPoint> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        widget.currentScreen = "d";
      } else {
        widget.currentScreen = "p";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: AppColors.primary,
      //   onTap: _onItemTapped,
      // ),
      drawer: Responsive.isMobile(context)
          ? Sidebar(
              onPressed: (menu) {
                setState(() {
                  widget.currentScreen = menu;
                });
              },
            )
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            Sidebar(onPressed: (menu) {
              setState(() {
                widget.currentScreen = menu;
              });
            }),
          if (Responsive.isTablet(context)) const TabSidebar(),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: _drawerKey),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: ListView(
                      children: [
                        if (widget.currentScreen == "d")
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDefaults.padding *
                                  (Responsive.isMobile(context) ? 1 : 1.5),
                            ),
                            child: const SafeArea(child: DashboardPage()),
                          ),
                        if (widget.currentScreen == "p")
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDefaults.padding *
                                  (Responsive.isMobile(context) ? 1 : 1.5),
                            ),
                            child: const SafeArea(child: PopularProducts()),
                          ),
                        if (widget.currentScreen == "notification-create")
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDefaults.padding *
                                  (Responsive.isMobile(context) ? 1 : 1.5),
                            ),
                            child: SafeArea(child: NotificationCreateScreen()),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class EntryPoint extends StatelessWidget {
//   const EntryPoint({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _drawerKey,
//       drawer: Responsive.isMobile(context)
//           ? Sidebar(
//               onPressed: (menu) {},
//             )
//           : null,
//       body: Row(
//         children: [
//           if (Responsive.isDesktop(context)) Sidebar(onPressed: (menu) {}),
//           if (Responsive.isTablet(context)) const TabSidebar(),
//           Expanded(
//             child: Column(
//               children: [
//                 Header(drawerKey: _drawerKey),
//                 Expanded(
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints(maxWidth: 1360),
//                     child: ListView(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: AppDefaults.padding *
//                                 (Responsive.isMobile(context) ? 1 : 1.5),
//                           ),
//                           child: SafeArea(child: DashboardPage()),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
