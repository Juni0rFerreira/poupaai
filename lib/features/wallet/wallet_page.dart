import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _HomePageState();
}

class _HomePageState extends State<WalletPage> 
    with AutomaticKeepAliveClientMixin<WalletPage> {
    @override
    bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      body: Center(
        child: Text("Wallet Page"),
      ),
    );
  }
}