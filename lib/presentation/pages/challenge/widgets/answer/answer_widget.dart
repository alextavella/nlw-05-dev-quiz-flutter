import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  const AnswerWidget(
      {Key? key,
      required this.title,
      this.isRight = false,
      this.isSelected = false})
      : super(key: key);

  Color get _selectedColorRight =>
      this.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderColorRight =>
      this.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedCardColorRight =>
      this.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardColorRight =>
      this.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      this.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => this.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: this.isSelected
                  ? this._selectedCardColorRight
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                  color: this.isSelected
                      ? this._selectedBorderCardColorRight
                      : AppColors.border))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(this.title,
                      style: this.isSelected
                          ? this._selectedTextStyleRight
                          : AppTextStyles.body)),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: this.isSelected
                        ? this._selectedColorRight
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(
                        color: this.isSelected
                            ? this._selectedBorderColorRight
                            : AppColors.border))),
                child: this.isSelected
                    ? (Icon(
                        this._selectedIconRight,
                        size: 16,
                        color: Colors.white,
                      ))
                    : null,
              )
            ],
          )),
    );
  }
}
