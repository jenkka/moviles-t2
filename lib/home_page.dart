// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// bool foodPressed = false, infoPressed = false, locationPressed = false;

enum Rating { none, like, dislike }

bool foodPressed = false, infoPressed = false, locationPressed = false;
Rating ratingState = Rating.none;
int rating = 99;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenidos al ITESO'),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/iteso.jpeg'),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ITESO: Universidad Jesuita de Guadalajara',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() => foodPressed = !foodPressed);

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          'Puedes encontrar comida en sus cafeterías.',
                        ),
                      ),
                    );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.food_bank,
                      size: 60,
                      color: foodPressed ? Colors.indigo : Colors.black,
                    ),
                    Text(
                      'Comida',
                      style: TextStyle(
                        color: foodPressed ? Colors.indigo : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() => infoPressed = !infoPressed);

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          'Puedes pedir información en rectoría.',
                        ),
                      ),
                    );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.info,
                      size: 60,
                      color: infoPressed ? Colors.indigo : Colors.black,
                    ),
                    Text(
                      'Información',
                      style: TextStyle(
                        color: infoPressed ? Colors.indigo : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() => locationPressed = !locationPressed);

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          'Se encuentra ubicada en Periférico Sur 8585.',
                        ),
                      ),
                    );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: 60,
                      color: locationPressed ? Colors.indigo : Colors.black,
                    ),
                    Text(
                      'Ubicación',
                      style: TextStyle(
                        color: locationPressed ? Colors.indigo : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'El Instituto Tecnológico y de Estudios Superiores de Occidente (ITESO) Es una universidad privada con sede en la ciudad de Tlaquepaque, Jalisco, México. Esta institución educativa fue fundada en el año de 1957 y pertenece al Sistema Universitario Jesuita (SUJ) que a su vez forma parte de la Compañía de Jesús. En este sentido la universidad también es nombrada como la Universidad Jesuita de Guadalajara pero es conocida comúnmente como el ITESO.',
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (ratingState == Rating.like) {
                      ratingState = Rating.none;
                      rating--;
                    } else if (ratingState == Rating.none) {
                      ratingState = Rating.like;
                      rating++;
                    } else {
                      ratingState = Rating.like;
                      rating += 2;
                    }
                  });
                },
                child: Icon(
                  Icons.thumb_up,
                  size: 40,
                  color:
                      ratingState == Rating.like ? Colors.indigo : Colors.black,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (ratingState == Rating.dislike) {
                      ratingState = Rating.none;
                      rating++;
                    } else if (ratingState == Rating.none) {
                      ratingState = Rating.dislike;
                      rating--;
                    } else {
                      ratingState = Rating.dislike;
                      rating -= 2;
                    }
                  });
                },
                child: Icon(
                  Icons.thumb_down,
                  size: 40,
                  color: ratingState == Rating.dislike
                      ? Colors.indigo
                      : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Puntuación",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            rating.toString(),
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
