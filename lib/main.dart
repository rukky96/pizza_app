import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyProvider extends ChangeNotifier {
  final List _count = [];
  List get getCount => _count;

  increaseCount() {
    getCount.add(1);
    notifyListeners();
  }

  decreaseCount() {
    getCount.removeAt(-1);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Pizza'),
              Text('Cairo'),
              Icon(Icons.favorite_outline, color: Colors.black)
            ],
          ),
        ),
        Positioned(
          top: 200,
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.45,
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return Container(
                  margin: index.isEven
                      ? EdgeInsets.only(top: 50)
                      : EdgeInsets.only(bottom: 50),
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: MediaQuery.of(context).size.width * 0.44,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width * 0.44,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 238, 226),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(colors: [
                                  Colors.white,
                                  Colors.grey,
                                ], stops: [
                                  0.85,
                                  1.0
                                ])),
                          ),
                        ),
                        Positioned(
                          right: 3,
                          top: 15,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.07,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1),
                              color: const Color.fromARGB(255, 242, 238, 226),
                            ),
                            child: const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: Colors.orange),
                              child: const Text('Order now',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ))
                      ],
                    ),
                  ),
                );
              })),
        ),
      ],
    ));
  }
}

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //This container contains the product details and other text
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.5,

            //This container contains the pizza at the top center
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.49, 160),
                      bottomRight: Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.49, 160))),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.grey),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.grey),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.grey),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.grey),
                        shape: BoxShape.circle),
                  ),
                  //Put the pizza in this white container
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 3, color: Colors.grey),
                        shape: BoxShape.circle),
                  )
                ]),
              ),
            ))
      ]),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            bottom: 0,
            child: Container(
              color: const Color.fromARGB(255, 213, 217, 221),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/images/pic2.png")),
                  const SizedBox(height: 10),
                  const Text(
                    'Pizza for you',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.electric_bolt,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        Text(
                          'Everyday new pizza\n eat fresh pizza',
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[400],
                      minimumSize: const Size(350, 60),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Shop();
                      }));
                    }),
                    child: const Text(
                      'Add To Products',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[200],
                      minimumSize: const Size(350, 60),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PizzaDetails();
                      }));
                    }),
                    child: const Text(
                      'Sign up with Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: MediaQuery.of(context).size.height * 0.418,
            child: const Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage("assets/images/pic1.png")))),
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: 50,
            right: 15,
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite, color: Colors.redAccent),
            )),
      ]),
    );
  }
}
