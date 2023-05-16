//
//  Dial.swift
//  DiralKnobDesign
//
//  Created by HYEONJUN PARK on 2023/05/16.
//

import SwiftUI

struct DialKnob: View {
    @State var size = CGSize(width: 0, height: 0)
    @Binding var degrees: CGFloat
    var body: some View {
        //Outer Circle
        ZStack {
            Circle()
                .fill(
                    .linearGradient(colors:
                                        [Color(#colorLiteral(red: 0.863999784, green: 0.8342863917, blue: 0.9248104692, alpha: 1)), Color(#colorLiteral(red: 0.6793052554, green: 0.6743476391, blue: 0.8320595622, alpha: 1))],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                .shadow(color: .black.opacity(0.2), radius: 60,
                        x: 0, y: 30)
                .shadow(color: .black.opacity(0.2), radius: 16, x:0, y: 8)
                .overlay {
                    Circle().stroke(
                        .linearGradient(colors: [.black.opacity(0.19), .white.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 1)
                }
                .overlay {
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 4)
                        .blur(radius: 8)
                        .offset(x: 3, y: 3)
                        .mask {
                            Circle()
                                .fill(
                                    .linearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom))
                        }
                }
            //안쪽 원
            Circle().fill(
                .linearGradient(colors: [Color(#colorLiteral(red: 0.6784313725, green: 0.6666666667, blue: 0.9019607843, alpha: 0.4654646109)),
                                         Color(#colorLiteral(red: 0.9529411765, green: 0.8941176471, blue: 0.937254902, alpha: 0.9))
                                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .frame(width: size.width * 0.85, height: size.height * 0.85)
            //Indicator
            Circle()
                .fill(
                    .linearGradient(colors: [.gray.opacity(0.5), .white.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: size.width * 0.1 , height: size.height * 0.1)
                .frame(width: size.width * 0.85, height: size.width * 0.85, alignment: .top)
                .rotationEffect(.degrees(degrees + 180))
                .animation(.easeInOut(duration: 1), value: degrees)
        }
        .background(
            GeometryReader { proxy in
                Color.clear.onAppear { size = proxy.size }
            }
        )
    }
}

struct DialKnob_Previews: PreviewProvider {
    static var previews: some View {
        DialKnob(degrees: .constant(0))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("Background")
            )
    }
}
