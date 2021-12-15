//Import files for widgets
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//Index for buttons
int selectedIndex = 0;
int snackbarOn = 0;
int cardsListLoading = 0;

//CardList to store the cards for the Passwords page
final List<Widget> cardsList = [];

List passwordsFormURL = [];
List passwordsFormUsername = [];
List passwordsFormPassword = [];

//QrCode data
Barcode data = Barcode("", BarcodeFormat.unknown, null);
