//
//  ContentView.swift
//  AnalogDialDesign
//
//  Created by HYEONJUN PARK on 2023/05/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DialView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color("Background")
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
