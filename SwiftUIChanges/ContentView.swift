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

struct LightView: View {
    @Bindable var light: Light
    
    var body: some View {
        Toggle(isOn: $light.isOn, label: {
            EmptyView()
        }).fixedSize()
    }
}

struct RoomView: View {
    @Environment(Light.self) private var light
    
    var body: some View {
        LightView(light: light)
    }
}

struct CabinView: View {
    @Environment(Light.self) private var light
    
    var body: some View {
        Image(systemName: light.isOn ? "lightbulb.fill" : "lightbulb")
            .font(.largeTitle)
    }
}

struct ContentView: View {
    @Environment(Light.self) private var light
    
    var body: some View {
        VStack {
            RoomView()
            CabinView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(light.isOn ? .yellow : .white)
    }
}

#Preview {
    ContentView()
        .environment(Light())
}
