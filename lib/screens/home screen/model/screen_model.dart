import 'dart:io';

import 'package:flutter/material.dart';

class ScreenModel {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtMessage = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  File? image;
}