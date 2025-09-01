//
//  EarthquakeSourceContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

public struct EarthquakeSourceContent: MapContent {
	
	public init(bounds: CoordinateBounds,
				sourceId: String = Constants.defaultEarthquakeSourceId) {
		self.bounds = bounds
		self.sourceId = sourceId
	}
	
	public let bounds: CoordinateBounds
	
	public let sourceId: String
	
	public var body: some MapContent {
		GeoJSONSource(id: sourceId)
			.data(.url(regionURL))
			.generateId(true)
	}
	
	private var regionURL: URL {
		let format = EarthquakeRegionPathFormat(bounds: bounds,
												credentials: Credentials.current).regionPath
		return URL(string: format)!
	}
}
