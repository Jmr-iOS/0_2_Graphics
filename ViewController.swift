/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_0 - Empty Template (Swift)
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	11/12/15
 * 	@last rev	12/24/17
 *
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class ViewController: UIViewController {

    
    /********************************************************************************************************************************/
    /** @fcn        init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        //@todo     init state
        
        //Super
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
        //@todo     init code
        
        print("ViewController.init():        Initialization complete");
            
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        viewDidLoad()
     *  @brief      Called after the controller's view is loaded into memory
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;

        genButton(self.view);
        genLabel(self.view);
        
        //listen to 'Home' press
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil);
    
        print("ViewController.viewDidLoad(): Load complete");
            
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        applicationWillResignActive(_ notification: Notification)
     *  @brief      Tells the delegate that the app is about to become inactive
     *  @details    This method is called to let your app know that it is about to move from the active to inactive state
     *  @class      UIApplicationDelegate
     */
    /********************************************************************************************************************************/
    func applicationWillResignActive(_ notification: Notification) {
        print("I'm out of focus, home was pressed!");
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        didReceiveMemoryWarning()
     *  @brief      Sent to the view controller when the app receives a memory warning
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        genButton(_ view:UIView)
     *  @brief      add a button to the view
     *  @details    x
     */
    /********************************************************************************************************************************/
    func genButton(_ view:UIView) {
        
        let button      : UIButton  = UIButton(type: UIButtonType.system) as UIButton;
        let buttonWidth : CGFloat   = 300;
        
        button.frame = CGRect(x: self.view.center.x-(buttonWidth/2), y: 100, width: buttonWidth, height: 50);

        
        button.backgroundColor = UIColor.green;
        
        button.setTitle("Test Button", for: UIControlState());
  
        button.addTarget(self, action: #selector(ViewController.response(_:)), for:  .touchUpInside);

        view.addSubview(button);
        
        print("ViewController.genButton():   Button added");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        genLabel(_ view:UIView)
     *  @brief      add a label to the view
     *  @details    x
     */
    /********************************************************************************************************************************/
    func genLabel(_ view:UIView) {
        
        let myFirstLabel  = UILabel();

        myFirstLabel.text          = "I made a label on the screen #toogood4you";
        myFirstLabel.font          = UIFont(name: "MarkerFelt-Thin", size: 45);
        myFirstLabel.textColor     = UIColor.red;
        myFirstLabel.textAlignment = .center;

        //text-wrap
        myFirstLabel.numberOfLines = 0;
        myFirstLabel.lineBreakMode = .byWordWrapping;
        
        myFirstLabel.frame = CGRect(x: (self.view.center.x - 150), y: 200, width: 300, height: 325);
        
        myFirstLabel.backgroundColor = UIColor.gray;
        
        view.addSubview(myFirstLabel);
        
        print("ViewController.genLabel():    Label added");

        return;
    }


    /********************************************************************************************************************************/
    /** @fcn        response(_ sender: UIButton!)
     *  @brief      pop up a message in response
     *  @details    x
     */
    /********************************************************************************************************************************/
    @objc func response(_ sender: UIButton!) {

        let alert:UIAlertController = UIAlertController(title:          "Pop-up",
                                                        message:        "message",
                                                        preferredStyle: UIAlertControllerStyle.alert);
        
        alert.addAction(UIAlertAction(title:   "OK",
                                      style:   UIAlertActionStyle.cancel,
                                      handler: nil));
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        
        appDelegate.window?.rootViewController?.present(alert, animated:true, completion:nil);
        
        print("ViewController.response():    Button response complete");
            
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        init?(coder aDecoder: NSCoder)
     *  @brief      backup restore initialization
     *  @details    x
     *
     *  @param      [in] (NSCoder) aDecoder - memory query device (backup access)
     */
    /********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }

}

