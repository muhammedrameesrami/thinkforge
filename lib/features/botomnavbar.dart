import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dahBoard.dart';
import '../core/constants/colorConst.dart';
import '../core/constants/imageconst.dart';
import 'wallet_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TradingDashboardScreen(),
    const WalletScreen(),
    const Center(
        child: Text("Support", style: TextStyle(color: ColorConst.white))),
    const Center(child: Text("IB", style: TextStyle(color: ColorConst.white))),
  ];

  @override
  Widget build(BuildContext context) {
    // Getting screen dimensions using MediaQuery as requested
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return _buildTabletLayout(w, h);
        } else {
          return _buildMobileLayout(w, h);
        }
      },
    );
  }

  Widget _buildTabletLayout(double w, double h) {
    return Scaffold(
      backgroundColor: ColorConst.appBackground,
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: ColorConst.white,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorConst.black),
            unselectedLabelTextStyle:
                GoogleFonts.inter(fontSize: 12, color: ColorConst.grey),
            destinations: const [
              NavigationRailDestination(
                icon: ImageIcon(AssetImage(ImageConst.home)),
                selectedIcon: ImageIcon(AssetImage(ImageConst.home),
                    color: ColorConst.black),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: ImageIcon(AssetImage(ImageConst.wallet)),
                selectedIcon: ImageIcon(AssetImage(ImageConst.wallet),
                    color: ColorConst.black),
                label: Text("Wallet"),
              ),
              NavigationRailDestination(
                icon: ImageIcon(AssetImage(ImageConst.support)),
                selectedIcon: ImageIcon(AssetImage(ImageConst.support),
                    color: ColorConst.black),
                label: Text("Support"),
              ),
              NavigationRailDestination(
                icon: ImageIcon(AssetImage(ImageConst.ib)),
                selectedIcon: ImageIcon(AssetImage(ImageConst.ib),
                    color: ColorConst.black),
                label: Text("IB"),
              ),
            ],
          ),
          // Vertical divider
          const VerticalDivider(thickness: 1, width: 1, color: ColorConst.grey),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(double w, double h) {
    return Scaffold(
      backgroundColor: ColorConst.appBackground,
      extendBody: true, // Allows body to extend behind the navbar
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        // Using dynamic margins based on screen width/height as requested
        margin: EdgeInsets.only(
          left: w * 0.04, // approx 16/400
          right: w * 0.04,
          bottom: h * 0.025, // approx 20/800
        ),
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorConst.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorConst.white,
            selectedItemColor: ColorConst.black,
            unselectedItemColor: ColorConst.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            selectedLabelStyle:
                GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageConst.home)),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageConst.wallet)),
                label: "Wallet",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageConst.support)),
                label: "Support",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageConst.ib)),
                label: "IB",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
