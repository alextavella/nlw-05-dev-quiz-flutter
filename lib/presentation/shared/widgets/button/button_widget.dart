import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  ButtonWidget(
      {required this.label,
      required this.bgColor,
      required this.borderColor,
      required this.textColor,
      required this.onTap});

  ButtonWidget.normal({required this.label, required this.onTap})
      : this.bgColor = AppColors.white,
        this.borderColor = AppColors.lightGrey,
        this.textColor = AppColors.lightGrey;

  ButtonWidget.primary({required this.label, required this.onTap})
      : this.bgColor = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.textColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: this.textColor,
          onSurface: this.textColor,
          backgroundColor: this.bgColor,
          side: BorderSide(color: this.borderColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(this.bgColor),
        //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   )),
        //   side: MaterialStateProperty.all(BorderSide(color: this.borderColor)),
        // ),
        onPressed: () {},
        child: Text(
          this.label,
          style: GoogleFonts.notoSans(
            color: this.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
