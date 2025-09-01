//
//  EarthquakeMapContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

public struct EarthquakeMapContent: MapContent {
	
	public enum Mode {
		case marker
		case heatmap
	}
	
	public init(mapBounds: CoordinateBounds, mode: Mode = .marker, opacity: Double = 1.0) {
		self.mapBounds = mapBounds
		self.mode = mode
		self.opacity = opacity
	}
	
	public var body: some MapContent {
		
		// shared source used by both layers
		EarthquakeSourceContent(bounds: mapBounds)
		
		// heatmap vs. point marker layer is conditional based on the mode
		switch mode {
		case .marker:
			EarthquakeMarkerLayerContent()
				.opacity(opacity)
		case .heatmap:
			EarthquakeHeatmapLayerContent()
				.opacity(opacity)
		}
	}
	
	private let mapBounds: CoordinateBounds
	
	private let mode: Mode
	
	private var opacity: Double = 1.0
}
