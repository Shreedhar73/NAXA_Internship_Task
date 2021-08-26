import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:task2_apicall/Models/Person.dart';
import 'package:task2_apicall/Services/Services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteServices _remoteServices = new RemoteServices();

  @override
  void initState() {
    super.initState();

    _remoteServices.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Hi......",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: FutureBuilder<Map<String, dynamic>>(
                      future: _remoteServices.getAllData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Person persons = Person.fromJson(snapshot.data);

                          return Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  elevation: 25,
                                  color: Colors.black12,
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: Icon(
                                            Icons.home_outlined,
                                            size: 35,
                                          ),
                                        ),
                                        Text(
                                          "Pages: " + persons.page.toString(),
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text(
                                            "Per page: " +
                                                persons.perPage.toString(),
                                            style: TextStyle(fontSize: 20)),
                                        Text(
                                            "Total: " +
                                                persons.total.toString(),
                                            style: TextStyle(fontSize: 20)),
                                        Text(
                                            "Total_Pages: " +
                                                persons.totalPages.toString(),
                                            style: TextStyle(fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                height: 25,
                                child: Text(
                                  "Peoples Details: ",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.blueGrey.shade100,
                                  child: ListView.builder(
                                      itemCount: persons.data.length,
                                      itemBuilder: (BuildContext, index) {
                                        final data = persons.data[index];
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          elevation: 25,
                                          color: Colors.yellow.shade100,
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Center(
                                                  child: CachedNetworkImage(
                                                    imageUrl: data.avatar,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                                Text(
                                                  "id: " + data.id.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                    "Email " +
                                                        data.email.toString(),
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                                Text(
                                                    "FirstName " +
                                                        data.firstName,
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                                Text(
                                                    "Last Name: " +
                                                        data.lastName,
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
