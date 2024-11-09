
import 'package:flutter/material.dart';
import 'package:fuel_feet/color/colors.dart';
import 'package:fuel_feet/constants/responsive.dart';


class CustomTextFormFieldWithout extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final bool? isDense;
  final Color? fillColor;
  final Color? borderColor;
  final bool? obscureText;
  final bool? readOnly;
  final bool? autoFocus;
  final int? maxLength;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormFieldWithout({
    super.key,
    this.hintText,
    this.focusNode,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.borderColor,
    this.validator,
    this.prefixIcon,
    this.filled,
    this.fillColor,
    this.isDense,
    this.textInputType,
    this.onTap,
    this.onSubmitted,
    this.maxLength,
    this.readOnly,
    this.autoFocus,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: TextFormField(
        focusNode: focusNode,
        obscureText: obscureText!,
        obscuringCharacter: '*',
        keyboardType: textInputType,
        onTap: onTap,
        onFieldSubmitted: onSubmitted,
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: fillColor,
          counterText: "",
          filled: filled,
          isDense: isDense ?? true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: borderColor ??
                  TankLineColor.secondary, // Set the color when the field is selected
            ),
          ),
          hintStyle: const TextStyle(color: TankLineColor.secondary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: borderColor ??
                  TankLineColor.secondary, // Set the default border color
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.red, // Set the default border color
            ),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
