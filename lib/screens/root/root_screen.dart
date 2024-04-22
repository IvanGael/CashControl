import 'package:cash_control/constants/animations.dart';
import 'package:cash_control/constants/attributes.dart';
import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/constants/images.dart';
import 'package:cash_control/providers/theme_provider.dart';
import 'package:cash_control/screens/home/home_screen.dart';
import 'package:cash_control/theme/theme_manager.dart';
import 'package:cash_control/widgets/custom_alert.dart';
import 'package:cash_control/widgets/lottie_animation.dart';
import 'package:cash_control/widgets/sheet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:r_nav_n_sheet/r_nav_n_sheet.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:badges/badges.dart' as badges;

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  bool _open = false;

  List<Widget> _widgetOptions() {
    return [
      const HomeScreen(),
      const Center(
        child: Text("Budgets"),
      ),
      const Center(
        child: Text("Dépenses"),
      ),
      const Center(
        child: Text("Compte"),
      ),
    ];
  }

  List<String> titleList = ["Accueil", "Budgets", "Dépenses", "Compte"];

  Color colorToUse() {
    if (Provider.of<ThemeProvider>(context).getThemeData() ==
        ThemeManager().lightTheme) {
      return AppColors.color5;
    } else {
      return AppColors.color4;
    }
  }

  Widget _buildBottomNavigationBar() {
    return CurvedNavigationBar(
      index: _currentIndex,
      height: 50.0,
      items: [
        Icon(Icons.home,
            size: 30, color: Theme.of(context).colorScheme.primary),
        Icon(Icons.pie_chart,
            size: 30, color: Theme.of(context).colorScheme.primary),
        Icon(Icons.settings,
            size: 30, color: Theme.of(context).colorScheme.primary)
      ],
      color: Theme.of(context).primaryColor,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).colorScheme.primary,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildBottomGNavBar() {
    return GNav(
        rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
        // hoverColor: Colors.grey[700]!, // tab button hover color
        haptic: true, // ha
        backgroundColor: AppColors.color9,
        color: AppColors.color7,
        activeColor: AppColors.color5,
        tabBackgroundColor: AppColors.color2,
        tabBorderRadius: 12,
        tabMargin: const EdgeInsets.all(10),
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
        ],
        tabActiveBorder:
            Border.all(color: Colors.black, width: 1), // tab button border
        tabBorder: Border.all(color: Colors.grey, width: 1),
        curve: Curves.decelerate,
        gap: 4,
        padding: const EdgeInsets.all(10),
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.heart_broken,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          )
        ]);
  }

  Widget _buildBottomRNavBar() {
    return RNavNSheet(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _currentIndex = index;
          });
        });
      },
      initialSelectedIndex: _currentIndex,
      sheet: Sheet(),
      sheetOpenIcon: Icons.menu_outlined,
      sheetCloseIcon: Icons.close,
      sheetCloseIconBoxColor: Theme.of(context).colorScheme.primary,
      sheetCloseIconColor: colorToUse(),
      sheetOpenIconColor: Theme.of(context).colorScheme.primary,
      sheetOpenIconBoxColor: colorToUse(),
      selectedItemColor: AppColors.color3,
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      onSheetToggle: (v) {
        setState(() {
          _open = v;
        });
      },
      items: const [
        RNavItem(
          activeIcon: Icons.home,
          icon: Icons.home,
          label: "Accueil",
        ),
        RNavItem(
          icon: Icons.wallet,
          activeIcon: Icons.wallet,
          label: "Budgets",
        ),
        RNavItem(
          icon: Icons.sell,
          activeIcon: Icons.sell,
          label: "Dépenses",
        ),
        RNavItem(
          icon: Icons.person_2,
          activeIcon: Icons.person_2,
          label: "Compte",
        ),
      ],
    );
  }

  void _showCustomAlert(BuildContext context) {
    CustomAlert.show(
        context: context,
        type: AlertType.success,
        title: "Information",
        description: "This is an informational alert.");
  }

  String getGreetings() {
    var heure = DateTime.now().hour;
    if (heure < 12) {
      return "Bonjour";
    } else if (heure < 18) {
      return "Bon après-midi";
    } else {
      return "Bonsoir";
    }
  }

  String getGreetingAnimation() {
    if (Provider.of<ThemeProvider>(context).getThemeData() ==
        ThemeManager().lightTheme) {
      return AppAnimations.greeting_light;
    }
    return AppAnimations.greeting_dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          centerTitle: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.color5,
                          image: const DecorationImage(
                              image: AssetImage(AppImages.logo),
                              alignment: Alignment.center),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 3,
                              style: BorderStyle.solid)),
                                            ),
                      const SizedBox(width: 10),
                      //titleList[_currentIndex]
                      Text(
                        AppAttributes.appName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.color2,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {},
                            icon: badges.Badge(
                              badgeContent: const Text('3'),
                              badgeStyle: badges.BadgeStyle(
                                badgeColor: AppColors.color3,
                                elevation: 0,
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: AppColors.color5,
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LottieAnimation(
                  animationAsset: getGreetingAnimation(),
                  width: 80,
                  height: 80,
                ),
                Text(
                  getGreetings(),
                  style: TextStyle(
                      color: AppColors.color3,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                  ),
                ),
                const SizedBox(width: 10,),
                Center(
                  child: Text(
                    "John",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
                            )
            ],
          ),
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    AppColors.color2,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          elevation: 8.0,
          shadowColor: AppColors.color7,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        extendBody: true,
        body: IndexedStack(
          index: _currentIndex,
          children: _widgetOptions(),
        ),
        // bottomNavigationBar: _buildBottomNavigationBar(),
        // bottomNavigationBar: _buildBottomGNavBar()
        bottomNavigationBar: _buildBottomRNavBar());
  }
}
