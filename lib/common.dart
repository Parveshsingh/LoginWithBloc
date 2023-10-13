import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic loader;

showLoader(BuildContext context) {
  loader ??= showDialog(
      useSafeArea: true,
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  height: 125,
                  width: 125,
                  child: Center(
                    child: Container(
                        color: Colors.transparent,
                        height: 125,
                        width: 125,
                        clipBehavior: Clip.none,
                        child: CircularProgressIndicator()
                    ),
                  ),
                ),
              ),
            ));
      });
}

cancelLoader(BuildContext context) {
  if (loader != null) {
    Navigator.pop(context);
    loader = null;
  }
}
