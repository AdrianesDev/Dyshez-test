import 'package:dyshez_app/components/custom_button.dart';
import 'package:dyshez_app/screens/Order_view/Components/order_items.dart';
import 'package:dyshez_app/utils/Colors/general_colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrdenViewScreen extends StatefulWidget {
  const OrdenViewScreen({super.key});

  @override
  State<OrdenViewScreen> createState() => _OrdenViewScreenState();
}

class _OrdenViewScreenState extends State<OrdenViewScreen> {
  void goBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final double mobileWidth = MediaQuery.of(context).size.width;
    final double mobileHeight = MediaQuery.of(context).size.height;
    bool isCompletedOrder = true;
    bool isDyshezDirect = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: opaqueWhiteBackground,
        appBar: AppBar(
          backgroundColor: opaqueWhiteBackground,
          leading: CustomBackButton(
            action: () => goBack(),
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 220,
                width: mobileWidth,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 28,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://media-cdn.tripadvisor.com/media/photo-s/1c/2f/33/2d/healthy-bowl-frische.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              OrderDetailView(
                isCompletedOrder: isCompletedOrder,
                mobileWidth: mobileWidth,
                isDyshezDirect: isDyshezDirect,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({
    super.key,
    required this.isCompletedOrder,
    required this.mobileWidth,
    required this.isDyshezDirect,
  });

  final bool isCompletedOrder;
  final double mobileWidth;
  final bool isDyshezDirect;

  @override
  Widget build(BuildContext context) {
    return isDyshezDirect
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*Header
                HeaderOrder(isCompletedOrder: isCompletedOrder),
                const SizedBox(
                  height: 20,
                ),
                //*Order details
                OrderDetails(mobileWidth: mobileWidth),
                const SizedBox(
                  height: 20,
                ),
                //*pay method
                const PayMethod(),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  backgroundColor: pink,
                  foreground: white,
                  text: "Volver a ordenar",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: isCompletedOrder,
                  child: CustomButton(
                    backgroundColor: white,
                    foreground: black,
                    hasBorder: true,
                    border: Border.all(color: grayColor, width: 2),
                    text: "Ver recibo",
                    buttonHeight: 52,
                    buttonWidth: mobileWidth,
                    action: () {},
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  backgroundColor: white,
                  foreground: black,
                  hasBorder: true,
                  border: Border.all(color: grayColor, width: 2),
                  text: "Ver factura",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: isCompletedOrder,
                  child: CustomButton(
                    backgroundColor: white,
                    foreground: black,
                    hasBorder: true,
                    border: Border.all(color: grayColor, width: 2),
                    text: "¿Necesitas ayuda?",
                    buttonHeight: 52,
                    buttonWidth: mobileWidth,
                    action: () {},
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                //*Header
                HeaderOrder(isCompletedOrder: isCompletedOrder),
                const SizedBox(
                  height: 20,
                ),
                //*Order details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tu pedido",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reserva de Promo Live",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: black,
                          ),
                        ),
                        Text(
                          "\$0.00",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Pagado",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: black,
                            )),
                        Text("\$0.00",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: black,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ColoredBox(
                      color: grayColor,
                      child: SizedBox(
                        height: 2,
                        width: mobileWidth,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //*pay method
                const PayMethod(),
                CustomButton(
                  backgroundColor: white,
                  foreground: black,
                  hasBorder: true,
                  border: Border.all(color: grayColor, width: 2),
                  text: "Ver factura",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  backgroundColor: white,
                  foreground: black,
                  hasBorder: true,
                  border: Border.all(color: grayColor, width: 2),
                  text: "¿Necesitas ayuda?",
                  buttonHeight: 52,
                  buttonWidth: mobileWidth,
                  action: () {},
                ),
              ],
            ),
          );
  }
}

class PayMethod extends StatelessWidget {
  const PayMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Método de pago",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: black,
                )),
            Row(
              children: [
                Image.asset(
                  "assets/images/png/visa-logo.png",
                  width: 40,
                  height: 40,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ICIC Bank Card",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: black,
                        )),
                    Text(
                      "***********5486",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: grayBoldColor,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.mobileWidth,
  });

  final double mobileWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tu pedido",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const OrderItems();
              }),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total de articulos",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
            Text(
              "\$792.00",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Descuentos",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: greenSuccess,
              ),
            ),
            Text(
              "-\$172.00",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: greenSuccess,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Envío",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
            Text(
              "\$60.00",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Propina",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
            Text(
              "\$13.00",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Pagado",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black,
                )),
            Text("\$693.00",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black,
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ColoredBox(
          color: grayColor,
          child: SizedBox(
            height: 2,
            width: mobileWidth,
          ),
        )
      ],
    );
  }
}

class HeaderOrder extends StatelessWidget {
  const HeaderOrder({
    super.key,
    required this.isCompletedOrder,
  });

  final bool isCompletedOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Habibi",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
        Row(
          children: [
            Text(
              isCompletedOrder ? "Completado . " : "Cancelado . ",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isCompletedOrder ? greenSuccess : redCancel,
              ),
            ),
            const Text(
              "Abr 13 a las 11:53 AM",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: grayBoldColor,
              ),
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20,
              color: grayBoldColor,
            ),
            Text(
              "Benito Juárez #213",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: grayBoldColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
