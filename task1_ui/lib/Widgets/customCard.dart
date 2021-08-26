import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  CustomTile(
      {required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageUrl),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.26,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline_rounded),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart_outlined)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.all(8),
    //   height: 160,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15),

    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Center(child: icon),
    //       Text(
    //         title,
    //         style: TextStyle(color: Colors.black38, fontSize: 30),
    //       ),
    //       Text(
    //         subtitle,
    //         style: TextStyle(
    //             color: Colors.black38,
    //             fontStyle: FontStyle.italic,
    //             fontSize: 18),
    //       ),
    //     ],
    //   ),
    // );
  }
}
