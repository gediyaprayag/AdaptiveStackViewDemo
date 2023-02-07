//
//  ContentView.swift
//  AdaptiveStackViewDemo
//
//  Created by Prayag Gediya on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    let orientationNotification = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
    @State private var orientation: UIDeviceOrientation?
    
    var body: some View {
        AdaptiveStackView(
            horizontalAlignment: .leading,
            verticalAlignment: .top,
            isHorizontalStack: orientation != .portrait,
            spacing: .zero) {
                SubViewOne()
                SubViewTwo()
            }
            .foregroundColor(.white)
            .onReceive(orientationNotification) { output in
                if let device = output.object as? UIDevice {
                    self.orientation = device.orientation
                }
            }
    }
}

struct SubViewOne: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("Sub View One")
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct SubViewTwo: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Sub View One")
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
