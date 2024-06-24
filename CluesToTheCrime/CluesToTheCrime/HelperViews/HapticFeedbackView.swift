//
//  HapticFeedbackView.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import CoreHaptics

class HapticFeedbackManager: ObservableObject {
    private var hapticEngine: CHHapticEngine?

    init() {
        prepareHaptics()
    }

    private func prepareHaptics() {
        // Checking if the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            hapticEngine = try CHHapticEngine()
            try hapticEngine?.start()
        } catch {
            print("Failed to start the haptic engine: \(error.localizedDescription)")
        }
    }

    func playHapticFeedback() {
        // Ensuring the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        // Creating a strong vibration haptic effect
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        // Making the vibration longer
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 1.0)

        // Playing the vibration pattern
        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try hapticEngine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play haptic feedback: \(error.localizedDescription)")
        }
    }
}
