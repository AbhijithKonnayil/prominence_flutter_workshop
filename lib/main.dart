import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(MaterialApp(home: MyWidget()));
}

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController crushController = TextEditingController();
  double? percent;
  @override
  Widget build(BuildContext context) {
    if (percent == null) {
      return buildInitalUi();
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: percent! / 100,
                  center: new Text("$percent%"),
                  progressColor: Colors.green,
                ),
                MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        nameController.text = "";
                        crushController.text = "";
                        percent = null;
                      });
                    },
                    child: Text("Check Again"))
              ]),
        ),
      );
    }
  }

  Scaffold buildInitalUi() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Calc"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        //width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/app-icon.png"),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Your Name'),
            ),
            TextFormField(
              controller: crushController,
              decoration: InputDecoration(hintText: "Your Crush's Name"),
            ),
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: calculate,
              child: Text("Calculate"),
            )
          ],
        ),
      ),
    );
  }

  void calculate() {
    String name1 = nameController.text.toLowerCase();
    String name2 = crushController.text.toLowerCase();
    if (name1 == 'abhijith') {
      setState(() {
        percent = 5;
      });
    } else {
      calculateOld();
    }
  }

  void calculateOld() {
    String name1 = nameController.text.toLowerCase();
    String name2 = crushController.text.toLowerCase();
    int sumN1 = 0, sumN2 = 0;
    name1.codeUnits.forEach((element) {
      sumN1 += element;
    });
    name2.codeUnits.forEach((element) {
      sumN2 += element;
    });
    int nameSum = sumN1 + sumN2;
    int loveSum = 15;
    String nameSumString = nameSum.toString();
    int sumOfDigits = 0;
    for (int i = 0; i < nameSumString.length; i++) {
      sumOfDigits += int.parse(nameSumString[i]);
    }

    if (sumOfDigits > loveSum) {
      sumOfDigits = loveSum - (sumOfDigits - loveSum);
    }
    setState(() {
      percent = sumOfDigits * 100 / loveSum;
    });
  }
}
