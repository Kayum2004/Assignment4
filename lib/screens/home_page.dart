import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> quantities = [1, 1, 1];

  final List<int> itemPrices = [51, 30, 43];

  int get totalPrice {
    int total = 0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * itemPrices[i];
    }
    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildCartItem(
                  itemName: 'Pullover',
                  color: 'Black',
                  size: 'L',
                   price: itemPrices[0],
                  quantity: quantities[0],
                  onIncrease: () => increaseQuantity(0),
                  onDecrease: () => decreaseQuantity(0),
                  imageUrl: 'data:image/jpeg;base64,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', // Add image assets
                ),
                buildCartItem(
                  itemName: 'T-Shirt',
                  color: 'Gray',
                  size: 'L',
                   price: itemPrices[1],
                  quantity: quantities[1],
                  onIncrease: () => increaseQuantity(1),
                  onDecrease: () => decreaseQuantity(1),
                  imageUrl: 'data:image/jpeg;base64,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', // Add image assets
                ),
                buildCartItem(
                  itemName: 'Sport Dress',
                  color: 'Black',
                  size: 'M',
                  price: itemPrices[2],
                  quantity: quantities[2],
                  onIncrease: () => increaseQuantity(2),
                  onDecrease: () => decreaseQuantity(2),
                  imageUrl: 'data:image/jpeg;base64,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', // Add image assets
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                Text(
                  '\$${totalPrice}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('CHECK OUT'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.redAccent,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget buildCartItem({
    required String itemName,
    required String color,
    required String size,
    required int price,
    required int quantity,
    required VoidCallback onIncrease,
    required VoidCallback onDecrease,
    required String imageUrl,
  }) {



    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Replace with Image.network(imageUrl) if using network images
            Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('Color: $color, Size: $size'),
                  Row(
                    children: [
                      ElevatedButton(

                        child: Text('-',style: TextStyle(fontSize: 20),),
                        onPressed: onDecrease,
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(20, 20),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
                        ),
                      ),
                      Text('$quantity'),
                      // You can replace this with a dynamic quantity value
                  ElevatedButton(

                    child: Text('+',style: TextStyle(fontSize: 20),),
                    onPressed: onIncrease,
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(20, 20),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
                    ),
                  ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                Text('\$${price * quantity}'),

              ],
            ),
          ],
        ),
      ),
    );
  }


}