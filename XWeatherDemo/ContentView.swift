//
//  ContentView.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import SwiftUI

struct ContentView: View {
	
	@State private var demoMapState = DemoMapState()
	
	@State private var isLayerSelectionShown = false
	
	var body: some View {
		ZStack {
			DemoMap(state: demoMapState)
			VStack {
				HStack {
					Spacer()
					Button(action: {
						isLayerSelectionShown.toggle()
					}) {
						Image(systemName: "square.2.layers.3d.fill")
							.foregroundColor(.white)
							.font(.system(size: 18, weight: .medium))
					}
					.frame(width: 40, height: 40)
					.background(Color(.black))
					.clipShape(Circle())
					.shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
					.popover(isPresented: $isLayerSelectionShown) {
						DemoMapLayerSelectionView(demoMapState: demoMapState)
							.presentationBackground(.black)
							.presentationCompactAdaptation(.popover)
							.tint(.orange)
					}
				}
				Spacer()
			}
			.padding()
		}
	}
}

#Preview {
    ContentView()
}
