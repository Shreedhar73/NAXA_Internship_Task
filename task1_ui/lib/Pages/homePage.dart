import 'package:flutter/material.dart';
import 'package:task1_ui/Widgets/customCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //first container for back button, Vegetables
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                          SizedBox(
                            height: 70,
                          )
                        ],
                      ),
                      Text(
                        "Vegetables",
                        style: TextStyle(fontSize: 30, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),

              //Second Container For Search BOX
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Search ",
                        fillColor: Colors.white70),
                  ),
                ),
              ),

              //Third Container For Chips
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Chip(
                            label: Text("Cabbage and lettuce(12)"),
                            deleteIcon: Icon(Icons.delete),
                            avatar: Icon(Icons.check_sharp),
                            backgroundColor: Colors.purpleAccent,
                          ),
                          Chip(
                            label: Text("Cucumber(12)"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Chip(label: Text("Radish and carrot(54)")),
                          Chip(
                            label: Text("Brinjal(8)"),
                          ),
                          Chip(
                            label: Text("Onions(11)"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //4th Container for Items
              Container(
                child: Column(
                  children: [
                    CustomTile(
                      title: "Cauli Flower",
                      subtitle: "160RS / per kg",
                      imageUrl:
                          "https://images.unsplash.com/photo-1566842600175-97dca489844f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
                    ),
                    CustomTile(
                      title: "Brocoli",
                      subtitle: "160RS / per kg",
                      imageUrl:
                          "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=518&q=80",
                    ),
                    CustomTile(
                      title: "Carrots",
                      subtitle: "160RS / per kg",
                      imageUrl:
                          "https://images.unsplash.com/photo-1445282768818-728615cc910a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                    ),
                    CustomTile(
                      title: "Tomato",
                      subtitle: "160RS / per kg",
                      imageUrl:
                          "https://images.unsplash.com/photo-1553395572-0ef353a212bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Bottom Nav Bar
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.window_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Account",
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
