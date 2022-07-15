import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController? controller,
  required Function? validat,
  Function? suffixPressed,
  bool? isPassword = false,
  required TextInputType? keyboardType,
  required String? lable,
  required IconData? prefix,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller!,
      validator: (v) {
        return validat!(v);
      },
      keyboardType: keyboardType!,
      decoration: InputDecoration(
        label: Text(lable!),
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix!),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  return suffixPressed!();
                },
                icon: Icon(suffix))
            : null,
      ),
      obscureText: isPassword!,
    );

Widget weatherTXT(
        {required String txt,
        required context,
        required Color color,
        required FontWeight fontWeight,
        required double size}) =>
    Text(
      txt,
      style: Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: color, fontWeight: fontWeight, fontSize: size),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
