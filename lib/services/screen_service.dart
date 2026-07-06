import 'package:flutter/material.dart';

class ScreenService {
  ScreenService(this._context);

  final BuildContext _context;

  /// Returns the padding surrounding the calc layout
  double get layoutPadding => layoutSize * 0.075;

  /// Returns the spacing between buttons / items in the calc layout
  double get itemSpacing => layoutSize * 0.0225 < 10 ? layoutSize * 0.0225 : 10;

  /// Returns the padding within the buttons
  double get buttonPadding => layoutSize * 0.00175;

  /// Returns the base font size for the calc layout
  double get baseFontSize => layoutSize * 0.0595;

  /// Returns the size of an item that takes
  /// *flex* nb of columns in the calc layout
  double itemFlexSize(int flex) =>
      (layoutSize - (layoutPadding * 2) - (itemSpacing * 4)) * (0.2 * flex) +
      (itemSpacing * (flex - 1));

  /// Returns screen width minus SafeArea
  double get width {
    final double w = MediaQuery.of(_context).size.width;
    final double lpad = MediaQuery.of(_context).padding.left;
    final double rpad = MediaQuery.of(_context).padding.right;
    return w - lpad - rpad;
  }

  /// Returns screen height minus SafeArea
  double get height {
    final double h = MediaQuery.of(_context).size.height;
    final double tpad = MediaQuery.of(_context).padding.top;
    final double bpad = MediaQuery.of(_context).padding.bottom;
    return h - tpad - bpad;
  }

  /// Returns the size of the calc layout
  double get layoutSize {
    final double layoutSize = height < width ? height : width;
    return layoutSize < 600 ? layoutSize : 600;
  }
}
