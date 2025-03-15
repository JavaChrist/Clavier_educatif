import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final int errorCount;
  final Function(String) onKeyTap;
  final bool isUpperCase;
  final VoidCallback onShiftTap;

  CustomKeyboard({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.errorCount,
    required this.onKeyTap,
    required this.isUpperCase,
    required this.onShiftTap,
  });

  final List<String> keysRow1 = [
    'A',
    'Z',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P',
  ];
  final List<String> keysRow2 = [
    'Q',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'M',
  ];
  final List<String> keysRow3 = ['W', 'X', 'C', 'V', 'B', 'N'];

  @override
  Widget build(BuildContext context) {
    double keyboardWidth =
        MediaQuery.of(context).size.width; // Ajuste à la largeur de l'écran
    return SizedBox(
      width: keyboardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.black87,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fautes détectées: $errorCount",
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: errorCount > 3 ? null : onSubmit,
                  child: Text("Envoyer"),
                ),
              ],
            ),
          ),
          _buildKeyRow(keysRow1),
          _buildKeyRow(keysRow2),
          _buildKeyRow(keysRow3),
          _buildBottomRow(),
        ],
      ),
    );
  }

  Widget _buildKeyRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keys.map((key) => Expanded(child: _buildKey(key))).toList(),
    );
  }

  Widget _buildKey(String key) {
    return GestureDetector(
      onTap: () => onKeyTap(key),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            key,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center, // Centre le texte dans la touche
          ),
        ),
      ),
    );
  }

    Widget _buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: GestureDetector(
          onTap: onShiftTap,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text("SHIFT", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        )),
        Expanded(child: _buildKey("SPACE")),
        Expanded(child: _buildKey("BACK")),
      ],
    );
  }
}

