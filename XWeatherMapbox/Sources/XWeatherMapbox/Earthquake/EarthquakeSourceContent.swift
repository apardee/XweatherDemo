//
//  EarthquakeSourceContent.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

/// A map content component that provides earthquake data as a GeoJSON source.
///
/// `EarthquakeSourceContent` fetches earthquake data from the XWeather API for the specified
/// geographic bounds and makes it available as a Mapbox GeoJSON source for use by earthquake layers.
///
/// This component is typically used internally by `EarthquakeMapContent`, but can be used independently
/// when you need more control over earthquake data sourcing.
public struct EarthquakeSourceContent: MapContent {
	
	/// Creates a new earthquake source content component.
	///
	/// - Parameters:
	///   - bounds: The geographic bounds for which to fetch earthquake data.
	///   - sourceId: The identifier for the GeoJSON source. Uses the default if not specified.
	public init(bounds: CoordinateBounds,
				sourceId: String = Constants.defaultEarthquakeSourceId) {
		self.bounds = bounds
		self.sourceId = sourceId
	}
	
	/// The geographic bounds for earthquake data retrieval.
	public let bounds: CoordinateBounds
	
	/// The identifier for the GeoJSON source.
	public let sourceId: String
	
	/// The map content body that creates the GeoJSON source with earthquake data.
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
