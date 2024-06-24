//
//  ParticleEffect.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 24.06.24.
//

import SwiftUI

struct ParticleEffect: View {
    @State private var particles: [Particle] = []
    
    let particleCount = 50
    let particleSizeRange: ClosedRange<CGFloat> = 2...5
    let animationDurationRange: ClosedRange<Double> = 2...4
    let circleRadius: CGFloat = 50
    
    var targetSize: CGSize
    
    var body: some View {
        // Accessing the size of the container
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    Circle()
                        .fill(Color.white.opacity(particle.opacity))
                        .frame(width: particle.size, height: particle.size)
                        .position(particle.position)
                        .onAppear {
                            moveParticle(particle, in: geometry.size)
                        }
                }
            }
            .onAppear {
                particles = createParticles(in: geometry.size)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func createParticles(in size: CGSize) -> [Particle] {
        var particles = [Particle]()
        
        // Particle amount
        for i in 0..<particleCount {
            let particle = Particle(id: i,
                                    size: CGFloat.random(in: particleSizeRange),
                                    opacity: Double.random(in: 0.5...1.0),
                                    position: randomPosition(in: size),
                                    animationDuration: Double.random(in: animationDurationRange))
            particles.append(particle)
        }
        
        return particles
    }
    
    func moveParticle(_ particle: Particle, in size: CGSize) {
        // Infinite particle movement
        withAnimation(Animation.easeInOut(duration: particle.animationDuration).repeatForever()) {
            let angle = CGFloat.random(in: 0...(2 * .pi))
            let xOffset = circleRadius * cos(angle)
            let yOffset = circleRadius * sin(angle)
            particles[particle.id].position = CGPoint(x: size.width / 2 + xOffset, y: size.height / 2 + yOffset)
        }
    }
    
    func randomPosition(in size: CGSize) -> CGPoint {
        let x = CGFloat.random(in: size.width / 2 - circleRadius...size.width / 2 + circleRadius)
        let y = CGFloat.random(in: size.height / 2 - circleRadius...size.height / 2 + circleRadius)
        return CGPoint(x: x, y: y)
    }
}

struct Particle: Identifiable {
    var id: Int
    var size: CGFloat
    var opacity: Double
    var position: CGPoint
    var animationDuration: Double
}
