//
//  SceneDelegate.swift
//  photoAlbum-HW
//
//  Created by Роман Назаров on 08.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tapBarController = UITabBarController()
        tapBarController.tabBar.backgroundColor = .systemBackground
        
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square"), tag: 1)
        
        let thirdViewController = AlbumsCollectionViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        let albumNavigationController = UINavigationController(rootViewController: thirdViewController)
        
        let fourViewController = UIViewController()
        fourViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tapBarController.setViewControllers([
            firstViewController,
            secondViewController,
            albumNavigationController,
            fourViewController
        ], animated: true)
        
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
    }
}
