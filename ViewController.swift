/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_2 - Graphics
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	11/12/15
 * 	@last rev	1/13/18
 *
 * 	@section	Opens
 * 	    generate reference graph (@ref  graph ref_iOS_Connect.jpg)
 *
 *  @note       to minimize extra uikit console prints set OS_ACTIVITY_MODE=disable" by editing the selected run Scheme and setting
 *              as an environment run variable
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class ViewController: UIViewController {

    var bezierView : BezierView!;
    var anoteView  : ANoteView!;
    
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
        DataBackup.loadData();													/* use here if backup needed						*/
        DataBackup.saveData();

        print("ViewController.init():        initialization complete");
            
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

        genButtons(self.view);
        
        //listen to 'Home' press
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil);
    
        print("ViewController.viewDidLoad(): load complete");
            
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        drawBezier()
     *  @brief      draw a line, circle and polygons
     *  @details    x
     */
    /********************************************************************************************************************************/
    func drawBezier() {
        
        let width  : CGFloat = 240.0;
        let height : CGFloat = 160.0;

        //@pre  check if avail
        if(self.bezierView != nil) {
            print("//@todo    bring to front");
            return;
        }
        
        //Gen demoView
        bezierView = BezierView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height));
        //Add to view
        self.view.addSubview(bezierView);
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        drawANote()
     *  @brief      draw aNote graphics
     *  @details    x
     */
    /********************************************************************************************************************************/
    func drawANote() {
        
        let width  : CGFloat = 240.0;
        let height : CGFloat = 160.0;
        
        //@pre  check if avail
        if(self.anoteView != nil) {
            print("//@todo    bring to front");
            return;
        }
        
        //Gen anoteView
        anoteView = ANoteView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                            y: self.view.frame.size.height/2 - height/2,
                                            width: width,
                                            height: height));
        
        //Add to view
        self.view.addSubview(anoteView);
        
        
    }
    

    
    /********************************************************************************************************************************/
    /** @fcn        genButtons(_ view:UIView)
     *  @brief      add buttons to the view
     *  @details    x
     */
    /********************************************************************************************************************************/
    func genButtons(_ view:UIView) {
        
        //Bezier Button
        let buttonOne      : UIButton  = UIButton(type: UIButtonType.system) as UIButton;
        buttonOne.frame = CGRect(x: self.view.center.x-(150/2)-90, y: 590, width: 150, height: 40);
        buttonOne.layer.cornerRadius = 10;
        buttonOne.clipsToBounds = true;
        buttonOne.backgroundColor = UIColor.gray;
        buttonOne.setTitle("Draw Bezier", for: UIControlState());
        buttonOne.addTarget(self, action: #selector(ViewController.bezierPressed(_:)), for:  .touchUpInside);
        
        //ANote Button
        let buttonTwo      : UIButton  = UIButton(type: UIButtonType.system) as UIButton;
        buttonTwo.frame = CGRect(x: self.view.center.x-(150/2)+90, y: 590, width: 150, height: 40);
        buttonTwo.layer.cornerRadius = 10;
        buttonTwo.clipsToBounds = true;
        buttonTwo.backgroundColor = UIColor.gray;
        buttonTwo.setTitle("Draw ANote", for: UIControlState());
        buttonTwo.addTarget(self, action: #selector(ViewController.anotePressed(_:)), for:  .touchUpInside);
        
        //Add to view
        view.addSubview(buttonOne);
        view.addSubview(buttonTwo);
        
        print("ViewController.genButton():   button added");
        
        return;
    }


    /********************************************************************************************************************************/
    /** @fcn        bezierPressed(_ sender: UIButton!)
     *  @brief      pop up a message in response
     *  @details    x
     */
    /********************************************************************************************************************************/
    @objc func bezierPressed(_ sender: UIButton!) {

        //Draw a line
        drawBezier();

        print("ViewController.bezPress():    button response complete");
            
        return;
    }
    

    /********************************************************************************************************************************/
    /** @fcn        anotePressed(_ sender: UIButton!)
     *  @brief      pop up a message in response
     *  @details    x
     */
    /********************************************************************************************************************************/
    @objc func anotePressed(_ sender: UIButton!) {
        
        //Draw anote graphics
        drawANote();
        
        print("ViewController.anotePress():  button response complete");
        
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

