import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onClick;
  final String label;
  final bool? isLoading;

  const PrimaryButton(
      {Key? key, required this.onClick, required this.label, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: isLoading ?? false ? null : onClick,
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Center(
            child: isLoading ?? false
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    label.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
