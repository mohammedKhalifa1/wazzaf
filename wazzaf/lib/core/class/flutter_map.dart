// class UserLocation {
//   final double latitude;
//   final double longitude;
//   final String address;

//   const UserLocation({
//     required this.latitude,
//     required this.longitude,
//     required this.address,
//   });
// }

// location controller ===============================

// import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class LocationController extends ChangeNotifier {
//   LatLng? _currentLatLng;
//   String _address = '';

//   LatLng? get currentLatLng => _currentLatLng;
//   String get address => _address;

//   /// get user current location
//   Future<void> initLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     _currentLatLng = LatLng(position.latitude, position.longitude);
//     await _updateAddress();
//     notifyListeners();
//   }

//   /// when map moves
//   void updateLatLng(LatLng latLng) {
//     _currentLatLng = latLng;
//     notifyListeners();
//   }

//   /// reverse geocoding
//   Future<void> _updateAddress() async {
//     if (_currentLatLng == null) return;

//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       _currentLatLng!.latitude,
//       _currentLatLng!.longitude,
//     );

//     Placemark place = placemarks.first;
//     _address =
//         "${place.street}, ${place.locality}, ${place.country}";
//   }

//   /// confirm location
//   UserLocation confirmLocation() {
//     return UserLocation(
//       latitude: _currentLatLng!.latitude,
//       longitude: _currentLatLng!.longitude,
//       address: _address,
//     );
//   }
// }



//UI Screen===================


// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart';

// class PickLocationScreen extends GetView<LocationController> {
//   const PickLocationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(LocationController());

//     return Scaffold(
//       appBar: AppBar(title: const Text('اختر موقعك')),
//       body: Obx(() {
//         if (controller.isLoading.value ||
//             controller.currentLatLng.value == null) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return Stack(
//           children: [
//             FlutterMap(
//               options: MapOptions(
//                 initialCenter: controller.currentLatLng.value!,
//                 initialZoom: 16,
//                 onPositionChanged: (pos, _) {
//                   if (pos.center != null) {
//                     controller.updateLatLng(pos.center!);
//                   }
//                 },
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate:
//                       'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   userAgentPackageName: 'com.example.app',
//                 ),
//               ],
//             ),

//             /// center marker
//             const Center(
//               child: Icon(
//                 Icons.location_pin,
//                 size: 50,
//                 color: Colors.red,
//               ),
//             ),

//             /// address box
//             Positioned(
//               bottom: 90,
//               left: 16,
//               right: 16,
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Obx(
//                     () => Text(
//                       controller.address.value,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             /// confirm button
//             Positioned(
//               bottom: 20,
//               left: 16,
//               right: 16,
//               child: ElevatedButton(
//                 onPressed: () {
//                   final location = controller.confirmLocation();
//                   Get.back(result: location);
//                 },
//                 child: const Text('تأكيد الموقع'),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
