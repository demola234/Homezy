import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homezy/core/global/constants/size.dart';

class HomezyTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String? Function(String? input)? validator;
  final Function(String input)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool enableInteractiveSelection;
  final TextAlign textAlign;
  final String? hintText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool enabled;
  final bool? readOnly;
  final void Function()? onTap;

  const HomezyTextFormField(
      {Key? key,
      this.labelText,
      this.initialValue,
      this.suffixIcon,
      this.inputType,
      this.onChanged,
      this.onEditingComplete,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.maxLines = 1,
      this.focusNode,
      this.textAlign = TextAlign.start,
      this.obscureText = false,
      this.enableInteractiveSelection = true,
      this.hintText,
      this.prefixIcon,
      this.controller,
      this.readOnly = false,
      this.onTap,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText!,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLines: maxLines,
      readOnly: readOnly!,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      keyboardType: inputType,
      textAlign: textAlign,
      enabled: enabled,
      decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor.withOpacity(0.2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          hintStyle: Config.b2(context).copyWith(
            color: Theme.of(context).cardColor,
          )),
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
    );
  }
}
