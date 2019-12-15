import 'package:flutter/material.dart';

class DialogCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const DialogCheckbox({
    Key key,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        widget.onChanged(v);
        setState(() {
          value = v;
        });
      },
    );
  }
}
