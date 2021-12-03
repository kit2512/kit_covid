import 'package:flutter/material.dart';

class PopupButton extends StatefulWidget {
  PopupButton({
    Key? key,
    required this.valuesMap,
    required this.onSelected,
    this.selectedValue,
  }) : super(key: key) {
    assert(valuesMap.isNotEmpty, "valuesMap must have at lest 1 value");
  }

  final Map<String, dynamic> valuesMap;
  final String? selectedValue;
  final Function(dynamic) onSelected;

  @override
  State<PopupButton> createState() => _PopupButtonState();
}

class _PopupButtonState extends State<PopupButton> {
  late String _seletedValue;

  @override
  void initState() {
    super.initState();
    _seletedValue = widget.selectedValue ?? widget.valuesMap.entries.first.key;
  }

  void onSelected(MapEntry value) {
    setState(() {
      _seletedValue = value.key;
    });

    widget.onSelected(value.value);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MapEntry>(
      tooltip: "Choose days",
      onSelected: onSelected,
      itemBuilder: (context) {
        return widget.valuesMap.entries
            .map((e) => PopupMenuItem<MapEntry>(child: Text(e.key), value: e))
            .toList();
      },
      child: Text(_seletedValue),
    );
  }
}
