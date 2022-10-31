import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';

class InputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final String labelName;
  final bool isObsureText;

   const InputField(
      {Key? key, required this.onChanged,
      required this.labelName,
      required this.hintText,
      this.isObsureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: taupeColor),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
            obscureText: isObsureText,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: taupeColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: atomicTangerinColor),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: taupeColor)),
            ),
            onChanged: onChanged),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
