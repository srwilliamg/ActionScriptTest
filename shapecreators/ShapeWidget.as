package shapecreators
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;
    // ABSTRACT Class (should be subclassed and not instantiated)
    internal class ShapeWidget extends Sprite
    {
        static var counter:uint = 0;
        // ABSTRACT Method (should be implemented in subclass)
        internal function drawWidget():void {}
        internal function setLoc(xLoc:int, yLoc:int):void {
            this.x = xLoc;
            this.y = yLoc;
        }

        internal function assingnEvents(){
          this.addEventListener(MouseEvent.MOUSE_DOWN, drag);
          this.addEventListener(MouseEvent.MOUSE_UP, drop);
          this.addEventListener(MouseEvent.MOUSE_UP, testCollision);
        }

        internal function drag(e:MouseEvent):void{
         e.target.startDrag();
        }

        internal function drop(e:MouseEvent):void{
          e.target.stopDrag();
        }

        private function getChildrenOf(target:DisplayObjectContainer):Array
        {
           var children:Array = [];

           for (var i:uint = 1; i < target.numChildren; i++)
              children.push(target.getChildAt(i));

           return children;
        }

        private function testCollision(e: Event) {
            var children:Array = getChildrenOf(stage);
            //trace(children);
            for (var j = 0; j < children.length; j++) {
                if(children[j] == e.target){continue;}
                else if (e.target.hitTestObject(children[j])) {
                    trace(e.target+"Booom!! Collision with: "+children[j]);
                    counter++;
                    trace("----------------------------------------------"+counter);
                }
            }
        }
    }
}
