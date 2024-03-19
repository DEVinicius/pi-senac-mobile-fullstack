

import 'package:flutter/material.dart';
import 'package:simplecut1/views/widget/cores/cores.dart';

class Botaodataicon extends StatefulWidget {
  final void Function(DateTime)? onDateSelected;

  Botaodataicon({Key? key, this.onDateSelected}) : super(key: key);

  @override
  _BotaodataiconState createState() => _BotaodataiconState();
}

class _BotaodataiconState extends State<Botaodataicon> {
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: _dateController,
        decoration: InputDecoration(
          labelText: '    Selecione uma data',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: corcinza(),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: coramarelo(),
          prefixIcon: Icon(
            Icons.calendar_month,
            color: corcinza(),
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  void dispose() {
    _dateController.dispose(); // Liberar o controlador quando o widget for descartado
    super.dispose();
  }
}

