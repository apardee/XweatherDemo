//
//  Extensions.swift
//  XWeatherDemo
//
//  Created by Anthony Pardee on 9/1/25.
//

import CoreLocation
import MapboxMaps
import UIKit

extension CLLocationCoordinate2D {
	static var minneapolis: CLLocationCoordinate2D {
		.init(latitude: 44.9778, longitude: -93.2650)
	}
}

extension MapboxMap {
	func coordinateBounds(forCameraState cameraState: CameraState, padding: UIEdgeInsets = .init()) -> CoordinateBounds {
		let cameraState = MapboxMaps.CameraState(
			center: cameraState.center,
			padding: padding,
			zoom: cameraState.zoom,
			bearing: cameraState.bearing,
			pitch: cameraState.pitch
		)
		return coordinateBoundsUnwrapped(for: MapboxMaps.CameraOptions(cameraState: cameraState))
	}
}
