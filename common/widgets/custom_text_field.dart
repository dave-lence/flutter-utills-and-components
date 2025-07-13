// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constant/color_connstant.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.label,
    required this.keyBoardType,
    required this.focusNode,
    required this.onSaved,
    this.obscureText = false,

    this.iconString = '',
    this.prefixIcon = '',
    this.onTap,
    required this.onTextChange,
    this.formKey,
    this.applyShadow = false,
    this.showSufixIcon = false,
    this.showPrefixIcon = false,
    this.isRounded = false,
    this.fillColor = const Color(0xffE4EAEC),
  });
  final TextEditingController textController;
  final String hintText;
  final String label;
  final TextInputType keyBoardType;
  final FocusNode focusNode;
  final Color fillColor;
  final String iconString;
  final String prefixIcon;
  final Key? formKey;
  final FormFieldSetter<String>? onSaved;
  final bool showSufixIcon;
  final bool showPrefixIcon;
  final bool applyShadow;
  final bool isRounded;
  final bool obscureText;
  final Function(String)? onTextChange;
  final VoidCallback? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(() {
      setState(() {});
      if (widget.focusNode.hasFocus) {
        debugPrint('TextField is focused');
      } else {
        debugPrint('TextField lost focus');
      }
    });
  }

  @override
  void dispose() {
    // widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: -0.12,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: widget.label == '' ? 0 : 5),
        Container(
          key: widget.formKey,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 14,),
          decoration: BoxDecoration(
            boxShadow: [
              widget.applyShadow
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  : const BoxShadow(),
            ],
            color: widget.focusNode.hasFocus ? CColors.white : CColors.white,
            borderRadius: widget.isRounded
                ? BorderRadius.circular(25)
                : BorderRadius.circular(4),
            border: Border.all(
              color: widget.focusNode.hasFocus
                  ? CColors.primary
                  :  CColors.borderPrimary,
              width: 1,
            ),
          ),
          child: TextFormField(

            onSaved: widget.onSaved,
            onChanged: widget.onTextChange,
            focusNode: widget.focusNode,
            keyboardType: widget.keyBoardType,
            obscureText: widget.obscureText ? true : false,

            controller: widget.textController,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.focusNode.hasFocus
                  ? CColors.white
                  : CColors.white,
              border: InputBorder.none,

              contentPadding: const EdgeInsets.only(
                left: 0,
                top: 0,
                right: 0,
                bottom: 4,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                
                fontSize: 14, color: CColors.darkGray),

              suffixIcon: widget.showSufixIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: GestureDetector(
                        onTap: widget.onTap,
                        child: Image.asset(
                          widget.iconString,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    )
                  : const SizedBox(),
              suffixIconConstraints: BoxConstraints(
                minWidth: widget.showSufixIcon ? 20 : 0,
                minHeight: widget.showSufixIcon ? 20 : 0,
              ),
              prefixIcon: widget.showPrefixIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Image.asset(
                        widget.prefixIcon,
                        height: 20,
                        width: 20,
                      ),
                    )
                  : const SizedBox(),
              prefixIconConstraints: BoxConstraints(
                minWidth: widget.showPrefixIcon ? 20 : 0,
                minHeight: widget.showPrefixIcon ? 20 : 0,
              ),
            ),
            cursorHeight: 24,
            cursorColor: CColors.primary,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
