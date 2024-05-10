import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactModel {
  String name, message;
  String number;
  XFile contactImg;
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
