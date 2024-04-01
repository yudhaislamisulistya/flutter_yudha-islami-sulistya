// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Halo"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: BeveledRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {},
//               child: const Text("Save"),
//             ),
//             const Text(
//               "Halo",
//               style: TextStyle(
//                 fontSize: 32.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   String? a;
// //   var s = "Halo";
// //   Color? colorSet = Colors.black;
// //   @override
// //   void initState() {
// //     setState(() {
// //       a = "Selamat Datang di Belajar Flutter";
// //     });
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //       ),
// //       body: Center(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text("Data A : ${a!}"),
// //             Text("Data S : $s"),
// //             Container(
// //               height: 100,
// //               width: 100,
// //               decoration: BoxDecoration(
// //                 color: colorSet,
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   a = "Halo";
// //                   s = "Selamat Datang di Belajar Flutter";
// //                   colorSet = Colors.red;
// //                 });
// //               },
// //               child: const Text("Change"),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   a = "Selamat Datang di Belajar Flutter";
// //                   s = "Halo";
// //                   colorSet = Colors.black;
// //                 });
// //               },
// //               child: const Text("Undo"),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: ThemeData.light(),
      home: const MyHomePage(title: 'Alta - Latihan'),
      routes: {
        // '/dashboard': (context) => const DashboardView(),
        // '/contact': (context) => const ContactView(),
        // '/profile': (context) => const ProfileView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> listBorderColor = [Colors.red, Colors.green, Colors.yellow, Colors.blue];
  List<Color> listBackgroundColor = [Colors.brown, Colors.green, Colors.red, Colors.black];
  int randomIntBorder = 0;
  int randomIntBackground = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: listBackgroundColor[randomIntBackground > 3 ? 0 : randomIntBackground],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: Border.all(
                  width: 8.0,
                  color: listBorderColor[randomIntBorder > 3 ? 0 : randomIntBorder],
                ),
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.shuffle),
              label: const Text("Acak"),
              onPressed: () {
                Random random = Random();
                setState(() {
                  randomIntBorder = random.nextInt(100);
                  randomIntBackground = random.nextInt(100);
                  print(randomIntBorder);
                  print(randomIntBackground);
                });
                // 10 Data -> Collection -> 0 ... 9
                // randomIntBorder dan randomIntBackground akan mengacak
                // angka 0 - 4
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class DashboardView extends StatelessWidget {
//   const DashboardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Text("Halo 1"),
//             Text("Halo 1"),
//             Text("Halo 1"),
//             Text("Halo 1"),
//             Text("Halo 1"),
//           ],
//         ),
//       ),
//     );
//   }
// }
