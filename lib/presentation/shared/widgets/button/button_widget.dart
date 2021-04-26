import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;

  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  Color get _bgColor => this.disabled ? AppColors.white : this.bgColor;
  Color get _borderColor => this.disabled ? AppColors.white : this.borderColor;
  Color get _textColor => this.disabled ? AppColors.lightGrey : this.textColor;

  ButtonWidget({
    required this.label,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
    this.disabled = false,
  });

  ButtonWidget.normal(
      {required this.label, required this.onTap, this.disabled = false})
      : this.bgColor = AppColors.white,
        this.borderColor = AppColors.lightGrey,
        this.textColor = AppColors.lightGrey;

  ButtonWidget.primary(
      {required this.label, required this.onTap, this.disabled = false})
      : this.bgColor = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.textColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            primary: this._textColor,
            onSurface: this._textColor,
            backgroundColor: this._bgColor,
            side: BorderSide(color: this._borderColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enableFeedback: !this.disabled,
            padding: EdgeInsets.symmetric(horizontal: 20)),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(this.bgColor),
        //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   )),
        //   side: MaterialStateProperty.all(BorderSide(color: this.borderColor)),
        // ),
        onPressed: this.disabled ? null : this.onTap,
        child: Text(
          this.label,
          style: GoogleFonts.notoSans(
            color: this._textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
