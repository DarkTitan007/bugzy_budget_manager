💰 Smart Budget Manager (Flutter + Firebase)
A personal finance management app built with Flutter, Firebase, and modern UI widgets. Easily track income, expenses, and budget insights using charts and gauges.


✨ Features
🔐 Google Sign-In with Firebase Authentication

☁️ Firestore Cloud Database for transactions

📊 Income vs. Expense Pie Chart using fl_chart

🎯 Budget tracking with radial gauge using syncfusion_flutter_gauges

➕ Add and view transactions (sample data injection supported)

🔁 Live sync across devices via Firebase

📱 Responsive, Material Design UI



| Framework                                | Plugin/Service                                                        |
| ---------------------------------------- | --------------------------------------------------------------------- |
| Flutter                                  | `firebase_core`, `firebase_auth`, `cloud_firestore`, `google_sign_in` |
| Charts                                   | `fl_chart`, `syncfusion_flutter_gauges`                               |
| State Management                         | `provider`                                                            |
| Notifications & Local Storage (optional) | `flutter_local_notifications`, `hive`                                 |


🧠 How It Works
Users sign in via Google

Transactions (income/expenses) are stored in Firestore

Budget and expenses are visualized using charts/gauges

Transactions can be added or viewed dynamically

Local dummy data support for offline testing
