
import 'package:flutter/foundation.dart';
import 'package:poupaai/common/models/transaction_model.dart';
import 'package:poupaai/features/home/home_page_state.dart';
import 'package:poupaai/repositories/transaction_repository.dart';

class HomePageController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  HomePageController(this._transactionRepository);

  HomePageState _state = HomePageIntialState();

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  HomePageState get state => _state;

 void _changeState(HomePageState newState) {
 _state = newState;
 notifyListeners();
}

  Future<void> getAllTransaction() async {
    _changeState(HomePageLoadingState());
    try {
      _transactions = await _transactionRepository.getAllTransaction();
      _changeState(HomePageSuccessState()) ;
    } catch (e) {
      _changeState(HomePageErrorState());
    }
  }
}