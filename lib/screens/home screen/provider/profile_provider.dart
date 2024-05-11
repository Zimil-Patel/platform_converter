import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier{

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  File? profileImage;

  void takeProfilePicture() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    profileImage = File(image!.path);
    notifyListeners();
  }

  void chooseProfilePicture() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    profileImage = File(image!.path);
    notifyListeners();
  }

  void clearData(){
    txtName = TextEditingController();
    txtBio = TextEditingController();
    profileImage = null;
    notifyListeners();
  }
}