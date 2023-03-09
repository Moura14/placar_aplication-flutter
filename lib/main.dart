import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int count2 = 0;

  void decrementCount() {
    setState(() {
      count--;
    });
  }

  void decrementCount2() {
    setState(() {
      count2--;
    });
  }

  void setCount1() {
    setState(() {
      count++;
    });
  }

  void setCount2() {
    setState(() {
      count2++;
    });
  }

  bool get isEmpty => count == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () {
                          isEmpty ? null : decrementCount();
                        },
                        onTap: () {
                          setCount1();
                        },
                        child: Container(
                          color: Colors.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Time 1',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                count.toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onDoubleTap: () {
                        isEmpty ? null : decrementCount2();
                      },
                      onTap: () {
                        setCount2();
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Time 2',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              count2.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () {
                          isEmpty ? null : decrementCount();
                        },
                        onTap: () {
                          setCount1();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Time 1',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                count.toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          ElevatedButton.icon(
                            label: const Text('Resetar placar'),
                            icon: const Icon(Icons.back_hand_sharp),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () {
                          isEmpty ? null : decrementCount2();
                        },
                        onTap: () {
                          setCount2();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Time 2',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  count2.toString(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
