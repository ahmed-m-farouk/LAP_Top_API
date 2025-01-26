import 'package:flutter/material.dart';
import 'package:post_login/future_Lap/home/model/model/laptop_model/lap_home.dart';

// واجهة عرض تفاصيل اللابتوب
class WidgetScreenLap extends StatelessWidget {
  const WidgetScreenLap({super.key, required this.model});
  final LaptopModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  model.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // اسم المنتج والشركة
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "By ${model.company}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),
            // السعر
            Text(
              "\$${model.price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            // الوصف
            const Text(
              "Description:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              model.description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            // الفئة والحالة
            Row(
              children: [
                Chip(
                  label: Text(
                    model.category,
                    style: const TextStyle(fontSize: 14),
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    model.status,
                    style: const TextStyle(fontSize: 14),
                  ),
                  backgroundColor: model.status == "Available"
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // معلومات المخزون
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Stock:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  model.countInStock > 0
                      ? "${model.countInStock} units available"
                      : "Out of stock",
                  style: TextStyle(
                    fontSize: 14,
                    color: model.countInStock > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // زر الشراء
            if (model.countInStock > 0)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action for purchase
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Added to cart!"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Buy Now"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            else
              Center(
                child: Text(
                  "Out of Stock",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red.shade700,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
