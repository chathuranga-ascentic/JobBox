import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onValueSelected;
  final Color backgroundColor;
  final bool isrehabProcess;
  final int currentSelectedIndex;

  const BottomNavBar(
      {Key? key,
      required this.onValueSelected,
      this.backgroundColor = whiteColor,
      this.isrehabProcess = false,
      this.currentSelectedIndex = 0})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: widget.backgroundColor,
      elevation: 5.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined, size: 35.0),
          label: 'Job Listing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit, size: 35.0),
          label: 'Applied Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 35.0),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: atomicTangerinColor,
      unselectedItemColor: nobelColor,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onValueSelected(index);
      },
    );
  }
}
