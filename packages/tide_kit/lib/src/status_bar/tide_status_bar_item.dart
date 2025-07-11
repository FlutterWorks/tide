import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../tide_core.dart';

typedef TideStatusBarItemBuilder = Widget? Function(
    BuildContext context, TideStatusBarItem item);

/// Signature of callbacks that have no arguments and return no data.
typedef TideOnPressedItemCallback = void Function(
    BuildContext context, TideStatusBarItem item);

enum TideStatusBarItemPosition {
  left,
  center,
  right,
}

class TideStatusBarItem extends Equatable {
  TideStatusBarItem({
    final TideId? itemId,
    this.isVisible = true,
    this.position = TideStatusBarItemPosition.center,
    this.tooltip,
    this.onPressed,
    this.builder,
  }) {
    this.itemId = itemId ?? TideId.uniqueId();
  }

  late final TideId itemId;
  final bool isVisible;
  final TideStatusBarItemPosition position;

  /// The tooltip to display when hovering over the status bar item.
  final String? tooltip;

  /// Called when the button is tapped or otherwise activated.
  final TideOnPressedItemCallback? onPressed;

  final TideStatusBarItemBuilder? builder;

  @override
  List<Object?> get props =>
      [itemId, isVisible, position, tooltip, onPressed, builder];

  copyWith({
    TideId? itemId,
    bool? isVisible,
    TideStatusBarItemPosition? position,
    String? tooltip,
    TideOnPressedItemCallback? onPressed,
    TideStatusBarItemBuilder? builder,
  }) {
    return TideStatusBarItem(
      itemId: itemId ?? this.itemId,
      isVisible: isVisible ?? this.isVisible,
      position: position ?? this.position,
      tooltip: tooltip ?? this.tooltip,
      onPressed: onPressed ?? this.onPressed,
      builder: builder ?? this.builder,
    );
  }
}

class TideStatusBarItemText extends TideStatusBarItem {
  TideStatusBarItemText({
    super.itemId,
    super.isVisible,
    super.position,
    super.tooltip,
    super.onPressed,
    super.builder,
    required this.text,
    this.icon,
  });

  /// The text to be displayed.
  final String text;

  final IconData? icon;

  @override
  List<Object?> get props => [...super.props, text, icon];

  @override
  TideStatusBarItemText copyWith({
    TideId? itemId,
    bool? isVisible,
    TideStatusBarItemPosition? position,
    String? tooltip,
    TideOnPressedItemCallback? onPressed,
    TideStatusBarItemBuilder? builder,
    String? text,
    IconData? icon,
  }) {
    return TideStatusBarItemText(
      itemId: itemId ?? super.itemId,
      isVisible: isVisible ?? super.isVisible,
      position: position ?? super.position,
      tooltip: tooltip ?? super.tooltip,
      onPressed: onPressed ?? super.onPressed,
      builder: builder ?? super.builder,
      text: text ?? this.text,
      icon: icon ?? this.icon,
    );
  }
}

class TideStatusBarItemTime extends TideStatusBarItem {
  TideStatusBarItemTime({
    super.itemId,
    super.isVisible,
    super.position,
    super.tooltip = 'Current Time',
    super.onPressed,
    super.builder,
    this.use24HourFormat = false,
    this.formatPattern,
  });

  final bool use24HourFormat;

  /// The format pattern to use for the time display using [intl.DateFormat].
  final String? formatPattern;

  @override
  List<Object?> get props => [...super.props, use24HourFormat, formatPattern];

  @override
  TideStatusBarItemTime copyWith({
    TideId? itemId,
    bool? isVisible,
    TideStatusBarItemPosition? position,
    String? tooltip,
    TideOnPressedItemCallback? onPressed,
    TideStatusBarItemBuilder? builder,
    bool? use24HourFormat,
    String? formatPattern,
  }) {
    return TideStatusBarItemTime(
      itemId: itemId ?? super.itemId,
      isVisible: isVisible ?? super.isVisible,
      position: position ?? super.position,
      tooltip: tooltip ?? super.tooltip,
      onPressed: onPressed ?? super.onPressed,
      builder: builder ?? super.builder,
      use24HourFormat: use24HourFormat ?? this.use24HourFormat,
      formatPattern: formatPattern ?? this.formatPattern,
    );
  }
}

class TideStatusBarItemProgress extends TideStatusBarItem {
  TideStatusBarItemProgress({
    super.itemId,
    super.isVisible,
    super.position,
    super.tooltip = 'Progress bar',
    super.builder,
    super.onPressed,
    this.infinite = true,
    this.progressTotal,
    this.progressWorked,
    this.onPressedClose,
  });

  /// Whether the progress bar is infinite.
  final bool infinite;

  /// The total possible progress worked.
  final num? progressTotal;

  /// The current amount of progress worked.
  final num? progressWorked;

  /// Called when the close button is tapped or otherwise activated.
  final TideOnPressedItemCallback? onPressedClose;

  @override
  List<Object?> get props =>
      [...super.props, infinite, progressTotal, progressWorked, onPressedClose];

  @override
  TideStatusBarItemProgress copyWith({
    TideId? itemId,
    bool? isVisible,
    TideStatusBarItemPosition? position,
    String? tooltip,
    TideOnPressedItemCallback? onPressed,
    TideStatusBarItemBuilder? builder,
    bool? infinite,
    num? progressTotal,
    num? progressWorked,
    TideOnPressedItemCallback? onPressedClose,
  }) {
    return TideStatusBarItemProgress(
      itemId: itemId ?? super.itemId,
      isVisible: isVisible ?? super.isVisible,
      position: position ?? super.position,
      tooltip: tooltip ?? super.tooltip,
      onPressed: onPressed ?? super.onPressed,
      builder: builder ?? super.builder,
      infinite: infinite ?? this.infinite,
      progressTotal: progressTotal ?? this.progressTotal,
      progressWorked: progressWorked ?? this.progressWorked,
      onPressedClose: onPressedClose ?? this.onPressedClose,
    );
  }
}
