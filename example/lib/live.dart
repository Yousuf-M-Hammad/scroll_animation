// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         body: Center(
//           child: Builder(builder: (context) {
//             return ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                         builder: (_) => OrdersScreen(),
//                       ));
//                 },
//                 child: Text('data'));
//           }),
//         ),
//       ),
//     );
//   }
// }

// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: CustomScrollView(
//         slivers: [
//           const CupertinoSliverNavigationBar(
//             // middle: Text('الطلبات'),
//             border: null,
//             largeTitle: Text('الطلبات'),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(
//               height: 24.0,
//             ),
//           ),
//           for (var i = 0; i < Random().nextInt(10); i++) const OrderCard(),
//         ],
//       ),
//     );
//   }
// }

// class OrderCard extends StatelessWidget {
//   const OrderCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
//         child: Card(
//           color: Colors.white,
//           elevation: 10,
//           shadowColor: Colors.white24,
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const OrderDetailScreen(),
//                 ),
//               );
//             },
//             child: Padding(
//               padding: const EdgeInsetsDirectional.only(start: 22.2, end: 17.0),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(
//                       height: 19.0,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: const [
//                             Text(
//                               'Fuel',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                             Text(
//                               'Omak St, Khartoum',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: const [
//                             Icon(
//                               Icons.bolt_rounded,
//                               color: Color(0xff0CC361),
//                               size: 28,
//                             ),
//                             Text(
//                               'Instant',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 21.5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: const [
//                             Icon(
//                               Icons.invert_colors_on_rounded,
//                               color: Color(0xff0CC361),
//                               size: 28,
//                             ),
//                             Text(
//                               'Benzien',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: const [
//                             Text(
//                               '24',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                             Text(
//                               'Galoons',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: const [
//                             Text(
//                               '24500',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                             Text(
//                               'Cash',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xff041637),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OrderCanceled extends StatelessWidget {
//   const OrderCanceled({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: const Color(0xffFF4141),
//       elevation: 0.0,
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               child: Center(
//                 child: FractionalTranslation(
//                   translation: const Offset(0.0, 0.2),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       Icon(
//                         Icons.cancel_outlined,
//                         color: Colors.white,
//                         size: 100,
//                       ),
//                       Text(
//                         'تم الغاء الطلب',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 ButtonReasonCancel(
//                   title: 'اكمال الطلب',
//                   color: Colors.white,
//                   icon: Icons.message_sharp,
//                   onTap: () {},
//                 ),
//                 ButtonReasonCancel(
//                   title: 'تم الالغاء بطلب العميل',
//                   color: Colors.white,
//                   icon: Icons.message_sharp,
//                   onTap: () {},
//                 ),
//                 ButtonReasonCancel(
//                   title: 'سبب اخر',
//                   color: Colors.white,
//                   icon: Icons.message_sharp,
//                   onTap: () {},
//                 ),
//                 const SizedBox(
//                   height: 31.0,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ButtonReasonCancel extends StatefulWidget {
//   final String title;
//   final Color color;
//   final IconData? icon;
//   final bool showMargin;
//   final Function() onTap;
//   const ButtonReasonCancel({
//     Key? key,
//     required this.title,
//     required this.color,
//     this.icon,
//     this.showMargin = false,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   _ButtonReasonCancelState createState() => _ButtonReasonCancelState();
// }

// class _ButtonReasonCancelState extends State<ButtonReasonCancel> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: widget.color),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: InkWell(
//           onTap: () => widget.onTap(),
//           child: Center(
//             child: Text(
//               widget.title,
//               style: const TextStyle(
//                 color: Colors.red,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
