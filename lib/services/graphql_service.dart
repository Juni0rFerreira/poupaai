import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:poupaai/services/auth_service.dart';

class GraphQLService {
  final AuthService authService;

  GraphQLService({
    required this.authService,
  });

  late GraphQLClient client;

  Future<void> init() async {
    final token = await authService.userToken;

    final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  final Link link = authLink.concat(httpLink);

  client = GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
