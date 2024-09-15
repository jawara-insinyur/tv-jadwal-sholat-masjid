import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Jam extends StatefulWidget {
  final String? status;

  const Jam({super.key, this.status});

  @override
  State<Jam> createState() => _JamState();
}

class _JamState extends State<Jam> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 6;

    return StreamBuilder(
      stream: Stream.periodic(const Duration(minutes: 1)),
      builder: (context, snapshot) {
        return Container(
          width: 280,
          height: height,
          color: const Color(0xFF0D1630).withOpacity(0.7),
          child: Column(
            mainAxisAlignment: widget.status != null
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
            children: [
              widget.status != null
                  ? Text(
                      widget.status!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    )
                  : const SizedBox(),
              Text(
                _timeString,
                style: TextStyle(
                    fontSize: widget.status != null ? 32 : 58,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}
