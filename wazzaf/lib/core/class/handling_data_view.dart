import 'package:flutter/material.dart';
import 'package:wazzaf/core/class/statues_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatuesRequest status;
  final Widget child;

  const HandlingDataView({
    super.key,
    required this.status,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case StatuesRequest.loading:
        return const Expanded(
          child: Center(child: CircularProgressIndicator()),
        );

      case StatuesRequest.success:
        return child;

      case StatuesRequest.noData:
        return const Expanded(child: Center(child: Text("لا توجد بيانات")));

      case StatuesRequest.noInternet:
        return const Expanded(
          child: Center(child: Text("لا يوجد اتصال بالإنترنت")),
        );

      case StatuesRequest.noToken:
        return const Expanded(child: Center(child: Text("يرجى تسجيل الدخول")));

      case StatuesRequest.error:
      case StatuesRequest.failure:
        return const Expanded(
          child: Center(child: Text("حدث خطأ ما، حاول لاحقًا")),
        );

      case StatuesRequest.none:
        return const Expanded(child: SizedBox.shrink());
    }
  }
}
