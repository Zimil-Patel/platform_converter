import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class AdaptiveTextFormFieldRow extends StatefulWidget {
  const AdaptiveTextFormFieldRow({
    super.key,
    this.hintText,
    required this.controller,
    this.textColor,
    this.textInputType,
    this.prefixIcon,
  });

  final String? hintText;
  final TextEditingController controller;
  final Color? textColor;
  final TextInputType? textInputType;
  final IconData? prefixIcon;

  @override
  _AdaptiveTextFormFieldRowState createState() =>
      _AdaptiveTextFormFieldRowState();
}

class _AdaptiveTextFormFieldRowState extends State<AdaptiveTextFormFieldRow> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? CupertinoTextFormFieldRow(
      controller: widget.controller,
      placeholder: widget.hintText ?? 'Enter here',
      keyboardType: widget.textInputType ?? TextInputType.text,
      style: TextStyle(color: widget.textColor),
    )
        : TextField(
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Enter here',
        prefixIcon: widget.prefixIcon != null
            ? Icon(
          widget.prefixIcon,
          color: _isFocused
              ? Theme.of(context).colorScheme.inversePrimary
              : Theme.of(context).disabledColor,
        )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
