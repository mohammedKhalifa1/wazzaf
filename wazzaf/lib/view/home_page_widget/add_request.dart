import 'package:flutter/material.dart';
import 'package:wazzaf/core/class/text_style.dart';

import 'add_request_widget.dart/step_progress.dart';

class AddRequestPage extends StatelessWidget {
  const AddRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(child: Text("اضافة طلب")),
        StepProgress(currentStep: 1),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextAddRequest(text: 'اسم الخدمة*'),
              CustomTextField(hint: 'ابحث عن خدمة'),
              CustomTextAddRequest(text: "وصف المشكلة*"),

              CustomTextField(
                hint: "اضافة تفاصيل مهمتك متل احتاج الى سباك",
                hight: 150,
              ),
              CustomTextAddRequest(text: "اضافة صورة / فيديو*"),
              _Custom(),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBottom(
                  onPressed: () {},
                  text: "التالي",
                  color: AppTextStyle.bottomColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomBottom extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String text;
  final VoidCallback onPressed;
  const CustomBottom({
    super.key,
    this.height,
    this.width,
    this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: height ?? 20,
          vertical: width ?? 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _Custom extends StatelessWidget {
  const _Custom();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Row(
          children: [
            Icon(Icons.photo_filter, color: Colors.blue),
            Text("اضافة ملف", style: AppTextStyle.lightAddRequest),
          ],
        ),
      ),
    );
  }
}

class CustomTextAddRequest extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomTextAddRequest({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textDirection: TextDirection.rtl,
        style: style ?? AppTextStyle.lightAddRequest,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final double? hight;
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 40,
      child: TextFormField(
        maxLines: 6,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 12),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          counterStyle: TextStyle(fontSize: 3),
          hintText: hint,
          isDense: true,
          hintStyle: TextStyle(fontSize: 12),
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
