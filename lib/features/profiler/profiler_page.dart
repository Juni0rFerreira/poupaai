
import 'package:flutter/material.dart';
import 'package:poupaai/locator.dart';
import 'package:poupaai/services/auth_service.dart';
import 'package:poupaai/services/secure_storage.dart';

class ProfilerPage extends StatefulWidget {
  const ProfilerPage({super.key});

  @override
  State<ProfilerPage> createState() => _ProfilerPageState();
}

class _ProfilerPageState extends State<ProfilerPage>
    with AutomaticKeepAliveClientMixin<ProfilerPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await locator.get<AuthService>().signOut();
                await const SecureStorage().deleteAll();
                if (mounted) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
