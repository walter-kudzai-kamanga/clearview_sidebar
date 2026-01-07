import 'package:clearview_sidebar/examplePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab and Eats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Segoe UI',

        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const sidebar(),
    );
  }
}

class sidebar extends StatefulWidget {
  final VoidCallback? onMenuTap;
  const sidebar({super.key, this.onMenuTap});

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  String selected = "Inventory"; // active page
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),

      body: _getCurrentPage(),
    );
  }

  // ---------------------- MAIN PAGE CONTENT ----------------------
  Widget _getCurrentPage() {
    switch (selected) {
      case "Inventory":
        return Inventory(
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        );
      case "Production":
        return Production(
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        );
      default:
        return Container();
    }
  }

  // ---------------------- DRAWER CONTENT ----------------------
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      width: 150,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.person, size: 40, color: Colors.blue[800]),
          ),

          const SizedBox(height: 4),
          const Text(
            "Admin",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Dashboard",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 15),

          // MENU
          _menuItem(Icons.dashboard, "Dashboard"),
          _menuItem(Icons.shopping_cart, "Point Of Sale"),
          _menuItem(Icons.attach_money, "Transactions"),
          _menuItem(Icons.analytics, "Analytics"),
          _menuItem(Icons.inventory_2, "Inventory"),

          _menuItem(Icons.local_shipping, "Suppliers"),
          _menuItem(Icons.factory, "Production"),
          _menuItem(Icons.sync_alt, "Transfers"),
          _menuItem(Icons.apartment, "Branches"),
          _menuItem(Icons.account_balance_wallet, "Finance"),
          _menuItem(Icons.people, "Users"),
          _menuItem(Icons.desktop_windows, "Screens"),
          _menuItem(Icons.settings, "Settings"),
          const Spacer(),

          // LOGOUT BUTTON
          _logoutItem(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ---------------------- MENU ITEM ----------------------
  Widget _menuItem(IconData icon, String label) {
    bool isActive = selected == label;

    return InkWell(
      onTap: () {
        setState(() => selected = label);
        Navigator.pop(context);
        switch (label) {
          case "Dashboard":
            Navigator.pushNamed(context, '/dashboard');
            break;
          case "Point Of Sale":
            Navigator.pushNamed(context, '/point-of-sale');
            break;
          case "Transactions":
            Navigator.pushNamed(context, '/transactions');
            break;
          case "Analytics":
            Navigator.pushNamed(context, '/analytics');
            break;
          case "Inventory":
            break;
          case "Suppliers":
            Navigator.pushNamed(context, '/suppliers');
            break;
          case "Production":
            break;
          case "Transfers":
            Navigator.pushNamed(context, '/transfers');
            break;
          case "Branches":
            Navigator.pushNamed(context, '/branches');
            break;
          case "Finance":
            Navigator.pushNamed(context, '/finance');
            break;
          case "Users":
            Navigator.pushNamed(context, '/users');
            break;
          case "Screens":
            Navigator.pushNamed(context, '/screens');
            break;
          case "Settings":
            Navigator.pushNamed(context, '/settings');
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue.withOpacity(0.08) : Colors.transparent,
          border: isActive
              ? const Border(left: BorderSide(color: Colors.blue, width: 4))
              : null,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 15,
              color: isActive ? Colors.blue : Colors.blue.shade800,
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? Colors.blue : Colors.black87,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------- LOGOUT ----------------------
  Widget _logoutItem() {
    return InkWell(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        child: Row(
          children: const [
            Icon(Icons.logout, color: Colors.red, size: 15),
            SizedBox(width: 16),
            Text(
              "Log Out",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
