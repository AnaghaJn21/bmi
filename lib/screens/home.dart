import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double _bmiRes = 0;
  String _textRes = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black54,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'BMI Calculator',
              style: TextStyle(
                  color: accentHexColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w300),
            )),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    style: TextStyle(
                        color: accentHexColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w300),
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(color: Colors.purple[300])),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                      style: TextStyle(
                          color: accentHexColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w300),
                      controller: _heightController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Height',
                          hintStyle: TextStyle(color: Colors.purple[300]))),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiRes = _w / (_h * _h);
                    if (_bmiRes > 25)
                      _textRes = 'OverWeight';
                    else if (_bmiRes >= 18.5 && _bmiRes <= 25)
                      _textRes = 'NormalWeight';
                    else
                      _textRes = 'UnderWeight';
                  });
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.purple[200],
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              width: 130,
              child: Text(
                _bmiRes.toStringAsFixed(2),
                style: TextStyle(
                    color: accentHexColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
              visible: _textRes.isNotEmpty,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: 300,
                child: Text(
                  _textRes,
                  style: TextStyle(
                      color: accentHexColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40)
          ]),
        ));
  }
}
