/************************************************************************************************************************************/
/** @file       ANoteView.swift
 *  @project    x
 *  @brief      x
 *  @details    x
 *
 *  @notes      x
 *
 *  @section    Opens
 *      none current
 *
 *  @section    Folder Description
 *      W  - Full Width
 *      H  - Full Height
 *      xT - Tab Width
 *      yT - Tab Height
 *      cF - Folder Color
 *      cA - Arrow Color
 *
 *  @note   you can apply a single value of radius to UIBezier path, with applied corner selections thus folder has two components
 *
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property of Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit
let xOffs : CGFloat = 40;
let yOffs : CGFloat = 20;

let W  : CGFloat = 150;
let H  : CGFloat = 100;
let xT : CGFloat = 40;
let yT : CGFloat = 20;
let rT : CGFloat = 14;
let rF : CGFloat = 20;


class ANoteView : UIView {

    //Vars
    var path    : UIBezierPath!;

    //Colors
    let cF = UIColor.gray;
    let cA = UIColor.cyan;
    
    //Points
    let points = [CGPoint(x:0, y:0),    //P1
                  CGPoint(x:xT, y:0),   //P2
                  CGPoint(x:xT, y:yT),  //P3
                  CGPoint(x:W, y:yT),   //P4
                  CGPoint(x:W, y:H),    //P5
                  CGPoint(x:0, y:H)];   //P6
    
    /********************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override init(frame: CGRect) {
        
        //Init path
        path = UIBezierPath();
        
        super.init(frame: frame);
        
        // Specify line width.
        path.lineWidth = 5;
        
        // Specify the point that the path should start get drawn.
        //?let p = CGPoint(x: 0/*points[0].x+xOffs*/, y: 0/*points[0].y+yOffs*/);
        //?path.move(to: p);
        
        
        if(verbose) { print("ANoteView.init():             initialization complete"); }
        
        self.backgroundColor = UIColor.lightGray;
        
        return;
    }
    

    /********************************************************************************************************************************/
    /** @fcn        override func draw(_ rect: CGRect)
     *  @brief      draw the view on request
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func draw(_ rect: CGRect) {
        
//...   let N = getPointCt();

        drawFolder();
       
        if(verbose) { print("ANoteView.draw():             ANote render complete"); }
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        drawFolder()
     *  @brief      draw folder shape
     *  @details    x
     */
    /********************************************************************************************************************************/
    func drawFolder() {
        
        let x0 : CGFloat = (rT+xOffs);
        let y0 : CGFloat = (yOffs);
        let x1 : CGFloat = (x0+xT);                             /* xT                                                               */
        let y1 : CGFloat = (y0);
        let x2 : CGFloat = (x1+rT);
        let y2 : CGFloat = (y1+rT);
        let x3 : CGFloat = (x2);
        let y3 : CGFloat = (yT+y1);                             /* yT                                                               */
        let x4 : CGFloat = (x3+rT);
        let y4 : CGFloat = (y3+rT);
        let x5 : CGFloat = (W+x0);                              /* W                                                                */
        let y5 : CGFloat = (y4);
        let x6 : CGFloat = (x5+rT);
        let y6 : CGFloat = (y5+rT);
        let x7 : CGFloat = (x6);
        let y7 : CGFloat = (H+y0);                              /* H                                                                */
        let x8 : CGFloat = (x7-rT);
        let y8 : CGFloat = (y7+rT);
        let x9 : CGFloat = (x8-W+xOffs-rT);
        let y9 : CGFloat = (y8-rT);
        
        
        // starting point for the path (top left)
        path.move(to: CGPoint(x: x0, y: y0));
        
        //from 0..1..2..3..4..5..0
        
        //0b->1a (S)
        //(line)
        path.addLine(to: CGPoint(x: 2*xOffs, y: y1));
        
        //(curve)
        path.addArc(withCenter: CGPoint(x: x1, y: y2),
                    radius: rT,
                    startAngle: CGFloat(3*Double.pi/2),         // 3*π/2 = 270 degrees = straight up
            endAngle:   CGFloat(0),                     // 0     = 0 degrees  = straight right
            clockwise:  true);                          // clockwise
        
        //1b->2a (S)
        //(line)
        path.addLine(to: CGPoint(x: x3, y: y3));
        
        //(curve)
        path.addArc(withCenter: CGPoint(x: x4, y: y3),
                    radius: rT,
                    startAngle: CGFloat(Double.pi),            // π   = 180 degrees = straight left
            endAngle:   CGFloat(Double.pi/2),          // π/2 = 90 degrees  = straight down
            clockwise:  false);                        // counter-clockwise
        
        //2b->3a (S)
        //(line)
        path.addLine(to: CGPoint(x: x5, y: y5));
        
        //(curve)
        path.addArc(withCenter: CGPoint(x: x5, y: y6),
                    radius: rT,
                    startAngle: CGFloat(3*Double.pi/2),         // 3*π/2 = 270 degrees = straight up
            endAngle:   CGFloat(0),                     // 0     = 0 degrees   = straight right
            clockwise:  true);                          // clockwise
        
        //3b->4a (S)
        //(line)
        path.addLine(to: CGPoint(x: x7, y: y7));
        
        //(curve)
        path.addArc(withCenter: CGPoint(x: x8, y:y7),
                    radius:     rT,
                    startAngle: CGFloat(0),                     // 0     = 0 degrees = straight right
            endAngle:   CGFloat(Double.pi/2),           // π/2   = 90 degrees  = straight down
            clockwise:  true);                          // clockwise
        
        //4b->5a (S)
        //(line)
        path.addLine(to: CGPoint(x: x9-(xOffs-rT), y: y9+rT));
        
        //(curve)
        path.addArc(withCenter: CGPoint(x: x9-(xOffs-rT), y: y9),
                    radius:     rT,
                    startAngle: CGFloat(Double.pi/2),           // π/2   = 90 degrees  = straight down
            endAngle:   CGFloat(Double.pi),             // π   = 180 degrees = straight left
            clockwise:  true);                          // clockwise
        
        //5b->0a (S)
        //(line)
        path.addLine(to: CGPoint(x: x9-rT-(xOffs-rT), y: y0+rT));
        
        //(curve)
        path.addArc(withCenter: CGPoint(x: x9-(xOffs-rT), y: y0+rT),
                    radius:     rT,
                    startAngle: CGFloat(Double.pi),             // π   = 180 degrees = straight left
            endAngle:   CGFloat(3*Double.pi/2),         // 3*π/2 = 270 degrees = straight up
            clockwise:  true);                          // clockwise
        
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill();
        path.fill();
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke();
        path.stroke();
        

        if(verbose) { print("ANoteView.drawFolder():       folder render complete"); }
        
        return;
    }

    
    
    /********************************************************************************************************************************/
    /** @fcn        getPointCt() -> Int
     *  @brief      get point count
     *  @details    x
     */
    /********************************************************************************************************************************/
    func getPointCt() -> Int {
        return points.count;
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
