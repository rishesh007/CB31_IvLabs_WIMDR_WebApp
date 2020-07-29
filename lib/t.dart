// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateRoute: (settings) {
//         if (settings.name == PassArgumentsScreen.routeName) {
//           final ScreenArguments args = settings.arguments;
//           return MaterialPageRoute(
//             builder: (context) {
//               return PassArgumentsScreen(
//                 title: args.title,
//                 message: args.message,
//               );
//             },
//           );
//         }
//         assert(false, 'Need to implement ${settings.name}');
//         return null;
//       },
//       title: 'Navigation with Arguments',
//       home: HomeScreen(),
//       routes: {
//         ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
//       },
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             RaisedButton(
//               child: Text("Navigate to screen that extracts arguments"),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   ExtractArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Extract Arguments Screen',
//                     'This message is extracted in the build method.',
//                   ),
//                 );
//               },
//             ),
//             RaisedButton(
//               child: Text("Navigate to a named that accepts arguments"),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   PassArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Accept Arguments Screen',
//                     'This message is extracted in the onGenerateRoute function.',
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ExtractArgumentsScreen extends StatelessWidget {
//   static const routeName = '/extractArguments';

//   @override
//   Widget build(BuildContext context) {
//     final ScreenArguments args = ModalRoute.of(context).settings.arguments;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(args.title),
//       ),
//       body: Center(
//         child: Text(args.message),
//       ),
//     );
//   }
// }

// class PassArgumentsScreen extends StatelessWidget {
//   static const routeName = '/passArguments';

//   final String title;
//   final String message;

//   const PassArgumentsScreen({
//     Key key,
//     @required this.title,
//     @required this.message,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(message),
//       ),
//     );
//   }
// }

// class ScreenArguments {
//   final String title;
//   final String message;

//   ScreenArguments(this.title, this.message);
// }
