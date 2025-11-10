import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';
import 'screens/add_transaction_screen.dart';

void main() {
  runApp(const BudgetApp());
}

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mzansi Budget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // SA Green
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const BudgetHomePage(),
    );
  }
}

class BudgetHomePage extends StatefulWidget {
  const BudgetHomePage({super.key});

  @override
  State<BudgetHomePage> createState() => _BudgetHomePageState();
}

class _BudgetHomePageState extends State<BudgetHomePage> {
  double totalBudget = 15000.0;
  
  List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Salary',
      amount: 15000.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: TransactionCategory.salary,
    ),
    Transaction(
      id: '2',
      title: 'Groceries - Pick n Pay',
      amount: -850.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: TransactionCategory.groceries,
    ),
    Transaction(
      id: '3',
      title: 'Petrol - Shell',
      amount: -650.0,
      date: DateTime.now().subtract(const Duration(days: 3)),
      category: TransactionCategory.transport,
    ),
    Transaction(
      id: '4',
      title: 'Electricity Bill',
      amount: -1200.0,
      date: DateTime.now().subtract(const Duration(days: 5)),
      category: TransactionCategory.utilities,
    ),
  ];

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'en_ZA', symbol: 'R');
    return formatter.format(amount);
  }

  double get totalIncome {
    return transactions.where((t) => t.isIncome).fold(0.0, (sum, t) => sum + t.amount);
  }

  double get totalExpenses {
    return transactions.where((t) => t.isExpense).fold(0.0, (sum, t) => sum + t.amount.abs());
  }

  void _addTransaction(Transaction transaction) {
    setState(() {
      transactions.insert(0, transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    double remaining = totalBudget - totalExpenses;
    double progress = totalExpenses / totalBudget;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Mzansi Budget', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Budget Overview Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Budget',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatCurrency(totalBudget),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white30,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Spent: ${formatCurrency(totalExpenses)}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'Left: ${formatCurrency(remaining)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Stats
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Income',
                    formatCurrency(totalIncome),
                    Icons.trending_up,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Savings',
                    formatCurrency(remaining),
                    Icons.savings,
                    Colors.green,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Recent Transactions
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E2E2E),
              ),
            ),
            const SizedBox(height: 12),
            
            ...transactions.take(5).map((transaction) => _buildTransactionCard(transaction)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTransactionScreen(
                onAddTransaction: _addTransaction,
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFF2E7D32),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  
  Widget _buildStatCard(String title, String amount, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTransactionCard(Transaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: transaction.category.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              transaction.category.icon,
              color: transaction.category.color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              transaction.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            formatCurrency(transaction.amount),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: transaction.amount > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}