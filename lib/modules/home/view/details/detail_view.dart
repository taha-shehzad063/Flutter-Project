import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/modules/home/viewmodel/detail_viewmodel.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  static const _orange = Colors.deepOrange;
  static const _peach = Color(0xFFFFF0E0);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DetailViewModel());
    const sizes = ['10"', '14"', '16"'];
    const icons = [
      Icons.local_pizza,
      Icons.grass,
      Icons.egg_alt,
      Icons.water_drop,
      Icons.spa,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _circleBtn(
                  onTap: Get.back,
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: _peach,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/icons/pizzaimage.png',
                            height: 190,
                            width: 190,
                            fit: BoxFit.contain,
                          ),
                        ),
                  
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: Obx(
                            () => _circleBtn(
                              onTap: c.toggleFavorite,
                              child: Icon(
                                c.isFavorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 20,
                                color: c.isFavorite.value
                                    ? _orange
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: _orange.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.store,
                                  size: 16,
                                  color: _orange,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Uttora Coffee House',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'Pizza Calzone European',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Prosciutto e funghi is a pizza variety that is\ntopped with tomato sauce.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          _infoChip(Icons.star_rounded, '4.7', Colors.amber),
                          const SizedBox(width: 14),
                          _infoChip(
                            Icons.electric_bike_outlined,
                            'Free',
                            _orange,
                          ),
                          const SizedBox(width: 14),
                          _infoChip(
                            Icons.access_time_rounded,
                            '20 min',
                            Colors.grey,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          _label('SIZE:'),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Obx(
                              () => Row(
                                children: List.generate(
                                  sizes.length,
                                  (i) => _sizeChip(
                                    label: sizes[i],
                                    isActive: c.selectedSizeIndex.value == i,
                                    onTap: () => c.selectSize(i),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 22),

                      _label('INGRIDENTS'),
                      const SizedBox(height: 12),
                      Row(
                        children: icons
                            .map(
                              (icon) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    color: _peach,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(icon, size: 24, color: _orange),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                const Text(
                  r'$32',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _cartBtn(Icons.remove, c.decrementQuantity),
                      const SizedBox(width: 14),
                      Obx(
                        () => Text(
                          '${c.quantity.value}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      _cartBtn(Icons.add, c.incrementQuantity),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _label(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    ),
  );

  Widget _circleBtn({required VoidCallback onTap, required Widget child}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(child: child),
        ),
      );

  Widget _infoChip(IconData icon, String label, Color color) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 18, color: color),
      const SizedBox(width: 4),
      Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    ],
  );

  Widget _sizeChip({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 10),
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle, 
        color: isActive ? _orange : Colors.white,
        border: Border.all(
          color: isActive ? _orange : Colors.grey.shade300,
          width: 1.5,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: _orange.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : Colors.black87,
          ),
        ),
      ),
    ),
  );

  Widget _cartBtn(IconData icon, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, color: Colors.white, size: 18)),
    ),
  );
}
