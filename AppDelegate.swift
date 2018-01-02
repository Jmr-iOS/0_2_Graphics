/************************************************************************************************************************************/
/** @file		AppDelegate.swift
 *  @project    0_0 - Empty Template (Swift)
 * 	@brief		x
 * 	@details	x
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 *  @section    Reference
 *      UIApplicationDelegate - UIKit (developer.apple.com/documentation/uikit/uiapplicationdelegate)
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?;
    
    
    /********************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override init() {
        super.init();
        print("AppDelegate.init():           initialization complete");
    }

    
    /********************************************************************************************************************************/
    /** @fcn        application(application:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey]?)
     *  @brief      Tells the delegate that the launch process is almost done and the app is almost ready to run
     *  @details    x
     *
     *  @section    Purpose
     *      Complete your app’s initialization and make any final tweaks
     *
     *  @param      [in]_ application: UIApplication - Your singleton app object
     *  @param      [in] didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? - A dictionary indicating the reason the app was launched (if any)
     *
     *  @return     (Bool) app is able to handle launch
     *
     *  @pre        app was launched
     *  @post       app is initialized and ready for use
     */
    /********************************************************************************************************************************/
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        
        self.window?.backgroundColor = UIColor.white;
        
        let viewController:ViewController = ViewController();
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false;
        
        self.window?.rootViewController = viewController;
        
        self.window?.makeKeyAndVisible();
        
        print("AppDelegate.application():    application launch complete");
        
        return true;
    }

    func applicationWillResignActive(_ application: UIApplication)    { return; }
    func applicationDidEnterBackground(_ application: UIApplication)  { return; }
    func applicationWillEnterForeground(_ application: UIApplication) { return; }
    func applicationDidBecomeActive(_ application: UIApplication)     { return; }
    func applicationWillTerminate(_ application: UIApplication)       { return; }
}

