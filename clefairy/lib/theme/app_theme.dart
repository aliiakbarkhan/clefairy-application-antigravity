import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary colors
  static const Color primary = Color(0xFFEE2B8C);
  static const Color backgroundDark = Color(0xFF221019);
  static const Color backgroundLight = Color(0xFFF8F6F7);

  // Glass effect colors
  static Color glassBackground = primary.withOpacity(0.1);
  static Color glassBorder = primary.withOpacity(0.2);
  static Color glassDark = const Color(0xFF221019).withOpacity(0.8);

  // Gradient
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3D1A2D), Color(0xFF221019)],
  );

  static const LinearGradient pinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF221019), Color(0xFF3D1629)],
  );

  static TextStyle get displayFont =>
      GoogleFonts.plusJakartaSans();

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: primary,
        scaffoldBackgroundColor: backgroundDark,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          surface: backgroundDark,
          onSurface: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

// Glass Container Widget
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.primary.withOpacity(0.1),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ?? AppTheme.primary.withOpacity(0.2),
        ),
      ),
      child: child,
    );
  }
}

// Glass Dark Container
class GlassDarkContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const GlassDarkContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundDark.withOpacity(0.8),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primary.withOpacity(0.15),
        ),
      ),
      child: child,
    );
  }
}
