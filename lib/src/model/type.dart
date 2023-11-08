enum ToastPosition { top, center, bottom }

enum ToastType {
  success("success"),
  error("error"),
  warning("warning"),
  info("info");

  final String? type;

  const ToastType(this.type);
}