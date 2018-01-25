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
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property of Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


//**********************************************************************************************************************************//
//                                                      STRUCTS                                                                     //
//**********************************************************************************************************************************//
struct Dims {
    var w : CGFloat;                                                    /* width                                                    */
    var h : CGFloat;                                                    /* height                                                   */
    var r : CGFloat;                                                    /* radius                                                   */
};

struct Folder {
    var dims   : Dims;                                                  /* outer folder dimensions including tab                    */
    var offs   : CGPoint;                                               /* origin offset (upper left)                               */
    var tab    : Dims;                                                  /* tab dimensions                                           */
};

//pointed downwards, origin at direct center of triangle
struct Arrow {
    var orig : CGPoint;                                                 /* origin                                                   */
    var w : CGFloat;                                                    /* width                                                    */
    var h : CGFloat;                                                    /* height                                                   */
};


//**********************************************************************************************************************************//
//                                               (ANoteView : UIView)                                                               //
//**********************************************************************************************************************************//
class ANoteView : UIView {

    //Vars
    var folderPath : UIBezierPath!;
    let arrowPath  : UIBezierPath!;
    
    //Colors
    var cF = UIColor.gray;
    var cA = UIColor.cyan;

    
    /********************************************************************************************************************************/
    /** @fcn        init()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override init(frame: CGRect) {
        
        //Init path
        folderPath = UIBezierPath();
        arrowPath  = UIBezierPath();
        
        super.init(frame: frame);
        
        // Specify line width.
        folderPath.lineWidth = 1;
        arrowPath.lineWidth  = 1;
        
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
        
        //Offset
        let xOffs : CGFloat = 20;
        let yOffs : CGFloat = 40;
        
        //Dims
        let W  : CGFloat = 120;
        let H  : CGFloat = 85;
        let xT : CGFloat = 40;
        let yT : CGFloat = 20;
        
        //Radii
        let rT : CGFloat = 5;
        let rF : CGFloat = 25;

        //Arrow
        let orig = CGPoint(x: 95, y: 100);
        let aW : CGFloat = 60;
        let aH : CGFloat = 20;
        
        //Gen Struct
        let dims =    Dims(w: W,     h: H,    r: rF);
        let tabs =    Dims(w: xT,    h: yT,   r: rT);
        let offs = CGPoint(x: xOffs, y: yOffs);
        
        //Gen Containers
        let f = Folder(dims: dims, offs: offs, tab:  tabs);
        let a = Arrow(orig: orig, w: aW, h: aH);
        
        
        //Draw
        drawFolder(folder: f);
        drawArrow(arrow: a);
//      drawBookmark(bookmark: b);
       
        if(verbose) { print("ANoteView.draw():             ANote render complete"); }
        
        return;
    }

    //Angle Definitions
    let RIGHT = CGFloat(0);
    let DOWN  = CGFloat(Double.pi/2);
    let LEFT  = CGFloat(Double.pi);
    let UP    = CGFloat(3*Double.pi/2);
    
    
    /********************************************************************************************************************************/
    /** @fcn        drawFolder(folder : Folder)
     *  @brief      draw folder shape
     *  @details    x
     */
    /********************************************************************************************************************************/
    func drawFolder(folder : Folder) {
        
        //Grab Shorthand
        let xOffs = folder.offs.x;
        let yOffs = folder.offs.y;
        let W     = folder.dims.w;
        let H     = folder.dims.h;
        let xT    = folder.tab.w;
        let yT    = folder.tab.h;
        let rF    = folder.dims.r;
        let rT    = folder.tab.r;

        
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
        let PQ  = CGPoint(x: x9, y: (y8-xOffs));
        let PAN = CGPoint(x: xA, y: yB);

        // starting point for the path (top left)
        folderPath.move(to: P0);
        
        //from 0..1..2..3..4..5..0
        
        //0b->1a (S)
        //(line)
        //?path.addLine(to: CGPoint(x: x0, y: y1));     (not drawn?)
        
        //(curve)
        folderPath.addArc(withCenter: P1N, radius: rT, startAngle: UP, endAngle: RIGHT, clockwise: true);
        
        //1b->2a (S)
        //(line)
        folderPath.addLine(to: P3);
        
        //(curve)
        folderPath.addArc(withCenter: P3N, radius: rT, startAngle: LEFT, endAngle: DOWN, clockwise: false);
        
        //2b->3a (S)
        //(line)
        folderPath.addLine(to: P5);
        
        //(curve)
        folderPath.addArc(withCenter: P5N, radius: rF, startAngle: UP, endAngle: RIGHT, clockwise: true);
        
        //3b->4a (S)
        //(line)
        folderPath.addLine(to: P7);
        
        //(curve)
        folderPath.addArc(withCenter: P7N, radius: rF, startAngle: RIGHT, endAngle: DOWN, clockwise: true);
        
        //4b->5a (S)
        //(line)
        folderPath.addLine(to: CGPoint(x: x9, y: yA));
        
        //(curve)
        folderPath.addArc(withCenter: PQ, radius: xOffs, startAngle: DOWN, endAngle: LEFT, clockwise: true);
        
        //5b->0a (S)
        //(line)
        folderPath.addLine(to: PB);
        
        //(curve)
        folderPath.addArc(withCenter: PAN, radius: rT, startAngle: LEFT, endAngle: UP, clockwise: true);

        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill();
        folderPath.fill();
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke();
        folderPath.stroke();
        

        if(verbose) { print("ANoteView.drawFolder():       folder render complete"); }
        
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        drawArrow(arrow : Arrow)
     *  @brief      draw folder shape
     *  @details    pointed downwards, origin at direct center of triangle
     */
    /********************************************************************************************************************************/
    func drawArrow(arrow : Arrow) {
        
        //Calculate Top-Left
        let x = arrow.orig.x - (arrow.w/2);
        let y = arrow.orig.y - (arrow.h/2);
        let w = arrow.w;
        let h = arrow.h;
        let xm = arrow.orig.x;
        
        let P0 = CGPoint(x: x,     y: y);
        let P1 = CGPoint(x: (x+w), y: y);
        let P2 = CGPoint(x: xm,    y: (y+h));
        
        //P1 - Top-Left
        arrowPath.move(to: P0);
        arrowPath.addLine(to: P1);
        
        //P2 - Top-Right
        arrowPath.addLine(to: P2);
    
        //P3 - Bottom-Center
        arrowPath.addLine(to: P0);
        
        
        // Specify the fill color and apply it to the path.
        UIColor.gray.setFill();
        arrowPath.fill();
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke();
        arrowPath.stroke();
        
        
        if(verbose) { print("ANoteView.drawArrow():        arrow render complete"); }
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        init?(coder aDecoder: NSCoder)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) {
        arrowPath = UIBezierPath();
        super.init(coder: aDecoder)
    }
}
