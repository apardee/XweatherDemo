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
				Spacer()
					.frame(height: 46)
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
					.popover(isPresented: $isLayerSelectionShown) {
						DemoMapLayerSelectionView(demoMapState: demoMapState)
							.presentationBackground(.black)
							.presentationCompactAdaptation(.popover)
							.tint(.orange)
					}
				}
				Spacer()
			}
			.padding(8)
		}
	}
}

#Preview {
    ContentView()
}
