import 'package:flutter/material.dart';
import 'package:wazzaf/core/class/text_style.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;

  const StepProgress({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    switch (currentStep) {
      case 1:
        return _buildStep(
          step1: true,
          line1: false,
          step2: false,
          line2: false,
          step3: false,
        );

      case 2:
        return _buildStep(
          step1: true,
          line1: true,
          step2: true,
          line2: false,
          step3: false,
        );

      case 3:
        return _buildStep(
          step1: true,
          line1: true,
          step2: true,
          line2: true,
          step3: true,
        );

      default:
        return const SizedBox();
    }
  }

  Widget _buildStep({
    required bool step1,
    required bool line1,
    required bool step2,
    required bool line2,
    required bool step3,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _StepCircle(isActive: step1),
          _StepLine(isActive: line1),
          _StepCircle(isActive: step2),
          _StepLine(isActive: line2),
          _StepCircle(isActive: step3),
        ],
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  final bool isActive;

  const _StepCircle({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppTextStyle.bottomColor : Colors.grey.shade300,
      ),
      // child: isActive
      //     ? const Icon(Icons.check, size: 16, color: Colors.white)
      //     : null,
    );
  }
}

class _StepLine extends StatelessWidget {
  final bool isActive;

  const _StepLine({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.blue : Colors.grey.shade300,
      ),
    );
  }
}
