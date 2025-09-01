//
//  EarthquakeRegionPathFormat.swift
//  XWeatherMapbox
//
//  Created by Anthony Pardee on 9/1/25.
//

import MapboxMaps

struct EarthquakeRegionPathFormat {
	
	var bounds: CoordinateBounds
	
	var credentials: Credentials
	
	var regionPath: String {
		// See: https://www.xweather.com/docs/weather-api/actions/within
		return "\(Constants.dataApiBase)/earthquakes/within?"
			+ "client_id=\(credentials.clientId)&client_secret=\(credentials.secret)" + "&"
			+ "format=geojson" + "&"
			+ "from=-5days" + "&"
			+ "limit=500" + "&"
			+ "p=" + boundsString + "&"
	}
	
	private var boundsString: String {
		"\(bounds.southwest.latitude),\(bounds.southwest.longitude),\(bounds.northeast.latitude),\(bounds.northeast.longitude)"
	}
}
