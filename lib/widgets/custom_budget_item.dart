
import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/models/budget.dart';
import 'package:flutter/material.dart';

class CustomBudgetItem extends StatelessWidget {
  final Budget budget;

  const CustomBudgetItem({Key? key, required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          budget.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPeriodRow("${budget.startDate} - ${budget.endDate}"),
            const SizedBox(height: 8.0),
            _buildAmountRow("Prévu", budget.plannedAmount),
            const SizedBox(height: 8.0),
            _buildAmountRow("Dépensé", budget.spentAmount),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_rounded),
        onTap: () {
          // Action when tapping on the budget item
        },
      ),
    );
  }

  Widget _buildPeriodRow(String period) {
    return Row(
      children: [
        Icon(Icons.date_range, color: AppColors.color14),
        const SizedBox(width: 8.0),
        Text(
          period,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAmountRow(String label, double amount) {
    return Row(
      children: [
        Icon(
          label == "Prévu" ? Icons.attach_money : Icons.money_off,
          color: label == "Prévu" ? AppColors.color13 : AppColors.color6,
        ),
        const SizedBox(width: 8.0),
        Text(
          "$label : \$${amount.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
