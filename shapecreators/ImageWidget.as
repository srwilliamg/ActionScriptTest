package shapecreators {
  import flash.display.Sprite;
  import flash.display.LoaderInfo;
  import flash.net.URLRequest;
  import flash.display.Loader;
  import flash.display.Bitmap;
  import flash.events.Event;

    internal class ImageWidget extends ShapeWidget {

        private var _fileURL:String ="images/no_image.png";
        private var _width:uint = 75;
        private var _height:uint = 75;

        override internal function drawWidget( ):void
        {
          var loader:Loader = new Loader();
          loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
          loader.load(new URLRequest(_fileURL));
          this.assingnEvents();
        }

        internal function onLoadComplete(e:Event):void{
          var loaderInfo:LoaderInfo = e.target as LoaderInfo;
          var loadedBitmap:Bitmap = loaderInfo.content as Bitmap;
          //var sprite:Sprite = new Sprite();
          //sprite.addChild(loadedBitmap);
          this.addChild((new Sprite()).addChild(loadedBitmap));
          width = _width;
          height = _height;
          //addChild(sprite);
        }

        public function setSize(width:uint, height:uint){
          this._width = width;
          this._height = height;
        }

        public function set filename(fileURL:String){
          this._fileURL = fileURL;
        }
    }
}
