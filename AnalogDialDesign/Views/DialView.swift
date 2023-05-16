//
//  DialView.swift
//  DiralKnobDesign
//
//  Created by HYEONJUN PARK on 2023/05/16.
//

import SwiftUI

enum Status {
    case cooling
    case heating
    case reaching
}

struct DialView: View {
    @State var currentTemperature: CGFloat = 10
    @State var targetTemperature: CGFloat = 10
    @State var ringValue: CGFloat = 0.5
    @State private var degrees: CGFloat = 36
    @State private var showStatus = false
    private let minTemperature: CGFloat = 4
    private let maxTemperature: CGFloat = 30
    
    
    var status: Status {
        if currentTemperature < targetTemperature {
            return .heating
        } else if currentTemperature > targetTemperature {
            return .cooling
        } else {
            return .reaching
        }
    }
    //설정한 온도로 현재 온도가 이동하도록 시뮬레이션하기 위한 타이머
    var timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack() {
            ScaleView()
            DialPlaceholder()
                .frame(width: 220, height: 220)
            //현재 온도를 표시하는 Ring
            Ring(value: $ringValue)
                .frame(width: 220, height: 220)
            
            // 타겟 온도를 설정하는 Knob
            DialKnob(degrees: $degrees)
                .frame(width: 200, height:  200)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            let x = min(max(value.location.x, 0), 200)
                            let y = min(max(value.location.y, 0), 200)
                            let endPoint = CGPoint(x: x, y: y)
                            let centerPoint = CGPoint(x: 200 / 2, y: 200 / 2)
                            let angle = calculateAngle(centerPoint: centerPoint, endPoint: endPoint)
                            if angle < 36 || angle > 270 { return }
                            degrees = angle - angle.remainder(dividingBy: 9)
                            targetTemperature = temperature(from: degrees)
                            print("degrees: \(degrees))")
                            print(targetTemperature)
                                  
                        })
                )
            
            VStack {
                Text("\(currentTemperature, specifier: "%.0f")")
            }
            .font(.system(size: 32))
                .foregroundColor(.gray)
            .onAppear {
                currentTemperature = 22
                targetTemperature = 22
                degrees = (targetTemperature / 40) * 360
                
            }
            .onReceive(timer) { _ in
                switch status {
                case .heating:
                    self.showStatus = true
                    self.currentTemperature += 1
                    self.ringValue = currentTemperature / 40
                case .cooling:
                    self.showStatus = true
                    self.currentTemperature -= 1
                    self.ringValue = currentTemperature / 40
                case .reaching:
                    self.showStatus = false
                }
                
            }
            .onDisappear {
                timer.upstream.connect().cancel()
            }
        }
    }
}

struct DialView_Previews: PreviewProvider {
    static var previews: some View {
        DialView()
    }
}

extension DialView {
    private func calculateAngle(centerPoint: CGPoint, endPoint: CGPoint) -> CGFloat {
        let radians = atan2(endPoint.x - centerPoint.x, centerPoint.y - endPoint.y)
        let degrees = 180 + (radians * 180 / .pi)
        return degrees
    }
    private func temperature(from degree : CGFloat) -> CGFloat{
        return min(max(degrees / 360 * 40, minTemperature), maxTemperature)
        
    }
}
