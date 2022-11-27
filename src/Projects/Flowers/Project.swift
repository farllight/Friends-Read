import ProjectDescription

let framework = Target(
    name: "Flowers",
    platform: .iOS,
    product: .framework,
    bundleId: "com.farllight.friendsread.flowers",
    deploymentTarget: .iOS(targetVersion: "14.0.0", devices: .iphone),
    sources: ["Sources/**"]
)

let tests = Target(
    name: "FlowersTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.farllight.friendsread.flowers.tests",
    deploymentTarget: .iOS(targetVersion: "14.0.0", devices: .iphone),
    sources: ["Tests/**"]
)

let project = Project(
    name: "Flowers",
    organizationName: "friends_read",
    targets: [
        framework,
        tests
    ]
)
