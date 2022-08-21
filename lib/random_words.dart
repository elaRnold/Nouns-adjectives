import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  String _theState = "";
  int _actualWordType = 0;
  // ignore: unused_field
  int _seleccion = 0;
  int _contador = 0;
  Color color1 = Colors.blue;
  Color color2 = Colors.blue;
  final _random = Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void initState() {
    super.initState();
    setRandomWord();
  }

  void setRandomWord() {
    var option = next(0, 2);
    var randomItem = "";
    if (option == 0) {
      randomItem = (nouns.toList()..shuffle()).first;
      setState(() {
        _theState = randomItem;
        _actualWordType = 1;
      });
    } else {
      randomItem = (adjectives.toList()..shuffle()).first;
      setState(() {
        _theState = randomItem;
        _actualWordType = 2;
      });
    }
  }

  void _onPressed(_seleccion) {
    if (_actualWordType == _seleccion) {
      _contador+=10;
      setState(() {
      color1 = Colors.green;
      color2 = Colors.purple;
      });
      
          Timer(const Duration(milliseconds: 100), () {
            setState(() {
              color1 = Colors.purple;
              color2 = Colors.green;
            });
          });

          Timer(const Duration(milliseconds: 200), () {
            setState(() {
              color1 = Colors.green;
              color2 = Colors.purple;
            });
          });

          Timer(const Duration(milliseconds: 300), () {
            setState(() {
              color1 = Colors.purple;
              color2 = Colors.green;
            });
          });

          Timer(const Duration(milliseconds: 400), () {
            setState(() {
              color1 = Colors.blue;
              color2 = Colors.blue;
            });
          });

    Timer(const Duration(milliseconds: 600), () {
      setRandomWord();
    });

    } else {

      setState(() {
        color1 = Colors.red;
        color2 = Colors.red;
      });

          Timer(const Duration(milliseconds: 600), () {
            setState(() {
              color1 = Colors.blue;
              color2 = Colors.blue;
            });
            _onReset();
          });
    }
  }

  void _onReset() {
      setState(() {
        _seleccion = 0;
        _contador = 0;
        setRandomWord();
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Words"),
      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
  
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "Score: $_contador",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
                ),
            )
            ),


          SizedBox(
            child: Text(
              _theState,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.white
                ),
            )
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200.0,
                height: 200.0,

                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: color1,
                    onPrimary: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 5),
                    textStyle: const TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    onPressed: () => _onPressed(_seleccion = 1), 

                    child: const Text("Noun")),
              ),
              SizedBox(
                width: 200.0,
                height: 200.0,

                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: color2,
                    onPrimary: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 5),
                    textStyle: const TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                      ),

                    ),
                    onPressed: () => _onPressed(_seleccion = 2), 

                    child: const Text("Adjetive")),
              ),
            ],
          ),

          SizedBox(
            width: 200.0,
            height: 50.0,


            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 5),
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                  ),

                onPressed: () => _onReset(), 

                child: const Text("Reset")),
          ),
        ],
    )
    );
  }
  
}
