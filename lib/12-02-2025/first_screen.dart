// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:state_management_project_smit/11-01-2025/second_screen.dart';
// import 'package:state_management_project_smit/12-02-2025/second_screen.dart';
// import 'package:state_management_project_smit/componants/button.dart';
//
// import 'numbers_provider.dart';
//
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});
//
//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }
//
// // List<int> numberList = [1,2,3,4];
//
// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<NumbersProvider>(
//       builder: (context,value,child) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.teal,
//             title: const Text('Provider Example'),
//           ),
//           floatingActionButton: GestureDetector(
//             onTap: () {
//               // int lastNumber = numberList.last.toInt();
//               // print('last number ------->$lastNumber');
//               // numberList.add(lastNumber+1);
//               value.addNumber();
//
//             },
//             child: Container(
//               height: 40,
//               width: 50,
//               decoration: BoxDecoration(
//                 color: Colors.teal,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           body: Column(
//             children: [
//               Text(
//                 value.numberList.last.toString(),
//                 style: TextStyle(fontSize: 40),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 height: 400,
//                 child: ListView.builder(
//                     itemCount: value.numberList.length,
//                     itemBuilder: (context, index) {
//                       return Center(
//                         child: Text(
//                           value.numberList[index].toString(),
//                           style: TextStyle(fontSize: 30),
//                         ),
//                       );
//                     }),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Button(
//                   title: 'Next Screen',
//                   onTap: () {
//                     Navigator.push(
//                         context, MaterialPageRoute(builder: (context) =>
//                         SecondScreen(numbersList: value.numberList)));
//                   },
//                   isLoading: false,
//                   color: Colors.teal),
//             ],
//           ),
//         );
//       });
//   }
// }
