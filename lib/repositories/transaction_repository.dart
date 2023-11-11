

import 'package:poupaai/common/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();
  Future<List<TransactionModel>> getAllTransaction();
}

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransaction() {
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      TransactionModel(
        title: "Salario",
        value: 500,
        date: DateTime.now().microsecondsSinceEpoch,
      ),
      TransactionModel(
        title: "Aluguel",
        value: -50,
        date: DateTime.now()
            .subtract(const Duration(days: 7))
            .microsecondsSinceEpoch,
      ),
    ];
  }
}
