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

  void resetCount() {
    setState(() {
      count = 0;
      count2 = 0;
      print(count);
      print(count2);
    });
  }

  bool get isEmpty => count == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              resetCount();
            },
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
      backgroundColor: Colors.green,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onDoubleTap: () {
                                isEmpty ? null : decrementCount();
                              },
                              onTap: () {
                                setCount1();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Time 1',
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onDoubleTap: () {
                              isEmpty ? null : decrementCount2();
                            },
                            onTap: () {
                              setCount2();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Time 2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  count2.toString(),
                                  style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ])
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
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Time 1',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                count.toString(),
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 25,
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
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Time 2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  count2.toString(),
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
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
