//
//  AppDelegate.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/8/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    
    
    // Mark: - send the device token to backend
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        let token = deviceToken.map {String(format: "%02.2hhx", $0)}.joined()
//        print("token: \(token)")
//    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        /////
    }
    
    // Mark: - show notification عند الدخول علي الصفحه المخصصه
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.alert, .sound])
//    }
    // Mark: - show notification اضافه امر عند الضغط علي النوتيفيكاشن المرسله
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        if response.notification.request.identifier == "test" {
//            print("heandler notification")
//        }
//        completionHandler()
//    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Mark: - For notification
//        UNUserNotificationCenter.current().delegate = self
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
//            print("grandted \(granted)")
//        }
//        
//        UIApplication.shared.registerForRemoteNotifications()
        
     // Mark: - End For notification
        
        IQKeyboardManager.shared.enable = true

                if let api_token = Helper.getApiToken() {
                    print(api_token)

                    let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabMain")
                    window?.rootViewController = tab
                }
        return true
    }

   
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "BestLoginApi")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
let appDelegate=UIApplication.shared.delegate as! AppDelegate
let context=appDelegate.persistentContainer.viewContext

