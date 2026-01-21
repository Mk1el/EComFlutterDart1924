import "package:ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_images.dart";
import "package:flutter/material.dart";

class TcurvedEdgeWidget extends StatelessWidget {

  const TcurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    
    
    );
  }
}