import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget widgetOrShimmer({
  required bool value,
  required Widget nonNullWidget,
  required Widget nullWidget,
}) {
  if (!value) {
    return nonNullWidget;
  } else {
    return nullWidget;
  }
}

Widget widthSeparator(double value) {
  return SizedBox(
    width: value,
  );
}

Widget heightSeparator(double value) {
  return SizedBox(
    height: value,
  );
}

Widget shimmerWidget({
  bool? showShimmer,
  double? shimmerRadius,
  double? shimmerWidth,
  double? shimmerHeight,
  bool shimmerWithoutOpacity = false,
  Widget? child,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(shimmerRadius ?? 8),
    child: Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 221, 221, 221).withOpacity(
        shimmerWithoutOpacity ? 1 : 0.5,
      ),
      highlightColor: Colors.white.withOpacity(
        shimmerWithoutOpacity ? 1 : 0.5,
      ),
      child: Container(
        color: Colors.white,
        // width: shimmerWidth,
        // height: shimmerHeight,
        child: child,
      ),
    ),
  );
}

double calculateTextHeight(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size.height;
}

double calculateTextWidth(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size.width;
}

Widget styledText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  Color? decorationColor,
  TextDecoration? decoration,
  double? height,
  TextAlign? textAlign,
  bool? showShimmer,
  double? shimmerRadius,
  double? shimmerWidth,
  bool shimmerWithoutOpacity = false,
  Function()? onTap,
  TextOverflow? overflow,
}) {
  final textStyle = TextStyle(
      fontSize: fontSize,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
      fontWeight: fontWeight,
      overflow: overflow ?? TextOverflow.ellipsis);

  final calculatedShimmerHeight = calculateTextHeight(text, textStyle);
  final calculatedSimmerWidth = calculateTextWidth(text, textStyle);

  return showShimmer != null && showShimmer
      ? shimmerWidget(
          shimmerRadius: shimmerRadius,
          shimmerWithoutOpacity: shimmerWithoutOpacity,
          child: Container(
            color: Colors.white,
            width: shimmerWidth ?? calculatedSimmerWidth + 2,
            height: calculatedShimmerHeight,
          ),
        )
      : GestureDetector(
          onTap: showShimmer != null && showShimmer ? null : onTap,
          child: Text(
            text,
            style: textStyle,
            textAlign: textAlign,
          ),
        );
}

Widget decContainer({
  double? radius,
  double? height,
  double? width,
  double? leftPadding,
  double? topPadding,
  double? rightPadding,
  double? bottomPadding,
  double? leftMargin,
  double? topMargin,
  double? rightMargin,
  double? bottomMargin,
  double? borderWidth,
  Color? color,
  Color? foregroundColor,
  Color? borderColor,
  double? allPadding,
  double? allMargin,
  double? leftBorderWidth,
  double? topBorderWidth,
  double? rightBorderWidth,
  double? bottomBorderWidth,
  Color? leftBorderColor,
  Color? topBorderColor,
  Color? rightBorderColor,
  Color? bottomBorderColor,
  Widget? child,
  Function()? onTap,
  double? topLeftRadius,
  double? topRightRadius,
  double? bottomLeftRadius,
  double? bottomRightRadius,
  BoxShadow? boxShadow,
  EdgeInsetsGeometry? margin,
  Alignment? alignment,
  BoxShape? shape,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: Container(
      alignment: alignment,
      margin: EdgeInsets.only(
        left: leftMargin ?? allMargin ?? 0,
        top: topMargin ?? allMargin ?? 0,
        right: rightMargin ?? allMargin ?? 0,
        bottom: bottomMargin ?? allMargin ?? 0,
      ),
      clipBehavior: Clip.antiAlias,
      foregroundDecoration: BoxDecoration(color: foregroundColor),
      padding: EdgeInsets.only(
        left: leftPadding ?? allPadding ?? 0,
        top: topPadding ?? allPadding ?? 0,
        right: rightPadding ?? allPadding ?? 0,
        bottom: bottomPadding ?? allPadding ?? 0,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        boxShadow: boxShadow != null ? [boxShadow] : null,
        color: color,
        border: borderWidth != null && borderColor != null
            ? Border.all(
                width: borderWidth,
                color: borderColor,
              )
            : Border(
                left: BorderSide(
                  width: leftBorderWidth ?? borderWidth ?? 0,
                  color: leftBorderColor ?? borderColor ?? Colors.transparent,
                ),
                top: BorderSide(
                  width: topBorderWidth ?? borderWidth ?? 0,
                  color: topBorderColor ?? borderColor ?? Colors.transparent,
                ),
                right: BorderSide(
                  width: rightBorderWidth ?? borderWidth ?? 0,
                  color: rightBorderColor ?? borderColor ?? Colors.transparent,
                ),
                bottom: BorderSide(
                  width: bottomBorderWidth ?? borderWidth ?? 0,
                  color: bottomBorderColor ?? borderColor ?? Colors.transparent,
                ),
              ),
        borderRadius: radius != null
            ? BorderRadius.circular(radius)
            : BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius ?? 0),
                topRight: Radius.circular(topRightRadius ?? 0),
                bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
                bottomRight: Radius.circular(bottomRightRadius ?? 0),
              ),
      ),
      child: child,
    ),
  );
}
