//
//  DemoMapState.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import Observation
import XWeatherMapbox

/// Demo map state bindings used by the `DemoMap` and `DemoMapLayerSelection` views.
@Observable
class DemoMapState {
	
	var isRadarLayerEnabled = true
	
	var radarLayerOpacity: Double = 0.5
	
	var isAlertsLayerEnabled = true
	
	var alertsLayerOpacity: Double = 0.5
	
	var isEarthquakeLayerEnabled = true
	
	var earthquakeLayerOpacity: Double = 1.0
	
	var earthquakeLayerMode: EarthquakeMapContent.Mode = .marker
}
