import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  TextEditingController controller = TextEditingController();
  String cityName = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(() {printText();});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void printText(){
    final text = controller.text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldStyle,
                  onChanged: (value){
                    cityName = value;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context,cityName);
                },
                child: Container(
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
