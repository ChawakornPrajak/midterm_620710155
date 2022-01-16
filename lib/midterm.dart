import 'package:flutter/material.dart';

class Midterm extends StatelessWidget {
  var _lengthController = TextEditingController();
  var _girthController = TextEditingController();
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                "PIG WEIGHT",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CALCULATOR",
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Image.asset(
                    "assets/images/pig.png",
                    height: 200.0,
                  )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            const Text('LENGTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            TextField(
                              textAlign: TextAlign.center,
                              controller: _lengthController,
                              decoration: InputDecoration(
                                hintText: "Enter length",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            const Text('GIRTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            TextField(
                              textAlign: TextAlign.center,
                              controller: _girthController,
                              decoration: InputDecoration(
                                hintText: "Enter Girth",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent, minimumSize: Size(130, 65)),
                    onPressed: () {
                      double? length = double.tryParse(_lengthController.text);
                      double? girth = double.tryParse(_girthController.text);
                      if (girth == null || length == null) {
                        text = 'Invalid Input';
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ERROR'),
                              content: Text(text),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        double weight = (girth / 100) *
                            (girth / 100) *
                            (length / 100) *
                            69.3;
                        double price = 112.50 * weight;
                        double minWeight = 0.97 * weight;
                        double maxWeight = 1.03 * weight;
                        double minPrice = 0.97 * price;
                        double maxPrice = 1.03 * price;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/ic_pig.png',
                                    height: 30.0,
                                  ),
                                  Text(' RESULT '),
                                ],
                              ),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Weight: ${minWeight.round()} - ${maxWeight.round()} kg\n\nPrice: ${minPrice.round()} - ${maxPrice.round()} Baht'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
