import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // headline
  static TextStyle primaryHeadLine(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle subtitleHeadLine(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  // reusable styles
  static TextStyle black16w600(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.surface,
    );
  }

  static TextStyle black22w600(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle black16w400(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle black14w600(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle grey12w500(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle grey14w500(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle appBarStyle(BuildContext context) {
    return GoogleFonts.readexPro(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
