import 'package:go_router/go_router.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/home_page.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  )
]);
