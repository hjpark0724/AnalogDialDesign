//
//  ThermometerRing.swift
//  DiralKnobDesign
//
//  Created by HYEONJUN PARK on 2023/05/16.
//

import SwiftUI

struct Ring: View {
    @Binding var value: CGFloat
    var body: some View {
        Circle()
            .inset(by: 5)
            .trim(from: 0.099, to: value)
            .stroke(
                .linearGradient(colors: [Color("Ring1"), Color("Ring2")], startPoint: .topLeading, endPoint: .bottomTrailing),
                style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
            .rotationEffect(.degrees(90))
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring(value: .constant(0.8))
            .frame(width: 100, height: 100)
    }
}
