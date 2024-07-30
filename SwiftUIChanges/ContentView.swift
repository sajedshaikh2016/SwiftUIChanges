//
//  ContentView.swift
//  SwiftUIChanges
//
//  Created by Sajed Shaikh on 30/07/24.
//

import SwiftUI
import SwiftData

@Observable
class Light {
    var isOn: Bool = false
}

struct RoomView: View {
    @Bindable var light: Light
    
    var body: some View {
        Toggle(isOn: $light.isOn, label: {
            EmptyView()
        }).fixedSize()
    }
}

struct ContentView: View {
    @State private var light = Light()
    
    var body: some View {
        VStack {
            RoomView(light: light)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(light.isOn ? .yellow : .white)
    }
}

#Preview {
    ContentView()
}
