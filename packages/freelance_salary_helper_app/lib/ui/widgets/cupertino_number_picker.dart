import 'dart:math';

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
    if (_number != value) {
      _number = value;
      widget?.onValueChanged(_number);
    }
  }

  bool _canListen = true;

  List<FixedExtentScrollController> _scrollControllers;

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

    _scrollControllers = List.generate(
      _digits,
      (index) => FixedExtentScrollController(
        initialItem: digitFromPosition(_number, _digits - index - 1),
      ),
    );

    _startListeningControllers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _digits,
        (index) => CupertinoDigitPicker(
          scrollController: _scrollControllers[index],
          itemExtent: widget.itemExtent,
        ),
      ),
    );
  }

  int digitFromPosition(int number, int position) {
    return (number.remainder(pow(10, 1 + position)) -
            number.remainder(pow(10, position))) ~/
        pow(10, position);
  }

  void _onDigitChanged() {
    int newNumber = 0;
    for (var controller in _scrollControllers) {
      newNumber *= 10;
      newNumber += controller.selectedItem;
    }
    if (newNumber < widget.min) {
      number = widget.min;
      _setControllersToValue(widget.min);
    } else if (newNumber > widget.max) {
      number = widget.max;
      _setControllersToValue(widget.max);
    } else {
      number = newNumber;
    }
  }

  void _setControllersToValue(int number) {
    if (_canListen) {
      _canListen = false;
      for (var i = 0; i < _scrollControllers.length; i++) {
        _scrollControllers[i].animateToItem(
          digitFromPosition(number, _digits - i - 1),
          duration: Duration(milliseconds: 450),
          curve: Curves.easeIn,
        );
      }
      Future.delayed(Duration(milliseconds: 450), () => _canListen = true);
    }
  }

  void _startListeningControllers() {
    _scrollControllers.forEach(
        (controller) => controller.addListener(() => _onDigitChanged()));
  }
}

class CupertinoDigitPicker extends StatefulWidget {
  final double itemExtent;
  final FixedExtentScrollController scrollController;

  const CupertinoDigitPicker({
    Key key,
    @required this.itemExtent,
    @required this.scrollController,
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
          scrollController: widget.scrollController,
          itemExtent: widget.itemExtent,
          onSelectedItemChanged: (int value) {},
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
