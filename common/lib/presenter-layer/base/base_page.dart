import 'package:common/presenter-layer/base/base_widget.dart';
import 'package:common/presenter-layer/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/foundation.dart';

abstract class BasePage extends StatefulHookConsumerWidget {
  const BasePage({super.key});
}

abstract class BasePageState<T extends BasePage> extends ConsumerState<T> {}

/// This class is three Baseclass for State class of the widget
abstract class BaseStatefulPage<B extends BasePage> extends BasePageState<B> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _getLayout();
  }

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
          resizeToAvoidBottomInset: resizeToBottomInset(),
          backgroundColor: Colors.white,
          appBar: buildAppbar(),
          extendBodyBehindAppBar: extendBodyBehindAppBar(),
          body: _buildScaffoldBody(context),
        );
      },
    );
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool resizeToBottomInset(){
    return false;
}

  /// Body of the page.
  Widget _buildScaffoldBody(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(tablet: 800, desktop: 1200, watch: 300),
      mobile: (context) {
        return buildMobileView(context, kIsWeb);
      },
      tablet: (context) {
        return buildTabletView(context);
      },
      desktop: (context) {
        return buildWebView(context);
      },
    );
  }

  /// mobile body of the page.
  @mustCallSuper
  Widget buildMobileView(BuildContext context, bool isWeb);

  /// tablet body of the page.
  @mustCallSuper
  Widget buildTabletView(BuildContext context) {
    return Center(
      child: Text("Tablet View"),
    );
  }

  /// web body of the page.
  @mustCallSuper
  Widget buildWebView(BuildContext context) {
    return Center(
      child: Text("Website View"),
    );
  }
}

abstract class BasePageViewWidget extends HookConsumerWidget {
  BasePageViewWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseWidget(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return build(context, ref);
      },
    );
  }
}
