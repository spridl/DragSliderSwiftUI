//
//  ContentView.swift
//  DragSliderSwiftUI
//
//  Created by Тимур on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var checkButtonAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
                .font(.system(size: 13))
                .padding()
                .frame(width: 320, height: 20)
            HStack {
                Text("0")
                SliderView(value: $currentValue, targetValue: $targetValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня") {
                checkButtonAlert.toggle()
            }
                .alert(
                    "Your Score: \(ScoreManager.score.computeScore(from: targetValue, and: currentValue))",
                    isPresented: $checkButtonAlert,
                    actions: {}
                )
                .padding(.bottom)
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
