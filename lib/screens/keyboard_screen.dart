import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/custom_keyboard.dart';
import '../services/grammar_service.dart';

class KeyboardScreen extends StatefulWidget {
  const KeyboardScreen({super.key});

  @override
  KeyboardScreenState createState() => KeyboardScreenState();
}

class KeyboardScreenState extends State<KeyboardScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Map<String, dynamic>> _errors = [];
  int _errorCount = 0;
  bool _isUpperCase = true;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void _checkErrors() async {
    String text = _controller.text.trim();

    if (text.split(" ").length < 3) return;

    List<Map<String, dynamic>> errors = await GrammarService.checkErrors(text);
    setState(() {
      _errors = errors;
      _errorCount = errors.length;
    });
  }

  void _onKeyTap(String key) {
    setState(() {
      if (key == "SPACE") {
        _controller.text += " ";
      } else if (key == "BACK" && _controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(
          0,
          _controller.text.length - 1,
        );
      } else if (key == "BACK" && _controller.text.isEmpty) {
        return; // Empêche l'affichage de "BACK" si le champ est vide
      } else if (key == "SHIFT") {
        _isUpperCase = !_isUpperCase;
      } else {
        _controller.text +=
            _isUpperCase ? key.toUpperCase() : key.toLowerCase();
      }
    });

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      _checkErrors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clavier Éducatif")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        labelText: "Tape ici",
                        border: OutlineInputBorder(),
                        errorText:
                            _errors.isNotEmpty
                                ? "⚠ ${_errors.length} fautes détectées"
                                : null,
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  CustomKeyboard(
                    controller: _controller,
                    onSubmit: () {},
                    errorCount: _errorCount,
                    onKeyTap: _onKeyTap,
                    isUpperCase: _isUpperCase,
                    onShiftTap: () => _onKeyTap("SHIFT"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
