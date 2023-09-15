import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineSmallGray50 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray50,
        fontSize: 25.fSize,
      );
}

extension on TextStyle {
  TextStyle get lilitaOne {
    return copyWith(
      fontFamily: 'Lilita One',
    );
  }

  TextStyle get andika {
    return copyWith(
      fontFamily: 'Andika',
    );
  }
}
