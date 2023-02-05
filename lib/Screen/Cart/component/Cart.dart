import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider_controller.dart';

class Cart extends StatelessWidget {
  Cart({
    Key? key,
    required this.category,
    required this.body,
    required this.image,
    required this.press,
    required this.counter,
  }) : super(key: key);

  final String category, image;
  Widget body;
  int counter;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 15, right: 20),
      child: GestureDetector(
        onTap: press,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, 10),
                    blurRadius: 5.0,
                    spreadRadius: 0)
              ]),
          width: 360,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                ListTile(
                  leading: Container(
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  title: Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                  subtitle: body,


                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: InkWell(
                            onTap: () => context
                                .read<MyProvider>()
                                .removeCounter(),
                            child: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).primaryColor,
                      ),
                          )),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(bottom: 2),
                        width: 90,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () => context
                                    .read<MyProvider>()
                                    .dicrementCounter(),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                )),
                           Consumer<MyProvider>(builder:(context, value, child) => Text("${value.counter}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                           ),
                            InkWell(
                              onTap: () => Provider.of<MyProvider>(context,listen: false)
                                  .incrementCounter(),
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
