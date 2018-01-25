/************************************************************************************************************************************/
/** @file       BezierView.swift
 *  @project    x
 *  @brief      x
 *  @details    x
 *
 *  @notes      x
 *
 *  @section    Opens
 *      none current
 *
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class BezierView : UIView {

    var path  : UIBezierPath!;
    var path2 : UIBezierPath!;
    var path3 : UIBezierPath!;
    
    
    /********************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override init(frame: CGRect) {

        //@note     initialization of additional vars

        super.init(frame: frame);

        //@note     finalization of initialization
        

        if(verbose) { print("BezierView.init():            initialization complete"); }

        self.backgroundColor = UIColor.darkGray;
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        override func draw(_ rect: CGRect)
     *  @brief      called on view render
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func draw(_ rect: CGRect) {

        createRectangle();

        createTriangle();

        createCircle();
        
        if(verbose) { print("BezierView.draw():            bezier render complete"); }
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        createRectangle()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func createRectangle() {
        
        // Initialize the path.
        path = UIBezierPath();

        // Specify line width.
        path.lineWidth = 5;
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0));
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height));
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height));
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0));
        
        // Close the path. This will create the last line automatically.
        path.close();
        
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill();
        path.fill();
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke();
        path.stroke();


        if(verbose) { print("BezierView.createRect():      rectangle render complete"); }
        
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        createTriangle()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func createTriangle() {
        
        path2 = UIBezierPath();
        
        path2.move(to: CGPoint(x: self.frame.width/2, y: 30));
        path2.addLine(to: CGPoint(x: 30, y: self.frame.size.height-30));
        path2.addLine(to: CGPoint(x: self.frame.size.width-30, y: self.frame.size.height-30));
        path2.close();
        
        // Specify line width.
        path2.lineWidth = 2;
        
        // Close the path. This will create the last line automatically.
        path2.close();

        // Specify the fill color and apply it to the path.
        UIColor.white.setFill();
        path2.fill();
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke();
        path2.stroke();
        

        if(verbose) { print("BezierView.createTri():       triangle render complete"); }

        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        createCircle()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func createCircle() {
    
        path3 = UIBezierPath(arcCenter: CGPoint(x: 40,y: 40),
                             radius: CGFloat(20),
                             startAngle: CGFloat(0),
                             endAngle:CGFloat(Double.pi * 2),
                             clockwise: true);
        
        // Specify line width.
        path3.lineWidth = 2;
        
        // Close the path. This will create the last line automatically.
        path3.close();

        // Specify the fill color and apply it to the path.
        UIColor.white.setFill();
        path3.fill();
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke();
        path3.stroke();


        if(verbose) { print("BezierView.createCirc():      circle render complete"); }
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        init?(coder aDecoder: NSCoder)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
