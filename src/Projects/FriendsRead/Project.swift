import ProjectDescription

let app = Target(
    name: "FriendsRead",
    platform: .iOS,
    product: .app,
    bundleId: "com.farllight.friendsread",
    deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
    infoPlist: .extendingDefault(with: [
        "UILaunchStoryboardName": .string("Launchscreen")
    ]),
    sources: ["Sources/App/**"],
    resources: ["Resources/**"]
)

let project = Project(
    name: "FriendsRead",
    organizationName: "friends_read",
    targets: [app]
)
