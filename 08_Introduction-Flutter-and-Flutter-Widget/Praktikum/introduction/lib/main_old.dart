import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - Introduction'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          ProfileList(),
          ProfileList(),
          ProfileList(),
          ProfileList(),
          ProfileList(),
          Container(
            height: 160.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1533050487297-09b450131914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
          // ContainerCustom(
          //   title: "Box 1",
          //   color: Colors.red,
          // ),
          // ContainerCustom(
          //   title: "Box 2",
          // ),
          // ContainerCustom(
          //   title: "Box 3",
          // ),
          // ContainerCustom(
          //   title: "Box 4",
          //   color: Colors.orange,
          // ),
          // ContainerCustom(
          //   title: "Box 5",
          //   color: Colors.purple,
          // ),
        ],
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
        ),
        title: const Text("Joko"),
        subtitle: const Text("Presiden"),
        trailing: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
      ),
    );
  }
}

// class ContainerCustom extends StatelessWidget {
//   final String title;
//   final Color? color;
//   const ContainerCustom({super.key, required this.title, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         bottom: 10.0,
//       ),
//       height: 100,
//       width: 100,
//       decoration: BoxDecoration(
//         color: color ?? Colors.blue,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(
//           top: 35.0,
//         ),
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
