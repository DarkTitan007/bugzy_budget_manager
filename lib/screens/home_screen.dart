import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../services/transaction_service.dart';
import '../models/transaction_model.dart';
import '../widgets/budget_widget.dart';
import '../widgets/charts_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final txService = Provider.of<TransactionService>(context);

    double totalSpent = txService.transactions
        .where((tx) => tx.isExpense)
        .fold(0, (sum, tx) => sum + tx.amount);
    double monthlyBudget = 1000.0; // You can customize or make this user-defined

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => auth.signOut(),
          ),
        ],
      ),
      body: Column(
        children: [
          BudgetWidget(spent: totalSpent, budget: monthlyBudget),
          Expanded(child: ChartsWidget(transactions: txService.transactions)),
          Expanded(
            child: ListView.builder(
              itemCount: txService.transactions.length,
              itemBuilder: (context, index) {
                final tx = txService.transactions[index];
                return ListTile(
                  title: Text(tx.title),
                  subtitle: Text(tx.date.toIso8601String()),
                  trailing: Text(
                    "${tx.isExpense ? "-" : "+"}\$${tx.amount.toStringAsFixed(2)}",
                    style: TextStyle(color: tx.isExpense ? Colors.red : Colors.green),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => txService.addDummyTransaction(),
            child: Text("Add Sample Transaction"),
          )
        ],
      ),
    );
  }
}