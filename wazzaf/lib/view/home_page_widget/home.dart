import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/controller/home_controller.dart';
import 'package:wazzaf/core/class/text_style.dart';
import 'package:wazzaf/core/customs/custom_text_field.dart';
import 'package:wazzaf/core/model/category.dart';

import '../../core/class/handling_data_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.find<HomeControllerImp>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RowAddress(con: con), // show address
          CustomTextField(hint: 'ابحث عن الخدمة'), // search about service
          Container(height: 150, color: Colors.red),
          Text("ما نوع الخدمة التي تريدها اليوم", style: AppTextStyle.bold),
          const SizedBox(height: 10),
          GetBuilder<HomeControllerImp>(
            builder: (controller) => HandlingDataView(
              //--------- show list of services
              status: con.statuesRequest,
              child: RowServes(categories: con.categories),
            ),
          ),
          Text("الأقسام", style: AppTextStyle.bold),

          GetBuilder<HomeControllerImp>(
            //--------- show list of categories with items
            builder: (controller) => HandlingDataView(
              status: con.statuesRequest,
              child: Expanded(
                child: ShowCategoryAndItem(categories: con.categories),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// show category and item in grid
class ShowCategoryAndItem extends StatelessWidget {
  final List<CategoryAndItemModel> categories;
  const ShowCategoryAndItem({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(category.category!, style: AppTextStyle.middleBold),

            const SizedBox(height: 8),

            Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: category.item!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, gridIndex) {
                  final item = category.item![gridIndex];

                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 10,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Text(item.itemName!, style: AppTextStyle.light),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class RowServes extends StatelessWidget {
  final List<CategoryAndItemModel> categories;
  const RowServes({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount: categories.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                    ),
                    Text(
                      categories[index].category!,
                      style: AppTextStyle.light,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowAddress extends StatelessWidget {
  final HomeControllerImp con;
  const RowAddress({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu_sharp),
          Text(
            "العنوان : ${con.address}",
            textDirection: TextDirection.rtl,
            style: AppTextStyle.light,
          ),
        ],
      ),
    );
  }
}

// class HandlingDataView extends StatelessWidget {
//   final StatuesRequest status;
//   final Widget widget;

//   const HandlingDataView({
//     super.key,
//     required this.status,
//     required this.widget,
//   });

//   @override
//   @override
//   Widget build(BuildContext context) {
//     switch (status) {
//       case StatuesRequest.loading:
//         return const Center(child: CircularProgressIndicator());

//       case StatuesRequest.success:
//         return widget;

//       case StatuesRequest.noData:
//         return const Center(child: Text("لا توجد بيانات"));

//       case StatuesRequest.noInternet:
//         return const Center(child: Text("لا يوجد اتصال بالإنترنت"));

//       case StatuesRequest.noToken:
//         return const Center(child: Text("يرجى تسجيل الدخول"));

//       case StatuesRequest.error:
//       case StatuesRequest.failure:
//         return const Center(child: Text("حدث خطأ ما، حاول لاحقًا"));

//       case StatuesRequest.none: // 🔥 مهم جدًا
//         return const SizedBox.shrink();
//     }
//   }
// }
