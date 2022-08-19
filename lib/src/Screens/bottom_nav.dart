import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventracom/src/controllers/controller.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    controller.apiCall();
    return Scaffold(
      body: GetBuilder<Controller>(builder: (_) {
        return controller.page();
      }),
      bottomNavigationBar: GetBuilder<Controller>(
        builder: (_) {
          return AnimatedBottomNavigationBar(
            icons: [Icons.person, Icons.home, Icons.settings],
            activeIndex: controller.index,
            backgroundColor:
                controller.isDark ? Color(0xff64FEDA) : Colors.black,
            activeColor: Colors.red,
            inactiveColor: controller.isDark ? Colors.black : Colors.white,
            iconSize: 30,
            gapWidth: MediaQuery.of(context).size.width * 0.01,
            // leftCornerRadius: 15,
            // rightCornerRadius: 15,
            onTap: (index) {
              controller.changePage(index);
              print(controller.index);
            },
            //other params
          );
        },
      ),
    );
  }
}
