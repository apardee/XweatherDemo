//
//  EarthquakeDetailSheet.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/2/25.
//

import SwiftUI
import MapboxMaps

/// Demonstrates reading structured earthquake report data out of the GeoJSON features provided by the API and
/// displayed by the earthquake marker map layer.
struct EarthquakeDetailSheet: View {
	
	let feature: QueriedFeature
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			VStack(alignment: .leading) {
				Text("Earthquake Details")
					.font(.title2)
					.fontWeight(.bold)
				
				if let place = place {
					Text(place)
						.font(.subheadline)
						.foregroundColor(.secondary)
				}
			}
			
			VStack(alignment: .leading, spacing: 12) {
				if let magnitude = magnitude {
					detailRow(title: "Magnitude", value: String(format: "%.1f", magnitude))
					Divider()
				}
				
				if let depth = depth {
					detailRow(title: "Depth", value: String(format: "%.1f km", depth))
					Divider()
				}
				
				if let time = time {
					detailRow(title: "Time", value: DateFormatter.earthquakeFormatter.string(from: time))
					Divider()
				}
				
				if let coordinates = coordinates {
					detailRow(title: "Location", value: String(format: "%.3f°, %.3f°", coordinates.latitude, coordinates.longitude))
				}
			}
			Spacer()
		}
		.padding()
		.presentationDetents([.medium])
		.presentationDragIndicator(.visible)
	}
	
	@ViewBuilder
	private func detailRow(title: String, value: String) -> some View {
		HStack {
			Text(title)
				.fontWeight(.medium)
			Spacer()
			Text(value)
				.foregroundColor(.secondary)
		}
	}
	
	private var magnitude: Double? {
		reportData?["mag"]??.number
	}
	
	private var depth: Double? {
		reportData?["depthKM"]??.number
	}
	
	private var place: String? {
		reportData?["location"]??.string
	}
	
	private var time: Date? {
		guard let timeInterval = reportData?["timestamp"]??.number else {
			return nil
		}
		return Date(timeIntervalSince1970: timeInterval)
	}
	
	private var coordinates: LocationCoordinate2D? {
		guard let geometry = feature.feature.geometry,
			  case let .point(point) = geometry else { return nil }
		return point.coordinates
	}
	
	private var featureData: JSONObject? {
		feature.feature.properties
	}
	
	private var reportData: JSONObject? {
		featureData?["report"]??.object
	}
}
