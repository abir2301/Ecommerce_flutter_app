import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({Key? key, required this.iconPath, required this.isSelected})
      : super(key: key);

  final String iconPath;
  final bool isSelected;

  Color colorBg = const Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSelected ? colorBg : Colors.transparent,
            border: Border.all(color: colorBg, width: 0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(iconPath),
            backgroundColor: isSelected ? colorBg : Colors.transparent,
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // Checked Circle
        !iconPath.contains('add logo')
            ? Container(
                margin: const EdgeInsets.only(right: 7),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isSelected ? colorBg : Colors.transparent,
                  border: Border.all(color: colorBg, width: 0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CircleAvatar(
                  backgroundColor: isSelected ? colorBg : Colors.transparent,
                  radius: 8,
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 12,
                        )
                      : Container(),
                ),
              )
            : Container(),
      ],
    );
  }
}
