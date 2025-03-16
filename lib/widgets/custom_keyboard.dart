import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final int errorCount;
  final Function(String) onKeyTap;
  final bool isUpperCase;
  final VoidCallback onShiftTap;

  const CustomKeyboard({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.errorCount,
    required this.onKeyTap,
    required this.isUpperCase,
    required this.onShiftTap,
  });

  @override
  CustomKeyboardState createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  bool isSymbols = false; // Toggle pour chiffres & symboles
  bool isPressed = false; // Variable globale pour gérer l'effet d'appui

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
  final List<String> numberKeys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ];
  final List<String> symbolKeys = [
    '!',
    '@',
    '#',
    r'$',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
  ];

  @override
  Widget build(BuildContext context) {
    double keyboardWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: keyboardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildHeader(),
          isSymbols ? _buildKeyRow(numberKeys) : _buildKeyRow(keysRow1),
          isSymbols ? _buildKeyRow(symbolKeys) : _buildKeyRow(keysRow2),
          _buildKeyRow(keysRow3),
          _buildBottomRow(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Fautes détectées: ${widget.errorCount}",
            style: const TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: widget.errorCount > 3 ? null : widget.onSubmit,
            child: const Text("Envoyer"),
          ),
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
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            setState(() {
              isPressed = false;
            });
          }
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onTap: () => widget.onKeyTap(
        widget.isUpperCase ? key.toUpperCase() : key.toLowerCase(),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        constraints: const BoxConstraints(minWidth: 40, minHeight: 50),
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey[500] : Colors.grey[700],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: isPressed
                  ? Colors.black.withAlpha(25)
                  : Colors.black.withAlpha(76),
              blurRadius: 3,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          widget.isUpperCase ? key.toUpperCase() : key.toLowerCase(),
          style: const TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onShiftTap,
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "SHIFT",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => widget.onKeyTap(" "),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "␣",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => isSymbols = !isSymbols),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  isSymbols ? "ABC" : "123",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onLongPress: () {
              String text = widget.controller.text.trim();
              if (text.isNotEmpty) {
                List<String> words = text.split(" ");
                words.removeLast();
                widget.controller.text = "${words.join(" ")} ";
              }
            },
            onTap: () {
              if (widget.controller.text.isNotEmpty) {
                widget.controller.text = widget.controller.text.substring(
                  0,
                  widget.controller.text.length - 1,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.backspace, color: Colors.white, size: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
