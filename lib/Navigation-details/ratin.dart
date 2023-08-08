
import 'package:flutter/cupertino.dart';
import 'package:rate_my_app/rate_my_app.dart';

class AppRating{

rateApp(BuildContext context){

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    remindDays: 0,
    remindLaunches: 1,
    googlePlayIdentifier: 'https://play.google.com/store/apps/details?id=com.easy_rent_owner.eazy_rent',
    // appStoreIdentifier: '1491556149',
  );

  rateMyApp.init().then((_)=>{

    if(rateMyApp.shouldOpenDialog){

      rateMyApp.showRateDialog(
        context,
        title: "Enjoy our App",
        message: "If you like Eazy Rent please rate us on Play store",
        rateButton: "Rate Now",
        noButton: "No",
        laterButton: "Not Now Later",
        listener: (button) { // The button click listener (useful if you want to cancel the click event).
          switch(button) {
            case RateMyAppDialogButton.rate:
              print('Clicked on "Rate".');
              break;
            case RateMyAppDialogButton.later:
              print('Clicked on "Later".');
              break;
            case RateMyAppDialogButton.no:
              print('Clicked on "No".');
              break;
          }

          return true; // Return false if you want to cancel the click event.
        },
        //ignoreNativeDialog: Platform.isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
        dialogStyle: const DialogStyle(), // Custom dialog styles.
        onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),


      )
    }

  });
}
}