import 'package:flutter/material.dart';

class CustomCompaniesIcon extends StatelessWidget {
  const CustomCompaniesIcon({super.key, this.width = 40, this.height = 32, this.color});
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(height, width),
        painter: IconPainter(color),
      ),
    );
  }
}

class IconPainter extends CustomPainter {
  final Color? color;

  IconPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Define a largura da borda

    // Função para desenhar um retângulo com borda superior menor (trapezoide)
    void drawTrapezoid(Canvas canvas, Offset center, double widthTop, double widthBottom, double height) {
      final path = Path()
        ..moveTo(center.dx - widthTop / 2, center.dy - height / 2)
        ..lineTo(center.dx + widthTop / 2, center.dy - height / 2)
        ..lineTo(center.dx + widthBottom / 2, center.dy + height / 2)
        ..lineTo(center.dx - widthBottom / 2, center.dy + height / 2)
        ..close();
      canvas.drawPath(path, paint);
    }

    var widthTop2 = size.width / 3.5;
    var widthBottom2 = size.width / 2.5;
    var height2 = size.height / 5;
    // Desenha o retângulo superior
    drawTrapezoid(
      canvas,
      Offset(size.width / 2, size.height / 2.75),
      widthTop2,
      widthBottom2,
      height2,
    );

    // Desenha o retângulo inferior esquerdo
    drawTrapezoid(
      canvas,
      Offset(size.width / 5, 3 * size.height / 4.25),
      widthTop2,
      widthBottom2,
      height2,
    );

    // Desenha o retângulo inferior direito
    drawTrapezoid(
      canvas,
      Offset(3 * size.width / 3.75, 3 * size.height / 4.25),
      widthTop2,
      widthBottom2,
      height2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
