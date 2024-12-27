import 'package:chat_application/res/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatifyBottomSheetComponent {
  static Future<T?> actionBottomSheet<T>({
    required BuildContext context,
    bool showBottomSheet = true,
    required List<ChatifyBottomSheetItem> actions,
    Widget? customHeader,
  }) {
    return _showCustomModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      builder: (context) => ChatifyBottomSheetWidget(
        actions: actions,
        showBottomDivider: showBottomSheet,
        customHeader: customHeader,
      ),
    );
  }

  static Future customBottomSheet({
    required BuildContext context,
    required Widget child,
    bool showBottomDivider = true,
    AnimationController? transitionAnimationController,
    bool isScrollControlled = true,
    bool removeSidePadding = false,
    bool useRootNavigator = true,
  }) =>
      _showCustomModalBottomSheet(
        context: context,
        isScrollControlled: true,
        transitionAnimationController: transitionAnimationController,
        useSafeArea: true,
        useRootNavigator: useRootNavigator,
        builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChatifyBottomSheetWidget(
                customChild: child,
                removeSidePadding: removeSidePadding,
                showBottomDivider: showBottomDivider,
              )
            ]),
      );

  static Future customStatefulBottomSheet({
    required BuildContext context,
    required Widget Function(Function(void Function())) child,
    bool isScrollControlled = false,
    bool showBottomSheet = true,
    bool useRootNavigator = false,
    bool removeSidePadding = false,
  }) =>
      _showCustomModalBottomSheet<Widget>(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(children: [
                  ChatifyBottomSheetWidget(
                    customChild: child(setState),
                    removeSidePadding: removeSidePadding,
                    showBottomDivider: showBottomSheet,
                  ),
                ]),
              );
            });
          });
}

//TODO: solve the background issue that may occur here
class ChatifyBottomSheetWidget extends StatefulWidget {
  const ChatifyBottomSheetWidget({
    super.key,
    this.actions,
    this.customChild,
    required this.showBottomDivider,
    this.removeSidePadding = false,
    this.customHeader,
  });
  final List<ChatifyBottomSheetItem>? actions;
  final Widget? customChild;
  final bool showBottomDivider, removeSidePadding;
  final Widget? customHeader;

  @override
  State<ChatifyBottomSheetWidget> createState() =>
      _ChatifyBottomSheetWidgetState();
}

class _ChatifyBottomSheetWidgetState extends State<ChatifyBottomSheetWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: const ElasticOutCurve(0.95), // Curves.elasticOut,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: widget.removeSidePadding ? 0 : 16,
        right: widget.removeSidePadding ? 0 : 16,
        bottom: 25,
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .85,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              15.verticalSpacing,
              const Align(
                  alignment: Alignment.center,
                  child: ChatifyWidgetsModalPill()),
              SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.customHeader != null) widget.customHeader!,
                      if (widget.actions != null) ...[
                        Flexible(
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            itemCount: widget.actions!.length,
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  overlayColor: const WidgetStatePropertyAll(
                                      Colors.transparent),
                                  onTap: widget.actions![index].onTap,
                                  child: Container(
                                    height: 52,
                                    color: Colors.transparent,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (widget.actions![index].icon !=
                                              null) ...[
                                            widget.actions![index].icon!,
                                            addHorizontalSpacing(16),
                                          ],
                                          Text(
                                            widget.actions![index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontWeight: widget
                                                          .actions![index]
                                                          .textWeight ??
                                                      FontWeight.w600,
                                                  color: widget.actions![index]
                                                          .textColor ??
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  fontSize: 16,
                                                ),
                                          ),
                                          if (widget.actions![index].endIcon !=
                                              null) ...[
                                            Spacer(),
                                            widget.actions![index].endIcon!,
                                            10.horizontalSpacing,
                                          ]
                                        ]),
                                  ),
                                )),
                            separatorBuilder: (context, index) => const Divider(
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                      if (widget.customChild != null) ...[
                        widget.customChild!,
                      ],
                    ]),
              ),
              if (widget.showBottomDivider) const Divider(height: 0),
              // addVerticalSpacing(10),
            ]),
      ),
    );
  }
}

Future<T?> _showCustomModalBottomSheet<T>(
    {required BuildContext context,
    required WidgetBuilder builder,
    double? elevation,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool? useSafeArea,
    bool isScrollControlled = false,
    bool useRootNavigator = true,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    // required String paddingChild,
    EdgeInsets padding = EdgeInsets.zero}) {
  return showModalBottomSheet<T>(
    context: context,
    builder: (BuildContext context) {
      return builder(context);
    },
    backgroundColor: Colors.transparent,
    elevation: elevation,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    clipBehavior: clipBehavior,
    useSafeArea: useSafeArea ?? false,
    constraints: constraints,
    barrierColor: barrierColor,
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
  );
}

class ChatifyBottomSheetItem {
  final Widget? icon;
  final Widget? endIcon;
  final VoidCallback onTap;
  final String title;
  final Color? textColor;
  final FontWeight? textWeight;

  ChatifyBottomSheetItem({
    this.icon,
    required this.onTap,
    required this.title,
    this.textColor,
    this.textWeight,
    this.endIcon,
  });
}

class ChatifyWidgetsModalPill extends StatelessWidget {
  const ChatifyWidgetsModalPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor.withOpacity(.15),
      ),
    );
  }
}
