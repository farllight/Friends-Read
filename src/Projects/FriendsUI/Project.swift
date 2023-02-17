import ProjectDescription

let designSystem = Target(
    name: "DesignSystem",
    platform: .iOS,
    product: .framework,
    bundleId: "com.farllight.friendsread.designSystem",
    deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
    sources: [
        "Sources/DesignSystem/**"
    ]
)

let project = Project(
    name: "FriendsUI",
    organizationName: "friends_read",
    targets: [
        designSystem,
        
    ]
)
