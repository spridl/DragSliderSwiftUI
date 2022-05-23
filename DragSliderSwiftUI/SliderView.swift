//
//  SliderView.swift
//  DragSliderSwiftUI
//
//  Created by Тимур on 23.05.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {

    @Binding var value: Double
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: Double(ScoreManager.score.computeScore(from: targetValue, and: value)) * 0.01)
        slider.value = Float(value)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didThumbDone),
            for: .valueChanged
        )
        
        return slider
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, targetValue: $targetValue)
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: Double(ScoreManager.score.computeScore(from: targetValue, and: value)) * 0.01)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var targetValue: Int
        
        init(value: Binding<Double>, targetValue: Binding<Int>) {
            self._value = value
            self._targetValue = targetValue
        }
        
        @objc func didThumbDone(sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(30), targetValue: .constant(50))
    }
}
