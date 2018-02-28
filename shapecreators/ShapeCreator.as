package shapecreators
{
    import flash.display.DisplayObjectContainer;
    import flash.errors.IllegalOperationError;
    // ABSTRACT Class (should be subclassed and not instantiated)
    public class ShapeCreator{
        public function draw(cType:uint, target:DisplayObjectContainer,
        xLoc:int, yLoc:int, filename:String = null, w:uint = 0, h:uint = 0):void {

            var shape = this.createShape(cType);
            if(filename){
              shape.filename = filename;
              if(w && h){
                shape.setSize(w,h);
              }
            }
            shape.drawWidget();
            shape.setLoc(xLoc, yLoc); // set the x and y location
            target.addChild(shape); // add the sprite to the display list
        }
        // ABSTRACT Method (must be overridden in a subclass)
        protected function createShape(cType:uint):ShapeWidget{
            throw new IllegalOperationError("Abstract method:must be overridden in a subclass");
            return null;
        }
    }
}
