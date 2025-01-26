import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_login/future_Lap/home/cupit/lap_top_cubit.dart';
import 'package:post_login/future_Lap/home/view/widgets/widgets_Screen_lap/widget_Screen_Lap.dart';

class ScreenLap extends StatelessWidget {
  const ScreenLap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LapTopCubit()..getLaptopcupit(),
      child: BlocBuilder<LapTopCubit, LapTopState>(
        builder: (context, state) {
          if (state is LapTopsuccess) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Laptops'),
                centerTitle: true,
                backgroundColor: Colors.blue,
              ),
              body: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.viewlap.length,
                itemBuilder: (context, index) {
                  final laptop = state.viewlap[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          laptop.image,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported, size: 40),
                        ),
                      ),
                      title: Text(
                        laptop.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("By ${laptop.company}"),
                      trailing: Text(
                        "\$${laptop.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WidgetScreenLap(model: laptop),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is LapTopFaluier) {
            return const Scaffold(
              body: Center(
                child: Text(
                  "Failed to load laptops. Please try again.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          } else if (state is LapTopLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Scaffold(
              body: Center(child: Text('جارٍ التحميل...')),
            );
          }
        },
      ),
    );
  }
}
