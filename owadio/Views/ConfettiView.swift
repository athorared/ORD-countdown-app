//
//  ConfettiView.swift
//  owadio
//
//  Created by Alexander Zhou on 23/11/24.
//

import SwiftUI
import UIKit

// UIViewRepresentable for Confetti
struct ConfettiView: UIViewRepresentable {
    class Coordinator: NSObject {
        var emitterLayer: CAEmitterLayer?

        func startConfetti() {
            let confettiLayer = CAEmitterLayer()

            // Set emitter position
            confettiLayer.emitterPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
            confettiLayer.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
            confettiLayer.emitterShape = .line

            // Configure confetti cells
            let colors: [UIColor] = [.red, .green, .blue, .yellow, .orange, .purple]
            confettiLayer.emitterCells = colors.map { color in
                let cell = CAEmitterCell()
                cell.birthRate = 10
                cell.lifetime = 7.0
                cell.velocity = CGFloat.random(in: 150...250)
                cell.velocityRange = 50
                cell.emissionLongitude = .pi
                cell.spin = 3.5
                cell.spinRange = 1.0
                cell.scale = 0.2
                cell.scaleRange = 0.1
                cell.color = color.cgColor
                cell.contents = UIImage(systemName: "circle.fill")?.cgImage
                return cell
            }

            emitterLayer = confettiLayer
        }

        func stopConfetti() {
            emitterLayer?.birthRate = 0
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        // Add confetti emitter
        let coordinator = context.coordinator
        coordinator.startConfetti()
        if let emitterLayer = coordinator.emitterLayer {
            view.layer.addSublayer(emitterLayer)
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Can be used to start/stop animation dynamically
    }
}
