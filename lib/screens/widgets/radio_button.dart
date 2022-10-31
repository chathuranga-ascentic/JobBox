import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:job_box/app/app_color.dart';

class RadioButton extends StatelessWidget {
  final List<String> choicesList;
  final int? selectedChoice;
  final ValueChanged<int> onChoiceSelected;

  const RadioButton(
      {Key? key,
      required this.choicesList,
      this.selectedChoice = 0,
      required this.onChoiceSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupButton(
          isRadio: true,
          direction: Axis.horizontal,
          spacing: 10,
          onSelected: (index, isSelected) => onChoiceSelected(index),
          buttons: choicesList,
          selectedColor: Colors.transparent,
          unselectedColor: Colors.transparent,
          unselectedBorderColor: Colors.transparent,
          selectedShadow: const <BoxShadow>[
            BoxShadow(color: Colors.transparent)
          ],
          unselectedShadow: const <BoxShadow>[
            BoxShadow(color: Colors.transparent)
          ],
          selectedTextStyle: const TextStyle(
            shadows: [
              Shadow(color: atomicTangerinColor, offset: Offset(0, -5))
            ],
            color: Colors.transparent,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: atomicTangerinColor,
            decorationThickness: 2,
          ),
          unselectedTextStyle: const TextStyle(
              shadows: [Shadow(color: nobelColor, offset: Offset(0, -5))],
              color: Colors.transparent,
              fontSize: 18.0,
              fontWeight: FontWeight.w700),
          buttonWidth: (MediaQuery.of(context).size.width - 50) / 2,
          selectedButton: selectedChoice,
        ),
      ],
    );
  }
}
