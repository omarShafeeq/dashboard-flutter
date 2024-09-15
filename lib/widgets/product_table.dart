import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductTable extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "product": "ASOS Ridley High Waist",
      "price": "\$79.49",
      "orders": 82,
      "avgQuantity": 8540,
      "seller": "Adidas",
    },
    {
      "product": "Marco Lightweight Shirt",
      "price": "\$12.50",
      "orders": 58,
      "avgQuantity": 6320,
      "seller": "Puma",
    },
    {
      "product": "Half Sleeve Shirt",
      "price": "\$9.99",
      "orders": 254,
      "avgQuantity": 10258,
      "seller": "Nike",
    },
    {
      "product": "Lightweight Jacket",
      "price": "\$69.99",
      "orders": 560,
      "avgQuantity": 1020,
      "seller": "Puma",
    },
    {
      "product": "Marco Sport Shoes",
      "price": "\$119.99",
      "orders": 75,
      "avgQuantity": 357,
      "seller": "Adidas",
    },
    {
      "product": "Custom Women's T-shirts",
      "price": "\$45.00",
      "orders": 85,
      "avgQuantity": 135,
      "seller": "Branded",
    },
    {
      "product": "Marco Sport Shoes",
      "price": "\$119.99",
      "orders": 75,
      "avgQuantity": 357,
      "seller": "Adidas",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Expanded(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Selling Products',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement export functionality here
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Export',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_downward_outlined,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dataRowHeight: 32.0,
                  columns: const [
                    DataColumn(label: Expanded(child: Text('Product'))),
                    DataColumn(label: Expanded(child: Text('Price'))),
                    DataColumn(label: Expanded(child: Text('Orders'))),
                    DataColumn(label: Expanded(child: Text('Avl. Quantity'))),
                    DataColumn(label: Expanded(child: Text('Seller'))),
                  ],
                  rows: products.map((product) {
                    return DataRow(cells: [
                      DataCell(Text(product['product'])),
                      DataCell(Text(product['price'])),
                      DataCell(Text(product['orders'].toString())),
                      DataCell(Text(product['avgQuantity'].toString())),
                      DataCell(Text(product['seller'])),
                    ]);
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Implement view all functionality here
                },
                child: Center(child: Text('View All')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
