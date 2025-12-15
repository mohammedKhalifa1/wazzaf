import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/controller/my_request_controller.dart';
import 'package:wazzaf/core/class/text_style.dart';

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({super.key});

  @override
  State<MyRequestPage> createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   print("Loading");
    // });
    print("on init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<MyRequestControllerImp>();
    return GetBuilder<MyRequestControllerImp>(
      builder: (controller) => Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("طلباتي", style: AppTextStyle.bold),
          RowWidget(con: controller),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),

              child: controller.isSelected == 0
                  ? CurrentRequest()
                  : PreviousRequest(),
            ),
          ),
        ],
      ),
    );
  }
}

// ========my request page one =======
class CurrentRequest extends StatelessWidget {
  const CurrentRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Center(child: Text("current request"))],
    );
  }
}

// ========my request page two =======
class PreviousRequest extends StatelessWidget {
  const PreviousRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text("Previous Request")]);
  }
}

class RowWidget extends StatelessWidget {
  final MyRequestControllerImp con;

  const RowWidget({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: con.myRequestPage.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    con.changeSelected(index);
                  },
                  child: Column(
                    children: [
                      Text(con.myRequestPage[index].title),
                      const SizedBox(height: 5),
                      Container(
                        height: 0.5,
                        color: con.isSelected != index ? null : Colors.black,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
