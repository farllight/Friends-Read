import ProjectDescription

let networkAPI = Target(
    name: "NetworkAPI",
    platform: .iOS,
    product: .framework,
    bundleId: "com.farllight.friendsread.network.api",
    deploymentTarget: .iOS(targetVersion: "14.0.0", devices: .iphone),
    sources: ["Sources/Network/API/**"]
)

let networkImpl = Target(
    name: "NetworkImpl",
    platform: .iOS,
    product: .framework,
    bundleId: "com.farllight.friendsread.network.impl",
    deploymentTarget: .iOS(targetVersion: "14.0.0", devices: .iphone),
    sources: ["Sources/Network/Impl/**"],
    dependencies: [
        .target(name: networkAPI.name)
    ]
)

let networkTests = Target(
    name: "NetworkTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.farllight.friendsread.network.tests",
    deploymentTarget: .iOS(targetVersion: "14.0.0", devices: .iphone),
    sources: ["Sources/Network/Tests/**"],
    dependencies: [
        .target(name: networkImpl.name)
    ]
)


let project = Project(
    name: "FriendsCore",
    organizationName: "friends_read",
    targets: [
        networkAPI,
        networkImpl,
        networkTests
    ]
)
