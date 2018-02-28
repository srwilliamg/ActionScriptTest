package libraries {
  import flash.display.Sprite;
  import flash.display.LoaderInfo;
  import flash.net.URLRequest;
  import flash.display.Loader;
  import flash.display.Bitmap;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.display.DisplayObjectContainer;

  public class ImageContainer extends StaticImage{

      public function ImageContainer(filename:String = "images/no_image.png"):void{
        super(filename);
        this.assingnEvents();
      }

      public function assingnEvents(){
        this.addEventListener(MouseEvent.MOUSE_DOWN, drag);
        this.addEventListener(MouseEvent.MOUSE_UP, drop);
        this.addEventListener(MouseEvent.MOUSE_UP, testCollision);
      }

      public function removeEvents(){
        this.removeEventListener(MouseEvent.MOUSE_DOWN, drag);
        this.removeEventListener(MouseEvent.MOUSE_UP, drop);
        this.removeEventListener(MouseEvent.MOUSE_UP, testCollision);
      }

      public function drag(e:MouseEvent):void{
        e.target.startDrag();
      }

      public function drop(e:MouseEvent):void{
        e.target.stopDrag();
      }

      public function getChildrenOf(target:DisplayObjectContainer):Array
      {
        var children:Array = [];

        for (var i:uint = 1; i < target.numChildren; i++){
          children.push(target.getChildAt(i));
        }

         return children;
      }

      public function testCollision(e: Event):void{
        var children:Array = getChildrenOf(stage);

        for (var j = 0; j < children.length; j++) {
          if(children[j] == e.target)
          {continue;}
          else if (e.target.hitTestObject(children[j])) {
            trace(_value+" Collisioned with: "+children[j].value);
            if(_value == children[j].value){
              this.removeEvents();
            }
          counter++;
          }
        }
      trace("----------------------------------");
    }
  }
}
