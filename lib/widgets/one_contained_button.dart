import 'package:flutter/material.dart';

///oneui Contained button
///may be used as elevated button in Material Design
class OneContainedButton extends StatefulWidget {
  const OneContainedButton({
    super.key,
    this.borderRadius = 50.0,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.height,
    this.onLongPress,
    this.contentColor,
    this.width,
    this.disabled = false,
    this.loading = false,
  });

  ///defines the border radius for the [ContainedButton]. default is 50.0
  final double borderRadius;

  ///defines the [child] of the [ContainedButton].
  ///can be [String] or [Widget].
  final dynamic child;

  ///a callback called when the button is tapped
  final VoidCallback onPressed;

  ///a callback called when the button is long-pressed
  final VoidCallback? onLongPress;

  ///the color to apply to the background
  final Color? backgroundColor;

  ///the content | text color.
  final Color? contentColor;

  ///the height of the button
  final double? height;

  ///the button width.
  final double? width;

  ///defines if the button is disabled
  final bool disabled;

  ///defines if the button is loading: shows a [OneSpinner] in the center with the [contentColor] as default color.
  final bool loading;

  @override
  State<OneContainedButton> createState() => _OneContainedButtonState();
}

class _OneContainedButtonState extends State<OneContainedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: MaterialButton(
          height: widget.height,
          onPressed: widget.onPressed,
          onLongPress: widget.onLongPress,
          disabledColor: widget.backgroundColor == null
              ? Theme.of(context).primaryColor.withOpacity(0.6)
              : widget.backgroundColor?.withOpacity(0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.loading
                ? [CircularProgressIndicator()]
                : [
                    widget.child is String
                        ? Text(
                            widget.child,
                            style: TextStyle(
                                color: widget.contentColor,
                                fontWeight: FontWeight.w700),
                          )
                        : widget.child is Widget
                            ? widget.child
                            : null,
                  ],
          )),
    );
  }
}
