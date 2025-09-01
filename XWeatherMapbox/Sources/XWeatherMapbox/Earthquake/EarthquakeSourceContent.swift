//
//  EarthquakeSourceContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

public struct EarthquakeSourceContent: MapContent {
	
	public let bounds: CoordinateBounds
	
	public var body: some MapContent {
		GeoJSONSource(id: "earthquake-source") // TODO(AP): Make this configurable
			.data(.url(regionURL))
			.generateId(true)
	}
	
	private var regionURL: URL {
		let format = EarthquakeRegionPathFormat(bounds: bounds,
												credentials: Credentials.current).regionPath
		return URL(string: format)! // TODO(AP): force unwrap
	}
}
