import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "flutter demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: height / 2.4,
          child: Image.network(
            'https://i.ibb.co/Y2CNM8V/new-york.jpg',
            height: height,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 2.4,
            width: width,
            color: Color(0xFF2D2C35),
          ),
        ),
        ScaffoldWidget()
      ],
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(30)));
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.ibb.co/Z1fYsws/profile-image.jpg'),
            ),
            onPressed: (){},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white, fontSize: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 29,
              ),
              Text("Hello Max"),
              SizedBox(
                height: 5,
              ),
              Text(
                "check the weather by the city",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 35,
              ),
              TextField(
                decoration: InputDecoration(
                    border: inputBorder,
                    enabledBorder: inputBorder,
                    focusedBorder: inputBorder,
                    hintText: "search city",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My location',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.more_horiz, color: Colors.white, size: 35)
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var location in locations)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black45,
                              BlendMode.darken,
                            ),
                            child: Image.network(
                              location.imageUrl,
                              height: height * 0.35,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                location.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(location.timing),
                              SizedBox(height: 40),
                              Text(
                                location.temperature.toString() + '°',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 50),
                              Text(location.weather),
                            ],
                          )
                        ],
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Location {
  final String text;
  final String timing;
  final int temperature;
  final String weather;
  final String imageUrl;

  Location({
    this.text,
    this.timing,
    this.temperature,
    this.weather,
    this.imageUrl,
  });
}

final locations = [
  Location(
    text: 'New York',
    timing: '10:44 am',
    temperature: 15,
    weather: 'Cloudy',
    imageUrl: 'https://i.ibb.co/df35Y8Q/2.png',
  ),
  Location(
    text: 'San Francisco',
    timing: '7:44 am',
    temperature: 6,
    weather: 'Raining',
    imageUrl: 'https://i.ibb.co/7WyTr6q/3.png',
  ),
];
