// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import AudioKit
import CAudioKit

/// Classic FM Synthesis audio generation.
public class FMOscillator: Node {

    public var connections: [Node] { [] }
    public var avAudioNode = instantiate(instrument: "fosc")

    fileprivate var waveform: Table?

    /// Specification details for baseFrequency
    public static let baseFrequencyDef = NodeParameterDef(
        identifier: "baseFrequency",
        name: "Base Frequency (Hz)",
        address: akGetParameterAddress("FMOscillatorParameterBaseFrequency"),
        defaultValue: 440.0,
        range: 0.0 ... 20_000.0,
        unit: .hertz)

    /// In cycles per second, the common denominator for the carrier and modulating frequencies.
    @Parameter(baseFrequencyDef) public var baseFrequency: AUValue

    /// Specification details for carrierMultiplier
    public static let carrierMultiplierDef = NodeParameterDef(
        identifier: "carrierMultiplier",
        name: "Carrier Multiplier",
        address: akGetParameterAddress("FMOscillatorParameterCarrierMultiplier"),
        defaultValue: 1.0,
        range: 0.0 ... 1_000.0,
        unit: .generic)

    /// This multiplied by the baseFrequency gives the carrier frequency.
    @Parameter(carrierMultiplierDef) public var carrierMultiplier: AUValue

    /// Specification details for modulatingMultiplier
    public static let modulatingMultiplierDef = NodeParameterDef(
        identifier: "modulatingMultiplier",
        name: "Modulating Multiplier",
        address: akGetParameterAddress("FMOscillatorParameterModulatingMultiplier"),
        defaultValue: 1.0,
        range: 0.0 ... 1_000.0,
        unit: .generic)

    /// This multiplied by the baseFrequency gives the modulating frequency.
    @Parameter(modulatingMultiplierDef) public var modulatingMultiplier: AUValue

    /// Specification details for modulationIndex
    public static let modulationIndexDef = NodeParameterDef(
        identifier: "modulationIndex",
        name: "Modulation Index",
        address: akGetParameterAddress("FMOscillatorParameterModulationIndex"),
        defaultValue: 1.0,
        range: 0.0 ... 1_000.0,
        unit: .generic)

    /// This multiplied by the modulating frequency gives the modulation amplitude.
    @Parameter(modulationIndexDef) public var modulationIndex: AUValue

    /// Specification details for amplitude
    public static let amplitudeDef = NodeParameterDef(
        identifier: "amplitude",
        name: "Amplitude",
        address: akGetParameterAddress("FMOscillatorParameterAmplitude"),
        defaultValue: 1.0,
        range: 0.0 ... 10.0,
        unit: .generic)

    /// Output Amplitude.
    @Parameter(amplitudeDef) public var amplitude: AUValue

    // MARK: - Initialization

    /// Initialize this oscillator node
    ///
    /// - Parameters:
    ///   - waveform: The waveform of oscillation
    ///   - baseFrequency: In cycles per second, the common denominator for the carrier and modulating frequencies.
    ///   - carrierMultiplier: This multiplied by the baseFrequency gives the carrier frequency.
    ///   - modulatingMultiplier: This multiplied by the baseFrequency gives the modulating frequency.
    ///   - modulationIndex: This multiplied by the modulating frequency gives the modulation amplitude.
    ///   - amplitude: Output Amplitude.
    ///
    public init(
        waveform: Table = Table(.sine),
        baseFrequency: AUValue = baseFrequencyDef.defaultValue,
        carrierMultiplier: AUValue = carrierMultiplierDef.defaultValue,
        modulatingMultiplier: AUValue = modulatingMultiplierDef.defaultValue,
        modulationIndex: AUValue = modulationIndexDef.defaultValue,
        amplitude: AUValue = amplitudeDef.defaultValue
    ) {
        setupParameters()

        self.stop()

        au.setWavetable(waveform.content)

        self.waveform = waveform
        self.baseFrequency = baseFrequency
        self.carrierMultiplier = carrierMultiplier
        self.modulatingMultiplier = modulatingMultiplier
        self.modulationIndex = modulationIndex
        self.amplitude = amplitude
    }
}
