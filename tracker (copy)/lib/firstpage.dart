// import 'package:flutter/material.dart';
// // import 'package:tracker/trackPage1.dart';
// import 'package:tracker/trackpage1.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     expenseTrack();
//   }

//     Future<void>expenseTrack()async{
//     Future.delayed(Duration(seconds: 2),(){
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ExpensePage1()));
//     });  
//     }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[100],
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               // margin: EdgeInsets.only(left: 100),
//               alignment: Alignment.center,
//               width: 300,
//               height: 300,
//               child: Image.asset("./images/coin.jpg"),
//             ),
//             Text("EXPENSE TRACKER",
//             style: TextStyle(fontSize: 25,color: Colors.green[50]),)
//           ],
//         ),
//       ),
//     );
//   }
// }