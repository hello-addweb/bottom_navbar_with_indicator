<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


# Bottom Navbar With Custom Indicator

```bottom_navbar_with_indicator```  is a Flutter package for a fully customizable bottom navigation bar with line indicators and gradient. ✨ ✨

It allows custom bottom bar with any Custom Widget (Stateless or Stateful).

Very smooth animations supporting Android, iOS & WebApp, DesktopApp.

## Show Cases

<div style="display:flex">
<img width="355" alt="alert2" src="https://github.com/hello-addweb/-TikTok-Flutter/assets/133627084/21647e09-5711-4704-80f8-4e8e84e781c7" width="200">
<img width="355" alt="alert2" src="https://github.com/hello-addweb/-TikTok-Flutter/assets/133627084/3ad5edf5-b81e-4b1f-8cfe-f4189268cbb7" width="200">
<div/>

## Why?

We build this package because we wanted to:

- have a complete customizable bottom bar with indicators.
- be able to add gradient color.
- pass dynamic icon with label.
- choose our own style like IconSize, FontSize, selectedColor,unSelectedColor, splashColor & call back function (onTap).

## Installation

Create a new project with the command

```yaml
flutter create MyApp
```

Add

```yaml
bottom_navbar_with_indicator: ...
```

to your `pubspec.yaml` of your flutter project.
**OR**
run

```yaml
flutter pub add bottom_navbar_with_indicator
```

in your project's root directory.

In your library add the following import:

```dart
import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Usage
## Usage without gradient:

```dart
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
```         

## Usage with gradient :

```dart
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
        gradient: LinearGradient(
          colors: [Colors.pink, Colors.yellow],
        ),
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
``` 


## Constructor

#### Basic

| Parameter           | Default           | Description                                      | Required |
|---------------------|:------------------|:-------------------------------------------------|:--------:|
| icon                | -                 | Icon of bottom bar widget.                       |   true   |
| label               | -                 | Label text of bottom bar.                        |   true   |
| label               | -                 | Label text of bottom bar.                        |   true   |
| selectedColor       | -                 | Bottom tab selected color.                       |  false   |
| unSelectedColor     | -                 | Bottom tab unselected color.                     |  false   |
| unSelectedFontSize  | 11                | Unselected tab font size                         |  false   |
| selectedFontSize    | 12                | Selected tab font size.                          |  false   |
| selectedIconSize    | 20                | Selected tab icon size.                          |  false   |
| unselectedIconSize  | 15                | UnSelected tab icon size.                        |  false   |
| splashColor         | -                 | On click splash color.	                          |  false   |
| currentIndex        | -                 | bottom nav bar list current index.	              |  false   |
| onTap               | -                 | On tap callback function to handle user click.	  |   true   |
| index               | -                 | List index.                                      |   true   |
| enableLineIndicator | false             | Set to true if showing line indicator.           |  false   |
| lineIndicatorWidth  | 3                 | Width of line indicator.                         |  false   |
| indicatorType       | IndicatorType.top | Indicator type for ex. top and bottom.	          |  false   |
| gradient            | -                 | Gradient property for enable gradient color.     |  false   |