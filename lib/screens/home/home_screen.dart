import 'package:cash_control/constants/colors.dart';
import 'package:cash_control/constants/images.dart';
import 'package:cash_control/models/budget.dart';
import 'package:cash_control/screens/auth/login/login_screen.dart';
import 'package:cash_control/screens/onboarding/onboarding_screen.dart';
import 'package:cash_control/widgets/accordion_widget.dart';
import 'package:cash_control/widgets/custom_budget_item.dart';
import 'package:cash_control/widgets/zoom_inverse.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Budget> budgets = [
    Budget(
      name: 'Projet d\'études',
      startDate: '01/01/2024',
      endDate: '12/31/2024',
      plannedAmount: 250000,
      spentAmount: 83000,
    ),
    Budget(
      name: 'Voyage',
      startDate: '03/15/2024',
      endDate: '03/30/2024',
      plannedAmount: 13000,
      spentAmount: 5000,
    ),
    Budget(
      name: "Achat d'une voiture",
      startDate: '03/15/2024',
      endDate: '03/30/2024',
      plannedAmount: 13000,
      spentAmount: 5000,
    ),
  ];

  // Fonction pour calculer le total prévu
  double calculateTotalPlanned() {
    return budgets
        .map((budget) => budget.plannedAmount)
        .fold(0, (a, b) => a + b);
  }

  // Fonction pour calculer le total dépensé
  double calculateTotalSpent() {
    return budgets.map((budget) => budget.spentAmount).fold(0, (a, b) => a + b);
  }

  Widget totalItem(Color color, String text, String imageAsset, String value) {
    return Container(
    width: 150,
    height: 120,
    decoration: BoxDecoration(
        color: AppColors.color5,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color, width: 3)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        const SizedBox(
          height: 6,
        ),
        Image.asset(
          imageAsset,
          width: 40,
          height: 40,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ),
        )
      ],
    ),
        )
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.money_bag_icon,
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Gérons au mieux votre argent.",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8),
          //   child: Row(
          //   children: [
          //     Expanded(
          //         child: Card(
          //       elevation: 6,
          //       child: Container(
          //         height: 60,
          //         decoration: BoxDecoration(
          //             color: Theme.of(context).colorScheme.background,
          //             borderRadius: const BorderRadius.only(
          //                 topRight: Radius.circular(12),
          //                 bottomLeft: Radius.circular(12))),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             LottieAnimation(
          //               animationAsset: getGreetingAnimation(),
          //               width: 80,
          //               height: 80,
          //             ),
          //             Center(
          //               child: Text(
          //                 getGreetings(),
          //                 style: TextStyle(
          //                     color: AppColors.color3,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //             IconButton(
          //               icon: Icon(Icons.brightness_4, color: Theme.of(context).colorScheme.primary,),
          //               onPressed: () {
          //                 Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          //               },
          //             ),
          //           ],
          //         ),
          //       ),
          //     )),
          //   ],
          //             ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.color9,
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    VerticalDivider(
                      color: AppColors.color3,
                      thickness: 4,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        // Handle account creation logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.color3,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Définir un budget',
                            style: TextStyle(
                              color: AppColors.color5,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.edit_note,
                            color: AppColors.color4,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Budget actifs",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                totalItem(AppColors.color10 ,"Total Prévu", AppImages.financial_icon, '\$${calculateTotalPlanned()}'),
                totalItem(AppColors.color11 ,"Total Dépensé", AppImages.spending_icon2, '\$${calculateTotalSpent()}')
              ],
            ),
          ),
          // Liste des budgets actifs
          Expanded(
            child: ListView.builder(
              itemCount: budgets.length,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                final budget = budgets[index];

                return CustomBudgetItem(budget: budget);
              },
            ),
          ),
          // const AccordionWidget()
          
        ],
      ),
    );
  }
}
