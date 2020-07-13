import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNumberPicker extends StatefulWidget {
  final double itemExtent;
  final int min;
  final int max;
  final void Function(int) onValueChanged;
  final int initialVallue;

  const CupertinoNumberPicker({
    Key key,
    @required this.itemExtent,
    @required this.min,
    @required this.max,
    this.onValueChanged,
    this.initialVallue,
  }) : super(key: key);

  @override
  _CupertinoNumberPickerState createState() => _CupertinoNumberPickerState();
}

class _CupertinoNumberPickerState extends State<CupertinoNumberPicker> {
  int _digits;
  int _number;
  int get number => _number;
  set number(int value) {
    _number = value;
    widget?.onValueChanged(_number);
  }

  List<int> _digitsValue = List<int>();

  @override
  void initState() {
    assert(widget.min != null);
    assert(widget.max != null);
    assert(widget.min >= 0);
    assert(widget.max >= widget.min);
    if (widget.initialVallue != null) {
      assert(widget.initialVallue >= widget.min);
      assert(widget.initialVallue <= widget.max);
      _number = widget.initialVallue;
    } else {
      _number = widget.min;
    }

    _digits = widget.max.toString().length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _digits,
        (index) => CupertinoDigitPicker(
          itemExtent: widget.itemExtent,
          onDigitChanged: (value) => _onDigitChanged(value, index),
        ),
      ),
    );
  }

  void _onDigitChanged(int digitValue, int powerOfTen) {}
}

class CupertinoDigitPicker extends StatefulWidget {
  final double itemExtent;
  final void Function(int) onDigitChanged;
  final FixedExtentScrollController scrollController;

  const CupertinoDigitPicker({
    Key key,
    @required this.itemExtent,
@required this.scrollController,
    this.onDigitChanged,
  }) : super(key: key);
  @override
  _CupertinoDigitPickerState createState() => _CupertinoDigitPickerState();
}

class _CupertinoDigitPickerState extends State<CupertinoDigitPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: CupertinoPicker(
        scrollController: ,
          itemExtent: widget.itemExtent,
          onSelectedItemChanged: (int value) {
            setState(() {
              widget?.onDigitChanged(value);
            });
          },
          children: List.generate((10), (index) => _cupertinoDigitRow(index))),
    );
  }

  Widget _cupertinoDigitRow(int digit) => Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical:
                BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        child: Center(child: Text(digit.toString())),
      );
}
