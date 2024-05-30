import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyExample(),
    );
  }
}

class MyExample extends StatefulWidget {
  const MyExample({super.key});

  @override
  _MyExampleState createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
  int _selectedIndex = 0; //default index
  static const String basePath = "assets/images";
  static const String accountImage = "$basePath/account.png";

  final List<Widget> _widgetOptions = [
    const Text('Home'),
    const Text('Account'),
    const Text('Leaves'),
    const Text('Loyalty'),
    const Text('Requests'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedIconSize: 15,
        selectedIconSize: 20,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.top,
        // gradient: LinearGradient(
        //   colors: [Colors.pink, Colors.yellow],
        // ),
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
           // assetsImagePath: accountImage,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Account',
           //icon: Icons.account_box_outlined,
            assetsImagePath: accountImage,
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: 'Leaves',
            icon: Icons.calendar_today_outlined,
            // assetsImagePath: accountImage,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Loyalty',
            icon: Icons.card_giftcard_rounded,
            assetsImagePath: accountImage,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Requests',
           // icon: Icons.list,
            assetsImagePath: accountImage,
            isAssetsImage: true,
          ),
        ],
      ),
    );
  }
}
