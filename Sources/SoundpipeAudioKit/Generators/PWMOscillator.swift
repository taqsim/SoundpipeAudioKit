// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import AudioKit
import CAudioKit

/// Casio-style phase distortion with "pivot point" on the X axis This module is
/// designed to emulate the classic phase distortion synthesis technique. From
/// the mid 90's. The technique reads the first and second halves of the ftbl at
/// different rates in order to warp the waveform. For example, pdhalf can
/// smoothly transition a sinewave into something approximating a sawtooth wave.
/// 
public class PWMOscillator: Node {

    public var connections: [Node] { [] }
    public var avAudioNode = instantiate(instrument: "pwmo")

    /// Specification details for frequency
    public static let frequencyDef = NodeParameterDef(
        identifier: "frequency",
        name: "Frequency (Hz)",
        address: akGetParameterAddress("PWMOscillatorParameterFrequency"),
        defaultValue: 440,
        range: 0.0 ... 20_000.0,
        unit: .hertz)

    /// In cycles per second, or Hz.
    @Parameter(frequencyDef) public var frequency: AUValue

    /// Specification details for amplitude
    public static let amplitudeDef = NodeParameterDef(
        identifier: "amplitude",
        name: "Amplitude",
        address: akGetParameterAddress("PWMOscillatorParameterAmplitude"),
        defaultValue: 1.0,
        range: 0.0 ... 10.0,
        unit: .generic)

    /// Output amplitude
    @Parameter(amplitudeDef) public var amplitude: AUValue

    /// Specification details for pulseWidth
    public static let pulseWidthDef = NodeParameterDef(
        identifier: "pulseWidth",
        name: "Pulse Width",
        address: akGetParameterAddress("PWMOscillatorParameterPulseWidth"),
        defaultValue: 0.5,
        range: 0.0 ... 1.0,
        unit: .generic)

    /// Duty cycle width (range 0-1).
    @Parameter(pulseWidthDef) public var pulseWidth: AUValue

    /// Specification details for detuningOffset
    public static let detuningOffsetDef = NodeParameterDef(
        identifier: "detuningOffset",
        name: "Frequency offset (Hz)",
        address: akGetParameterAddress("PWMOscillatorParameterDetuningOffset"),
        defaultValue: 0,
        range: -1_000.0 ... 1_000.0,
        unit: .hertz)

    /// Frequency offset in Hz.
    @Parameter(detuningOffsetDef) public var detuningOffset: AUValue

    /// Specification details for detuningMultiplier
    public static let detuningMultiplierDef = NodeParameterDef(
        identifier: "detuningMultiplier",
        name: "Frequency detuning multiplier",
        address: akGetParameterAddress("PWMOscillatorParameterDetuningMultiplier"),
        defaultValue: 1,
        range: 0.9 ... 1.11,
        unit: .generic)

    /// Frequency detuning multiplier
    @Parameter(detuningMultiplierDef) public var detuningMultiplier: AUValue

    // MARK: - Initialization

    /// Initialize this oscillator node
    ///
    /// - Parameters:
    ///   - frequency: In cycles per second, or Hz.
    ///   - amplitude: Output amplitude
    ///   - pulseWidth: Duty cycle width (range 0-1).
    ///   - detuningOffset: Frequency offset in Hz.
    ///   - detuningMultiplier: Frequency detuning multiplier
    ///
    public init(
        frequency: AUValue = frequencyDef.defaultValue,
        amplitude: AUValue = amplitudeDef.defaultValue,
        pulseWidth: AUValue = pulseWidthDef.defaultValue,
        detuningOffset: AUValue = detuningOffsetDef.defaultValue,
        detuningMultiplier: AUValue = detuningMultiplierDef.defaultValue
    ) {
        setupParameters()

        self.stop()

        self.frequency = frequency
        self.amplitude = amplitude
        self.pulseWidth = pulseWidth
        self.detuningOffset = detuningOffset
        self.detuningMultiplier = detuningMultiplier
    }
}
