import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier{

  // VARIABLES
  bool _isIos = false;
  bool _showProfileData = false;
  int tabIndex = 1;

  // METHODS
  bool getShowProfileData() => _showProfileData;
  bool getPlatformMode() => _isIos;

  // 2. CHANGE PLATFORM AND UPDATE SHARED PREFERENCE
  Future<void> togglePlatformPreference(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isIos', value);
    _isIos = value;
    notifyListeners();
  }

  // 3. GET PLATFORM PREFERENCE AND CREATE SHARED PREFERENCE IF NOT EXISTS
  Future<void> getPlatformPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getKeys().contains('isIos')) {
      _isIos = preferences.getBool('isIos')!;
    } else {
      preferences.setBool('isIos', false);
      _isIos = false;
    }
    notifyListeners();
  }

  // 4. CHANGE SHOW PROFILE DATA VALUE BY SWITCH
  toggleShowProfileData(bool value){
      _showProfileData = value;
      notifyListeners();
  }

  // 5. TO CHANGE TAB INDEX
  toggleTabIndex(int index){
    tabIndex = index;
    // notifyListeners();
  }

  HomeProvider(){
    getPlatformPreference();
  }

}