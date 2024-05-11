import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/screens/home%20screen/model/contact_model.dart';
import 'package:platform_converter/screens/home%20screen/model/screen_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  ScreenModel screenModel = ScreenModel(
    txtName: TextEditingController(),
    txtMessage: TextEditingController(),
    txtNumber: TextEditingController(),
  );
  ScreenModel editScreenModel = ScreenModel();

  // ADD NEW CONTACT
  addContact(ContactModel contact) {
    contactList.add(contact);
    log('Successful: ContactAdded!');
    notifyListeners();
  }

  // UPDATE CONTACT DATA
  updateContact(ContactModel contact, int index) {
    contactList[index] = contact;
    notifyListeners();
  }

  // TAKE PHOTO FROM CAMERA
  void takePhoto() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    screenModel.image = File(image!.path);
    notifyListeners();
  }

  // CHOOSE PHOTO FROM GALLERY
  void choosePhoto() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    screenModel.image = File(image!.path);
    notifyListeners();
  }

  // CLEAR SCREEN DATA
  void clearData(ContactProvider value) {
    value.screenModel = ScreenModel(
      txtName: TextEditingController(),
      txtMessage: TextEditingController(),
      txtNumber: TextEditingController(),
    );
    notifyListeners();
  }

  void setSelectedDate(DateTime? dateTime) {
    screenModel.selectedDate = dateTime;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay? timeOfDay) {
    screenModel.selectedTime = timeOfDay;
    notifyListeners();
  }

  void deleteContact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  // UPDATE EDIT SCREEN MODEL
  void setEditScreenModel(ScreenModel model) {
    editScreenModel = model;
    // notifyListeners();
  }

  // TAKE PHOTO FROM CAMERA
  void editTakePhoto() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    editScreenModel.image = File(image!.path);
    notifyListeners();
  }

  // CHOOSE PHOTO FROM GALLERY
  void editChoosePhoto() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    editScreenModel.image = File(image!.path);
    notifyListeners();
  }

}
