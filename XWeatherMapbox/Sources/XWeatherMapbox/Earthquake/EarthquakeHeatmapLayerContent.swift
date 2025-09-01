//
//  EarthquakeHeatmapLayerContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

public struct EarthquakeHeatmapLayerContent: MapContent {
	
	public var body: some MapContent {
		// Heatmap layer with constant point weight & radius.
		HeatmapLayer(id: "heatmap-layer", source: "earthquake-source") // TODO(AP): Make these configurable.
			.sourceLayer("earthquake-source")
			.heatmapWeight(1.0)
			.heatmapRadius(20.0)
			.heatmapColor(colorExp)
			.heatmapIntensity(intensityExp)
			.heatmapOpacity(opacity)
	}
	
	public func opacity(_ opacity: Double) -> Self {
		var result = self
		result.opacity = opacity
		return result
	}
	
	private var colorExp: Exp {
		Exp(.interpolate) {
			Exp(.linear)
			Exp(.heatmapDensity)
			0
			"rgba(33.0, 102.0, 172.0, 0.0)"
			0.2
			"rgb(102.0, 169.0, 207.0)"
			0.4
			"rgb(209.0, 229.0, 240.0)"
			0.6
			"rgb(253.0, 219.0, 199.0)"
			0.8
			"rgb(239.0, 138.0, 98.0)"
			1
			"rgb(178.0, 24.0, 43.0)"
		}
	}
	
	private var intensityExp: Exp {
		Exp(.interpolate) {
			Exp(.linear)
			Exp(.zoom)
			0
			1
			9
			3
		}
	}
	
	private var opacity: Double = 1.0
}
