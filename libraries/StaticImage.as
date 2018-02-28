package libraries {
  import flash.display.Sprite;
  import flash.display.LoaderInfo;
  import flash.net.URLRequest;
  import flash.display.Loader;
  import flash.display.Bitmap;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import flash.display.DisplayObjectContainer;

  public class StaticImage extends Sprite{
      static var counter:uint = 0;

      protected var _fileURL:String = "images/no_image.png";
      protected var _width:uint = 75;
      protected var _height:uint = 75;
      protected var _value:String = "NoN";

      public function StaticImage(filename:String = "images/no_image.png", value:String = "NoN", posx:uint = 50, posy:uint = 50):void{
        _fileURL = filename;
        var loader:Loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
        trace("filename: "+_fileURL);
        loader.load(new URLRequest(_fileURL));
        _value = value;
        setPos(posx,posy);
      }

      public function onLoadComplete(e:Event):void{
        var loaderInfo:LoaderInfo = e.target as LoaderInfo;
        var loadedBitmap:Bitmap = loaderInfo.content as Bitmap;
        //var sprite:Sprite = new Sprite();
        //sprite.addChild(loadedBitmap);
        this.addChild((new Sprite()).addChild(loadedBitmap));
        width = _width;
        height = _height;
        //addChild(sprite);
      }

      public function setSize(width:uint, height:uint):void{
        this._width = width;
        this._height = height;
      }

      public function setPos(posx:uint, posy:uint):void{
        this.x = posx;
        this.y = posy;
      }

      public function set value(val:String):void{
        this._value = val;
      }

      public function get value():String{
        return this._value;
      }

      public function set filename(fileURL:String){
        this._fileURL = fileURL;
      }
  }
}
