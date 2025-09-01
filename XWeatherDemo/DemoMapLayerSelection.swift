//
//  DemoMapLayerSelection.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import SwiftUI
import XWeatherMapbox

/// Basic layer selection view used to configure the visible map.
struct DemoMapLayerSelectionView: View {
	
	@Bindable var demoMapState: DemoMapState
	
	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			Text("Layer Configuration")
				.font(.headline)
			
			VStack(alignment: .leading, spacing: 12) {
				Text("Radar Layer")
					.font(.subheadline)
				
				Toggle("Show Radar", isOn: $demoMapState.isRadarLayerEnabled)
					.font(.caption)
				
				VStack(alignment: .leading, spacing: 4) {
					Text("Opacity: \(Int(demoMapState.radarLayerOpacity * 100))%")
						.font(.caption)
						.foregroundColor(.gray)
					Slider(value: $demoMapState.radarLayerOpacity, in: 0...1)
				}
			}
			
			Text("Alerts Layer")
				.font(.subheadline)
			
			Toggle("Show Alerts", isOn: $demoMapState.isAlertsLayerEnabled)
				.font(.caption)
			
			VStack(alignment: .leading, spacing: 4) {
				Text("Opacity: \(Int(demoMapState.alertsLayerOpacity * 100))%")
					.font(.caption)
					.foregroundColor(.gray)
				Slider(value: $demoMapState.alertsLayerOpacity, in: 0...1)
			}
			
			Text("Earthquake Layer")
				.font(.subheadline)
			
			Toggle("Show Earthquakes", isOn: $demoMapState.isEarthquakeLayerEnabled)
				.font(.caption)
			
			VStack(alignment: .leading, spacing: 4) {
				Text("Opacity: \(Int(demoMapState.earthquakeLayerOpacity * 100))%")
					.font(.caption)
					.foregroundColor(.gray)
				Slider(value: $demoMapState.earthquakeLayerOpacity, in: 0...1)
			}
			
			Picker("Mode", selection: $demoMapState.earthquakeLayerMode) {
				Text("Markers")
					.foregroundColor(.green)
					.tag(EarthquakeMapContent.Mode.marker)
					
				Text("Heatmap")
					.foregroundColor(.green)
					.tag(EarthquakeMapContent.Mode.heatmap)
			}
			.pickerStyle(SegmentedPickerStyle())
		}
		.padding(20)
		.frame(width: 280)
	}
}
