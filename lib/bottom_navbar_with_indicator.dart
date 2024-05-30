/// Documentation
///
/// bottom_navbar_with_indicator library.
library bottom_navbar_with_indicator;

import 'package:flutter/material.dart';

/// Documentation
///
/// enum's for indicator type.
enum IndicatorType { top, bottom }

/// Documentation
///
/// customer line indicator bottom navigation bar class.
class CustomLineIndicatorBottomNavbar extends StatelessWidget {
  final Color? backgroundColor;
  final List<CustomBottomBarItems> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unselectedFontSize;
  final Color? splashColor;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;
  final Function(int) onTap;
  final double selectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final LinearGradient? gradient;

  const CustomLineIndicatorBottomNavbar({
    super.key,
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.top,
    this.gradient,
  });

  /// body of nav bar.
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? bottomTheme.backgroundColor,
        gradient: gradient,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < customBottomBarItems.length; i++) ...[
              Expanded(
                child: CustomLineIndicatorBottomNavbarItems(
                  selectedColor: selectedColor,
                  unSelectedColor: unSelectedColor,
                  label: customBottomBarItems[i].label,
                  isAssetsImage: customBottomBarItems[i].isAssetsImage,
                  imagePath: customBottomBarItems[i].assetsImagePath,
                  icon: customBottomBarItems[i].icon,
                  unSelectedFontSize: unselectedFontSize,
                  selectedFontSize: selectedFontSize,
                  unselectedIconSize: unselectedIconSize,
                  selectedIconSize: selectedIconSize,
                  splashColor: splashColor,
                  currentIndex: currentIndex,
                  enableLineIndicator: enableLineIndicator,
                  lineIndicatorWidth: lineIndicatorWidth,
                  indicatorType: indicatorType,
                  index: i,
                  onTap: onTap,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

/// Documentation
///
/// custom bottom bar items model.
class CustomBottomBarItems {
  /// pass label with type .
  String label;

  /// pass icon with type IconData
  IconData? icon;

  /// pass image path is isAssetsImage = true
  String? assetsImagePath;

  /// pass the isAssetsImage true and sent assets image string.
  bool isAssetsImage;

  CustomBottomBarItems({
    this.icon,
    this.assetsImagePath,
    required this.isAssetsImage,
    required this.label,
  });
}

void alwaysAssert(bool condition, String message) {
  if (!condition) {
    throw AssertionError(message);
  }
}

/// Documentation
///
/// custom line indicator bottom navbar items stateless widget.
class CustomLineIndicatorBottomNavbarItems extends StatelessWidget {
  /// pass label with type .
  final String label;
  final bool isAssetsImage;
  final String? imagePath;

  /// pass icon with type IconData
  final IconData? icon;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unSelectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final double selectedFontSize;
  final Color? splashColor;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;

  const CustomLineIndicatorBottomNavbarItems({
    super.key,
    required this.label,
    required this.isAssetsImage,
    this.imagePath,
    this.icon,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.splashColor,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.top,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Theme.of(context).splashColor,
            onTap: () {
              onTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: enableLineIndicator
                    ? Border(
                        bottom: indicatorType == IndicatorType.bottom
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        bottomTheme.selectedItemColor!
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : const BorderSide(color: Colors.transparent),
                        top: indicatorType == IndicatorType.top
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        bottomTheme.selectedItemColor!
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : const BorderSide(color: Colors.transparent),
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              // width: 70,
              // height: 60,
              child: Column(
                children: [
                  isAssetsImage
                      ? Image.asset(
                          imagePath!,
                          height: currentIndex == index
                              ? selectedIconSize
                              : unselectedIconSize,
                          width: currentIndex == index
                              ? selectedIconSize
                              : unselectedIconSize,
                          color: currentIndex == index
                              ? selectedColor ?? bottomTheme.unselectedItemColor
                              : unSelectedColor,
                        )
                      : Icon(
                          icon!,
                          size: currentIndex == index
                              ? selectedIconSize
                              : unselectedIconSize,
                          color: currentIndex == index
                              ? selectedColor ?? bottomTheme.unselectedItemColor
                              : unSelectedColor,
                        ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '$label',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: currentIndex == index
                          ? selectedFontSize
                          : unSelectedFontSize,
                      color: currentIndex == index
                          ? selectedColor ?? bottomTheme.unselectedItemColor
                          : unSelectedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
