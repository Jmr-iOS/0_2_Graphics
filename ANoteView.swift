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
let xOffs : CGFloat = 30;
let yOffs : CGFloat = 30;

let W  : CGFloat = 120;
let H  : CGFloat = 85;
let xT : CGFloat = 40;
let yT : CGFloat = 20;
let rT : CGFloat = 12;
let rF : CGFloat = 25;


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
        
        drawFolder();
       
        if(verbose) { print("ANoteView.draw():             ANote render complete"); }
        
        return;
    }

    //Angle Definitions
    let RIGHT = CGFloat(0);
    let DOWN  = CGFloat(Double.pi/2);
    let LEFT  = CGFloat(Double.pi);
    let UP    = CGFloat(3*Double.pi/2);

    /********************************************************************************************************************************/
    /** @fcn        drawFolder()
     *  @brief      draw folder shape
     *  @details    x
     */
    /********************************************************************************************************************************/
    func drawFolder() {
        
        //Main Points
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
        let x6 : CGFloat = (x5+rF);
        let y6 : CGFloat = (y5+rF);
        let x7 : CGFloat = (x6);
        let y7 : CGFloat = (H+y0);                              /* H                                                                */
        let x8 : CGFloat = (x7-rF);
        let y8 : CGFloat = (y7+rF);
        let x9 : CGFloat = (x8-W+xOffs-rT);
        let y9 : CGFloat = (y8-rT);
        let xA : CGFloat = (x9-xOffs+rT);
        let yA : CGFloat = (y9 + rT);
        let xB : CGFloat = (xA-rT);
        let yB : CGFloat = (y0+rT);

        //Main Locations
        let P0 = CGPoint(x: x0, y: y0);
//      let P1 = CGPoint(x: x1, y: y1);
//      let P2 = CGPoint(x: x2, y: y2);
        let P3 = CGPoint(x: x3, y: y3);
//      let P4 = CGPoint(x: x4, y: y4);
        let P5 = CGPoint(x: x5, y: y5);
//      let P6 = CGPoint(x: x6, y: y6);
        let P7 = CGPoint(x: x7, y: y7);
//      let P8 = CGPoint(x: x8, y: y8);
//      let P9 = CGPoint(x: x9, y: y9);
//      let PA = CGPoint(x: xA, y: yA);
        let PB = CGPoint(x: xB, y: yB);

        //Center Points
        let P1N = CGPoint(x: x1, y: y2);
        let P3N = CGPoint(x: x4, y: y3);
        let P5N = CGPoint(x: x5, y: y6);
        let P7N = CGPoint(x: x8, y:y7);
        let PQ  = CGPoint(x: xA+18, y: y9-18);
        let PAN = CGPoint(x: xA, y: yB);

        // starting point for the path (top left)
        path.move(to: P0);
        
        //from 0..1..2..3..4..5..0
        
        //0b->1a (S)
        //(line)
        //?path.addLine(to: CGPoint(x: x0, y: y1));     (not drawn?)
        
        //(curve)
        path.addArc(withCenter: P1N, radius: rT, startAngle: UP, endAngle: RIGHT, clockwise: true);
        
        //1b->2a (S)
        //(line)
        path.addLine(to: P3);
        
        //(curve)
        path.addArc(withCenter: P3N, radius: rT, startAngle: LEFT, endAngle: DOWN, clockwise: false);
        
        //2b->3a (S)
        //(line)
        path.addLine(to: P5);
        
        //(curve)
        path.addArc(withCenter: P5N, radius: rF, startAngle: UP, endAngle: RIGHT, clockwise: true);
        
        //3b->4a (S)
        //(line)
        path.addLine(to: P7);
        
        //(curve)
        path.addArc(withCenter: P7N, radius: rF, startAngle: RIGHT, endAngle: DOWN, clockwise: true);
        
        //4b->5a (S)
        //(line)
        path.addLine(to: CGPoint(x: xA+18, y: yA));
        
        //(curve)
        path.addArc(withCenter: PQ, radius: rT+18, startAngle: DOWN, endAngle: LEFT, clockwise: true);
        
        //5b->0a (S)
        //(line)
        path.addLine(to: PB);
        
        //(curve)
        path.addArc(withCenter: PAN, radius: rT, startAngle: LEFT, endAngle: UP, clockwise: true);

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
