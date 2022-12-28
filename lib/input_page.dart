import 'package:age_calculator/bottom_button.dart';
import 'package:age_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  DateTime _dateTime = DateTime.now();
  DateTime dateTime1 = DateTime.now();
  var y = int.parse(DateFormat('yyyy').format(DateTime.now()));
  var m = int.parse(DateFormat('MM').format(DateTime.now()));
  var d = int.parse(DateFormat('d').format(DateTime.now()));
  var d1 = 0, m1 = 0, y1 = 0;
  num day = 0, months = 0, years = 0;
  List days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  void _showDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value!;
        y1 = int.parse(DateFormat('yyyy').format(_dateTime));
        m1 = int.parse(DateFormat('MM').format(_dateTime));
        d1 = int.parse(DateFormat('dd').format(_dateTime));
      });
    });
  }

  void calculateAge() {
    if (d - d1 >= 0) {
      day = d - d1;
    } else {
      day = d + days[m1 - 1] - d1;
      m--;
    }
    if (m - m1 >= 0) {
      months = m - m1;
    } else {
      months = m + 12 - m1;
      y--;
    }
    years = y - y1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Center(
          child: Text('AGE CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableCard(
              colour: Color(0xFFFF80AB).withOpacity(0.4),
              cardChild: Column(
                children: [
                  Text(
                    'Your Birth Date:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Row(
                    children: [
                      Text(
                        'Choose here: ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      MaterialButton(
                        onPressed: () {
                          _showDatepicker();
                        },
                        elevation: 10,
                        child: Icon(
                          FontAwesomeIcons.calendar,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  ReusableCard(
                    colour: Colors.tealAccent.withOpacity(0.4),
                    cardChild: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        DateFormat('dd-MMM-yyyy').format(_dateTime),
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF50577A)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ReusableCard(
            colour: Color(0xFF829460).withOpacity(0.4),
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Today\'s Date: ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: ReusableCard(
                    colour: Colors.lightBlueAccent,
                    cardChild: Text(
                      DateFormat('dd-MMM-yyyy').format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF50577A)),
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateAge();
                });
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ReusableCard(
            colour: Colors.white,
            cardChild: Text(
              'Your age is $years years $months months and $day days',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
