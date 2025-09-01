// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XWeatherMapbox",
	platforms: [
		.iOS(.v16)
	],
    products: [
        .library(
            name: "XWeatherMapbox",
            targets: ["XWeatherMapbox"]),
    ],
	dependencies: [
		.package(url: "https://github.com/mapbox/mapbox-maps-ios.git", from: "11.0.0")
	],
    targets: [
        .target(name: "XWeatherMapbox", dependencies: [
			.product(name: "MapboxMaps", package: "mapbox-maps-ios")
		])
    ]
)
