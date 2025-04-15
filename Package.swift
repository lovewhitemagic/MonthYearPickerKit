// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MonthYearPickerKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "MonthYearPickerKit",
            targets: ["MonthYearPickerKit"]
        ),
    ],
    targets: [
        .target(
            name: "MonthYearPickerKit",
            path: "Sources/MonthYearPickerKit"
        ),
        .testTarget(
            name: "MonthYearPickerKitTests",
            dependencies: ["MonthYearPickerKit"],
            path: "Tests/MonthYearPickerKitTests"
        ),
    ]
)
