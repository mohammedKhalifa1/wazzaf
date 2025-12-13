import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/controller/my_home.dart';
import 'package:wazzaf/core/class/text_style.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomePageController>();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.40),
                blurRadius: 13,
                spreadRadius: 0.5,
                offset: Offset(0, 0), // shadow direction
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: GetBuilder<HomePageController>(
              builder: (controller) {
                return BottomAppBar(
                  // color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      textDirection: TextDirection.rtl,
                      children: [
                        ...List.generate(
                          5,
                          (index) => _BottomItem(
                            controller.pages[index].icon,
                            controller.pages[index].title,
                            () {
                              controller.changePage(index);
                            },

                            controller.isSelected == index ? true : false,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        body: GetBuilder<HomePageController>(
          builder: (controller) =>
              controller.pages.elementAt(controller.isSelected).widget,
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  const _BottomItem(this.icon, this.title, this.onTap, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        //   mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black,
            size: 20,
            // size: width * 0.06,
          ),
          Spacer(),
          Text(title, style: AppTextStyle.textBottomNavigation),
        ],
      ),
    );
  }
}
