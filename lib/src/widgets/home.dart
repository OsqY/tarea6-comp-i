import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  double num1 = 0.0, num2 = 0.0, num3 = 0.0;

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  double result = 0.0, result2 = 0.0, result3 = 0.0, result4 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Número 1',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller1,
                  onChanged: (value) {
                    setState(() {
                      num1 = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Número 2',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller2,
                  onChanged: (value) {
                    setState(() {
                      num2 = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Número 3',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller3,
                  onChanged: (value) {
                    setState(() {
                      num3 = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = _checkBiggerNumber(num1, num2, num3);
                  });
                },
                child: const Text('Mayor'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result2 = _checkSmallerNumber(num1, num2, num3);
                  });
                },
                child: const Text('Menor'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result3 = _numberToSquare(num1);
                  });
                },
                child: const Text('Cuadrado'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result4 = _numberToCube(num1);
                  });
                },
                child: const Text('Cubo'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('El número mayor es: $result'),
          Text('El número menor es: $result2'),
          Text('El número al cuadrado es: $result3'),
          Text('El número al cubo es: $result4'),
        ],
      ),
    );
  }

  double _checkBiggerNumber(double num1, double num2, double num3) {
    if (num1 > num2 && num1 > num3) {
      return num1;
    } else if (num2 > num1 && num2 > num3) {
      return num2;
    } else if (num3 > num1 && num3 > num2) {
      return num3;
    }
    else {
      return num1;
    }
  }

  double _checkSmallerNumber(double num1, double num2, double num3) {
    if (num1 < num2 && num1 < num3) {
      return num1;
    } else if (num2 < num1 && num2 < num3) {
      return num2;
    } else if (num3 < num1 && num3 < num2) {
      return num3;
    }
    else {
      return num1;
    }
  }

  double _numberToSquare(double num) {
    return num * num;
  }

  double _numberToCube(double num) {
    return num * num * num;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
}
