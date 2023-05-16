//
//  ScaleView.swift
//  DiralKnobDesign
//
//  Created by HYEONJUN PARK on 2023/05/16.
//

import SwiftUI

struct ScaleView: View {
    var body: some View {
        ZStack {
            // 180도를 20개로 쪼갬(각각의 라인은 9도 회진
            ForEach(0..<21) { line in
                VStack{
                    Rectangle()
                        .fill(Color(.gray).opacity(0.5))
                        .frame(width: 2, height: 10)
                    Spacer()
                }
                .rotationEffect(.degrees(Double(line) * 9 - 90) )
            }
            .frame(width: 276, height: 276)
            ZStack {
                HStack {
                    Text("10")
                    Spacer()
                    Text("30")
                }
                VStack {
                    Text("20")
                    Spacer()
                }
            }
            .frame(width: 350, height: 340)
            .font(.subheadline)
            .foregroundColor(.gray.opacity(0.5))
        }
    }
}

struct ScaleView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleView()
    }
}
