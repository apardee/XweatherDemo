//
//  DemoMapState.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import Observation
import XWeatherMapbox

@Observable
class DemoMapState {
	
	var isRadarLayerEnabled = true
	
	var radarLayerOpacity: Double = 0.5
	
	var isAlertsLayerEnabled = true
	
	var alertsLayerOpacity: Double = 0.5
	
	var isEarthquakeLayerEnabled = true
	
	var earthquakeLayerOpacity: Double = 0.5
	
	var earthquakeLayerMode: EarthquakeMapContent.Mode = .marker
}
