import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CalculatorScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 57, 57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asst/splash_imagee.png', // Add your image to assets
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to the Calculator App!",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _userInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operation = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _userInput = "";
        _num1 = 0;
        _num2 = 0;
        _operation = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_userInput);

        switch (_operation) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "×":
            _output = (_num1 * _num2).toString();
            break;
          case "÷":
            _output = (_num1 / _num2).toString();
            break;
        }

        _userInput = _output;
        _num1 = 0;
        _num2 = 0;
        _operation = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        _num1 = double.parse(_userInput);
        _operation = buttonText;
        _userInput = "";
      } else {
        _userInput += buttonText;
        _output = _userInput;
      }
    });
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return GestureDetector(
      onTap: () => _buttonPressed(text),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 224, 220, 220),
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Display Area
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                alignment: Alignment.bottomRight,
                child: Text(
                  _output,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Buttons Area
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              children: [
                _buildButton("C", Colors.redAccent, Colors.white),
                _buildButton("÷", Colors.blue, Colors.white),
                _buildButton("×", Colors.blue, Colors.white),
                _buildButton("⌫", Colors.blueGrey, Colors.white),
                _buildButton("7", Colors.grey[850]!, Colors.white),
                _buildButton("8", Colors.grey[850]!, Colors.white),
                _buildButton("9", Colors.grey[850]!, Colors.white),
                _buildButton("-", Colors.blue, Colors.white),
                _buildButton("4", Colors.grey[850]!, Colors.white),
                _buildButton("5", Colors.grey[850]!, Colors.white),
                _buildButton("6", Colors.grey[850]!, Colors.white),
                _buildButton("+", Colors.blue, Colors.white),
                _buildButton("1", Colors.grey[850]!, Colors.white),
                _buildButton("2", Colors.grey[850]!, Colors.white),
                _buildButton("3", Colors.grey[850]!, Colors.white),
                _buildButton("=", Colors.green, Colors.white),
                _buildButton("0", Colors.grey[850]!, Colors.white),
                _buildButton(".", Colors.grey[850]!, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
