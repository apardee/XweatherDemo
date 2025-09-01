//
//  EarthquakeMarkerLayerContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

public struct EarthquakeMarkerLayerContent: MapContent {
	
	public var body: some MapContent {
		CircleLayer(id: "circle-layer", source: "earthquake-source")
			.circleRadius(8.0)
			.circleStrokeColor("white")
			.circleStrokeWidth(2.0)
			.circleColor(colorExp)
			.circleOpacity(opacity)
	}
	
	public func opacity(_ opacity: Double) -> Self {
		var result = self
		result.opacity = opacity
		return result
	}
	
	private var colorExp: Exp {
		Exp(.step) {
			Exp(.get) {
				"mag"
				Exp(.get) {
					"report"
				}
			}
			"rgba(0.0, 153.0, 0.0, 255.0)"
			3
			"rgba(255.0, 204.0, 0.0, 255.0)"
			5
			"rgba(255.0, 103.0, 0.0, 5.0)"
			7
			"rgba(255.0, 0.0, 0.0, 255.0)"
		}
	}
	
	private var opacity: Double = 1.0
}
