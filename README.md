# Mzansi Budget Tracker 🇿🇦

A beautiful, intuitive mobile app to track personal income, expenses, and budgets, built with **Flutter** and designed for South African users.

---

## Table of Contents
1. [Overview](#overview)  
2. [Features](#features)  
3. [Screenshots](#screenshots)  
4. [Tech Stack](#tech-stack)  
5. [Installation](#installation)  
6. [Usage](#usage)  
7. [Project Structure](#project-structure)  
8. [Future Improvements](#future-improvements)  
9. [Contributing](#contributing)  
10. [License](#license)  

---

## Overview
Mzansi Budget Tracker helps South African users manage their personal finances with ease. Track income and expenses in Rand (ZAR), categorize spending, and visualize your budget trends with beautiful, locally-inspired design.

---

## Features
✅ **Current Features:**
- Beautiful South African-themed UI with green color scheme
- Monthly budget overview with progress tracking
- Transaction management (income and expenses)
- Category-based spending (Groceries, Petrol, Electricity, etc.)
- Real-time budget calculations
- ZAR currency formatting
- Responsive design for all screen sizes

🚧 **Planned Features:**
- User authentication with Supabase
- Data persistence and cloud sync
- Expense categories management
- Monthly/weekly/daily summaries
- Visual charts for spending trends
- Budget alerts and notifications
- Export data to CSV/PDF
- Multi-account support

---

## Screenshots
*(Screenshots will be added once the app is fully developed)*

---

## Tech Stack
- **Frontend:** Flutter 3.8+
- **Language:** Dart
- **State Management:** StatefulWidget (will migrate to Provider/Riverpod)
- **Database:** Local storage (will integrate Supabase)
- **Currency Formatting:** intl package
- **Charts:** fl_chart (planned)
- **Authentication:** Supabase Auth (planned)

---

## Installation

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- Android emulator or physical device

### Steps
1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/mzansi-budget-tracker.git
cd mzansi-budget-tracker
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the app:**
```bash
flutter run
```

4. **For specific devices:**
```bash
# Android emulator
flutter run -d emulator-5554

# macOS desktop
flutter run -d macos

# Chrome web
flutter run -d chrome
```

---

## Usage

### Getting Started
1. Launch the app
2. View your monthly budget overview on the home screen
3. Check your spending progress with the visual progress bar
4. Review recent transactions in the transaction list
5. Tap the + button to add new transactions (coming soon)

### Current Functionality
- **Budget Overview:** See your total monthly budget, spent amount, and remaining balance
- **Progress Tracking:** Visual progress bar showing spending percentage
- **Transaction History:** View recent income and expense transactions
- **Quick Stats:** Weekly spending and savings overview

---

## Project Structure
```
lib/
├── main.dart                 # App entry point and main UI
├── models/                   # Data models (planned)
│   ├── transaction.dart
│   ├── category.dart
│   └── budget.dart
├── screens/                  # App screens (planned)
│   ├── home_screen.dart
│   ├── add_transaction_screen.dart
│   ├── categories_screen.dart
│   └── settings_screen.dart
├── widgets/                  # Reusable widgets (planned)
│   ├── transaction_card.dart
│   ├── budget_overview.dart
│   └── stat_card.dart
├── services/                 # Business logic (planned)
│   ├── database_service.dart
│   └── auth_service.dart
└── utils/                    # Utilities (planned)
    ├── constants.dart
    └── helpers.dart
```

---

## Development Roadmap

### Phase 1: Core Functionality ✅
- [x] Basic UI design
- [x] Budget overview display
- [x] Transaction list view
- [x] ZAR currency formatting
- [x] Responsive design

### Phase 2: Data Management 🚧
- [ ] Add transaction functionality
- [ ] Edit/delete transactions
- [ ] Category management
- [ ] Local data persistence
- [ ] Data validation

### Phase 3: Advanced Features 📋
- [ ] Supabase integration
- [ ] User authentication
- [ ] Cloud data sync
- [ ] Charts and analytics
- [ ] Budget alerts
- [ ] Export functionality

### Phase 4: Polish & Deploy 📋
- [ ] App icons and splash screen
- [ ] Performance optimization
- [ ] Testing (unit & integration)
- [ ] Play Store deployment
- [ ] App Store deployment

---

## Contributing
We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter/Dart best practices
- Use meaningful commit messages
- Add comments for complex logic
- Test your changes thoroughly
- Update documentation as needed

---

## Future Improvements
- **AI-powered insights:** Smart spending recommendations
- **Bank integration:** Automatic transaction import
- **Family budgets:** Shared budget management
- **Investment tracking:** Portfolio management
- **Bill reminders:** Automated payment alerts
- **Offline mode:** Full offline functionality
- **Dark mode:** Theme customization
- **Multi-language:** Support for local languages

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Support
If you encounter any issues or have questions:
- Create an issue on GitHub
- Email: support@mzansibudget.co.za
- Twitter: @MzansiBudget

---

## Acknowledgments
- Flutter team for the amazing framework
- South African fintech community for inspiration
- Contributors and testers

---

**Made with ❤️ in South Africa**