import 'dart:io';

import 'package:flutter/material.dart';

class ContactModel {
  String name, message;
  String number;
  File contactImg;
  DateTime dateTime;
  TimeOfDay timeOfDay;

  ContactModel({
    required this.name,
    required this.message,
    required this.number,
    required this.contactImg,
    required this.dateTime,
    required this.timeOfDay,
  });
}
