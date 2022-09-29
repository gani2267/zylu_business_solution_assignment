import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

Color grey = Color(0xff2c2c2e);
Color almostWhite = Color(0xffffffff).withOpacity(0.87);
Color white60 = Color(0xffffffff).withOpacity(0.60);
Color white38 = Color(0xffffffff).withOpacity(0.38);

TextStyle bodyText2White60 = GoogleFonts.ibmPlexSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: white60);

TextStyle subtitle1White = GoogleFonts.ibmPlexSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: almostWhite);

TextStyle captionWhite60 = GoogleFonts.ibmPlexSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: white60);

TextStyle captionWhite = GoogleFonts.ibmPlexSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: almostWhite);

TextStyle subtitle1 = GoogleFonts.ibmPlexSans(
    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15);

TextStyle subtitle2White = GoogleFonts.ibmPlexSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: almostWhite);