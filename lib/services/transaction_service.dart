import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_model.dart';

class TransactionService with ChangeNotifier {
  final List<TransactionModel> _transactions = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<TransactionModel> get transactions => _transactions;

  TransactionService() {
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    final snapshot = await _firestore.collection("transactions").get();
    _transactions.clear();
    _transactions.addAll(snapshot.docs.map((doc) => TransactionModel.fromMap(doc.data())).toList());
    notifyListeners();
  }

  Future<void> addTransaction(TransactionModel tx) async {
    await _firestore.collection("transactions").doc(tx.id).set(tx.toMap());
    _transactions.add(tx);
    notifyListeners();
  }

  void addDummyTransaction() {
    final tx = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: "Sample Expense",
      amount: 20.0,
      date: DateTime.now(),
      isExpense: true,
    );
    addTransaction(tx);
  }
}