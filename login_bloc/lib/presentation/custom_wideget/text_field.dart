import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  const CTextField({
    super.key,
    required this.emailController,
    this.isPass = false,
    this.passwordVisiable = false,
    required this.hintText,
  });

  final TextEditingController emailController;
  final bool isPass;
  final bool passwordVisiable;
  final String hintText;

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  late bool _isVisible;

  @override
  void initState() {
    _isVisible = false;
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      keyboardType: widget.isPass
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: widget.isPass ? !_isVisible : false,
      style: Theme.of(context).textTheme.labelSmall,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: widget.isPass
            ? IconButton(
                onPressed: () {
                  _toggleVisibility();
                },
                icon: !_isVisible
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.remove_red_eye_rounded),
              )
            : null,
      ),
    );
  }
}
