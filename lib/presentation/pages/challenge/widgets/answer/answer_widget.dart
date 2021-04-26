import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final VoidCallback onTap;
  final bool isSelected;
  final bool disabled;

  String get title => this.answer.title;
  bool get isRight => this.answer.isRight;
  bool get isResponded => this.disabled && this.isSelected;

  const AnswerWidget({
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.disabled = false,
  });

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

  IconData get _selectedIconRight {
    if (!this.isResponded) return Icons.circle_rounded;
    return this.isRight ? Icons.check : Icons.close;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: this.onTap,
          child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: this.isResponded
                    ? this._selectedCardColorRight
                    : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: this.isResponded
                        ? this._selectedBorderCardColorRight
                        : this.isSelected
                            ? AppColors.grey
                            : AppColors.border,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(this.title,
                          style: this.isResponded
                              ? this._selectedTextStyleRight
                              : AppTextStyles.body)),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: this.isResponded
                            ? this._selectedColorRight
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(500),
                        border: Border.fromBorderSide(BorderSide(
                            color: this.isResponded
                                ? this._selectedBorderColorRight
                                : AppColors.border))),
                    child: this.isSelected
                        ? (Icon(
                            this._selectedIconRight,
                            size: 16,
                            color: this.isResponded
                                ? AppColors.white
                                : AppColors.grey,
                          ))
                        : null,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
