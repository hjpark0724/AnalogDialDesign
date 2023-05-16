//
//  DialPlaceholder.swift
//  DiralKnobDesign
//
//  Created by HYEONJUN PARK on 2023/05/16.
//

import SwiftUI

struct DialPlaceholder: View {
    var body: some View {
        Circle()
            .fill(
                .linearGradient(colors: [Color("Placeholder1"), Color("Placeholder2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: Color("Placeholder2"), radius: 3, x: 8, y: 8)
                .overlay(
                    Circle()
                        .stroke(
                            .linearGradient(colors: [.black.opacity(0.7), .white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 0.8))
        
                .overlay ( //Inner Shadow
                    Circle()
                        .stroke(Color(.black), lineWidth: 3)
                        .blur(radius: 7)
                        .offset(x: 0, y: 3)
                        .mask {
                            Circle()
                                .fill(.linearGradient(colors:[.black, .clear], startPoint: .top, endPoint: .bottom))
                        }
                )
    }
}

struct DialPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        DialPlaceholder()
    }
}
