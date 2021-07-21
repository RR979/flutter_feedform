import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.orange.shade50,
          appBar: AppBar(
            backgroundColor: Colors.orange.shade200,
            title: Text('Feedback'),
          ),
          body: form(),
        ),
      ),
    );

class form extends StatefulWidget {
  //const form({ Key? key }) : super(key: key);

  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  double score = 0;
  int qno = 0;
  int r = 0;
  bool resultscreen = false;
  var fb = [Colors.red, Colors.yellow, Colors.green];
  var finmessage = [
    'We are sorry for your inconvenience',
    'Hope we serve you better next time',
    'We hope you come back next time'
  ];
  var arr = [
    'How do you like our Service ?',
    'How was the lighting ?',
    'How do you appreciate the Sanitation ?',
    'How was the Sound Quality ?',
    'Would you recommend us to your friends ?',
    'How likely are you to visit us again ?'
  ];
  double slidervalue = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SizedBox(
          height: 100.0,
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: !resultscreen
                ? Text(
                    arr[qno],
                    style: TextStyle(
                      fontFamily: 'Roboto Condensed',
                      fontSize: 20.0,
                    ),
                  )
                : Text(
                    finmessage[r],
                    style: TextStyle(
                      fontFamily: 'Roboto Condensed',
                      fontSize: 20.0,
                      color: fb[r],
                    ),
                  ),
          ),
        ),
        Expanded(
            child: !resultscreen
                ? Slider(
                    value: slidervalue,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: slidervalue.round().toString(),
                    onChanged: (double newrat) {
                      setState(() {
                        slidervalue = newrat;
                      });
                    })
                : Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      child: Image.asset('images/emoji$r.png'),
                    ),
                  )),
        Center(
            child: MaterialButton(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: !resultscreen ? Text('Next') : Text('Again'),
                ),
                textColor: Colors.white,
                height: 20.0,
                onPressed: !resultscreen
                    ? () {
                        setState(() {
                          score = score + slidervalue;
                          slidervalue = 3;
                          qno++;
                          if (qno == 6) {
                            setState(() {
                              resultscreen = true;
                              if (score >= 0 && score <= 10) {
                                r = 0;
                              } else if (score > 10 && score <= 20) {
                                r = 1;
                              } else
                                r = 2;
                            });
                          }
                        });
                      }
                    : () {
                        setState(() {
                          resultscreen = false;
                          qno = 0;
                          score = 0;
                        });
                      })),
        Expanded(
            child: SizedBox(
          height: 20.0,
        ))
      ],
    );
  }
}
