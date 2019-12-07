import UIKit
import NMAKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                NMAApplicationContext.setAppId("7o3yE9XAkFminAeZhbd6", appCode: "6ovf8c091ugMBVTJ6KB8uA", licenseKey: "W+fZ85thr994Lxi+q8oDAs57Q7dfdHW9LMZO1PpC3ptnwuzNVM5otsfoHkINBpeLJr/WorV4kjrh7J2Y4GuXVhQqv8ezByn6KFrHAThUVaLWHj0mg10mAo+tWofO1Hu9kXqPXFy5il0r4Y8wMxWYH6f4ieSpe2ioWJLZD3TyDAIllLNigQJviSCWuWrQ1lhk7EJHqd2gMZ1phb0BDS5OIM2wKIA2ZJvcfecHdebxSJF9ROf76x5krluN9s9v6sMIoVh3N+YwReR/5Az132PDwLCVPctTnqQFUUHts0gq4Op6BVKHJwyNgDmZvt48pSVP23P98gPn7h1M60ss0VASXXlIYtQmWkzNZyk0UUwPB2kastP9VgJJb3/v9Vodrx2dOdvYk3ydp8BSEy0xgqaw2z+BI1EMSbN9RwMAgIo5z6KVp79oxJqmYpD6114/mgC993CjgvWtdWW6zyhCJI2wOUmwJ+SeyH8SNhBnwQI4WgrLr4TN69pIc7mpIlEm7E2E4v/7Zeh3GYZKDqZaQTTzmcDU1hBTITZ8XQ7zwyOekyT6ZBOAqBRdxPvBJR5RF2jvlhqZfveAymhD4Yhs+soaGnFPeQmL4Tlj9aTPlfbNeREgaHvHrv6JJ7O2VhRMlVUCi5xBCHhJ7x3xAgdUMLUBLyu9ebwlwcIkN5pygkezRPk=")
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        let viewController: MapViewController = MapViewController.loadFromStoryboard()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

