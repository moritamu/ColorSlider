//
//  ContentView.swift
//  ColorSlider
//
//  Created by 森田晋 on 2022/06/24.
//  https://capibara1969.com/1776/ より

import SwiftUI

struct ContentView: View {
    @State private var redRatio     = 1.0
    @State private var greenRatio   = 1.0
    @State private var blueRatio    = 1.0
    @State private var opacity      = 1.0
    
    var body: some View {
        VStack {
            Text("カラー調整")
                .font(.largeTitle)
            Color(red: redRatio, green: greenRatio, blue: blueRatio, opacity: opacity).frame(width: 200, height: 200)
            AdjustmentView(parameterName: "Red", parameter: $redRatio)
            AdjustmentView(parameterName: "Green", parameter: $greenRatio)
            AdjustmentView(parameterName: "blue", parameter: $blueRatio)
            AdjustmentView(parameterName: "opacity", parameter: $opacity)

        }
    }
}

struct AdjustmentView: View {
    var parameterName: String
    @Binding var parameter:Double
    
    var body: some View  {
        HStack {
            Text(parameterName)
                .frame(width: 60)
            Slider(value: $parameter, in: 0...1, step: 0.01)
            Text("\(parameter, specifier: "%.2f")")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
