import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transaction_model.dart';

class ChartsWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const ChartsWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final expenseData = transactions.where((tx) => tx.isExpense);
    final incomeData = transactions.where((tx) => !tx.isExpense);

    double totalExpenses = expenseData.fold(0, (sum, tx) => sum + tx.amount);
    double totalIncome = incomeData.fold(0, (sum, tx) => sum + tx.amount);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Expense vs Income", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 200, child: PieChart(PieChartData(sections: [
              PieChartSectionData(
                value: totalExpenses,
                color: Colors.red,
                title: 'Expenses',
              ),
              PieChartSectionData(
                value: totalIncome,
                color: Colors.green,
                title: 'Income',
              ),
            ]))),
          ],
        ),
      ),
    );
  }
}