import 'package:flutter/cupertino.dart';
import 'package:platform_converter/screens/home%20screen/model/contact_model.dart';

class ContactProvider extends ChangeNotifier{

  List<ContactModel> contactList = [];

  addContact(ContactModel contact){
    contactList.add(contact);
    notifyListeners();
  }

  updateContact(ContactModel contact, int index){
    contactList[index] = contact;
    notifyListeners();
  }
}
