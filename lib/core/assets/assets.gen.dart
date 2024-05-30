/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Inactive.svg
  SvgGenImage get inactive => const SvgGenImage('assets/icons/Inactive.svg');

  /// File path: assets/icons/arrow_forword.png
  AssetGenImage get arrowForword =>
      const AssetGenImage('assets/icons/arrow_forword.png');

  /// File path: assets/icons/bag.svg
  SvgGenImage get bag => const SvgGenImage('assets/icons/bag.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/notifications_none.svg
  SvgGenImage get notificationsNone =>
      const SvgGenImage('assets/icons/notifications_none.svg');

  /// File path: assets/icons/place.svg
  SvgGenImage get place => const SvgGenImage('assets/icons/place.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// List of all assets
  List<dynamic> get values => [
        inactive,
        arrowForword,
        bag,
        home,
        menu,
        notificationsNone,
        place,
        search
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/beverages.png
  AssetGenImage get beverages =>
      const AssetGenImage('assets/images/beverages.png');

  /// File path: assets/images/beverages2.png
  AssetGenImage get beverages2 =>
      const AssetGenImage('assets/images/beverages2.png');

  /// File path: assets/images/breakfast.png
  AssetGenImage get breakfast =>
      const AssetGenImage('assets/images/breakfast.png');

  /// File path: assets/images/breakfast2.png
  AssetGenImage get breakfast2 =>
      const AssetGenImage('assets/images/breakfast2.png');

  /// File path: assets/images/dairy.png
  AssetGenImage get dairy => const AssetGenImage('assets/images/dairy.png');

  /// File path: assets/images/dairy2.png
  AssetGenImage get dairy2 => const AssetGenImage('assets/images/dairy2.png');

  /// File path: assets/images/dano.png
  AssetGenImage get dano => const AssetGenImage('assets/images/dano.png');

  /// File path: assets/images/fruits.png
  AssetGenImage get fruits => const AssetGenImage('assets/images/fruits.png');

  /// File path: assets/images/fruits2.png
  AssetGenImage get fruits2 => const AssetGenImage('assets/images/fruits2.png');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/meat.png
  AssetGenImage get meat => const AssetGenImage('assets/images/meat.png');

  /// File path: assets/images/meat2.png
  AssetGenImage get meat2 => const AssetGenImage('assets/images/meat2.png');

  /// File path: assets/images/nido.png
  AssetGenImage get nido => const AssetGenImage('assets/images/nido.png');

  /// File path: assets/images/snacks.png
  AssetGenImage get snacks => const AssetGenImage('assets/images/snacks.png');

  /// File path: assets/images/snacks2.png
  AssetGenImage get snacks2 => const AssetGenImage('assets/images/snacks2.png');

  /// List of all assets
  List<dynamic> get values => [
        background,
        beverages,
        beverages2,
        breakfast,
        breakfast2,
        dairy,
        dairy2,
        dano,
        fruits,
        fruits2,
        logo,
        meat,
        meat2,
        nido,
        snacks,
        snacks2
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
