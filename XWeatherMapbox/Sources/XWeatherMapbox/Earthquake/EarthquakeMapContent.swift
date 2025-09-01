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
	
	public init(mapBounds: CoordinateBounds,
				mode: Mode = .marker,
				opacity: Double = 1.0,
				earthquakeSourceId: String = Constants.defaultEarthquakeSourceId,
				earthquakeHeatmapLayerId: String = Constants.defaultEarthquakeHeatmapLayerId,
				earthquakeMarkerLayerId: String = Constants.defaultEarthquakeMarkerLayerId) {
		self.mapBounds = mapBounds
		self.mode = mode
		self.opacity = opacity
		self.earthquakeSourceId = earthquakeSourceId
		self.earthquakeHeatmapLayerId = earthquakeHeatmapLayerId
		self.earthquakeMarkerLayerId = earthquakeMarkerLayerId
	}
	
	public var body: some MapContent {
		
		// shared source used by both layers
		EarthquakeSourceContent(bounds: mapBounds)
		
		// heatmap vs. point marker layer is conditional based on the mode
		switch mode {
		case .marker:
			EarthquakeMarkerLayerContent(layerId: earthquakeMarkerLayerId, sourceId: earthquakeSourceId)
				.opacity(opacity)
		case .heatmap:
			EarthquakeHeatmapLayerContent(layerId: earthquakeHeatmapLayerId, sourceId: earthquakeSourceId)
				.opacity(opacity)
		}
	}
	
	private var opacity: Double = 1.0
	
	private let mapBounds: CoordinateBounds
	
	private let mode: Mode
	
	private let earthquakeSourceId: String
	
	private let earthquakeHeatmapLayerId: String
	
	private let earthquakeMarkerLayerId: String
}
