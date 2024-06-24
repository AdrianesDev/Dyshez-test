import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/screens/Quick_menu/Components/order_history_card.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: opaqueWhiteBackground,
        appBar: AppBar(
          backgroundColor: opaqueWhiteBackground,
          leading: CustomBackButton(
            action: () {},
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                size: 32,
              ),
            ),
          ],
          title: const Text("Historial",
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: darkBlue)),
        ),
        body: Container(
          width: mobileWidth,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.08),
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pedidos anteriores",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: opaqueGrayColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return OrderHistoryCard();
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
